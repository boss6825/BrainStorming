#!/usr/bin/env bash
# Atomic single-model text capture wrapper around cursor-agent.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/cursor-agent.sh --model MODEL --out FILE --prompt-file FILE
  scripts/cursor-agent.sh --model MODEL --out FILE < prompt.txt

Options:
  --model MODEL       Exact ID from cursor-agent --list-models.
  --out FILE          Required destination file.
  --prompt-file FILE  Read the full prompt from FILE; otherwise read stdin.
  -h, --help          Print usage.

Environment:
  CURSOR_AGENT_BIN  Executable path/name; defaults to cursor-agent.
EOF
}

CURSOR_AGENT_BIN="${CURSOR_AGENT_BIN:-cursor-agent}"

model=""
out=""
prompt_file=""
model_set=0
out_set=0
prompt_file_set=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --model)
      if [[ "$model_set" -eq 1 ]]; then
        echo "error: --model specified more than once" >&2
        exit 2
      fi
      if [[ $# -lt 2 || -z "${2:-}" || "${2:-}" == -* ]]; then
        echo "error: --model requires a MODEL argument" >&2
        exit 2
      fi
      model="$2"
      model_set=1
      shift 2
      ;;
    --out)
      if [[ "$out_set" -eq 1 ]]; then
        echo "error: --out specified more than once" >&2
        exit 2
      fi
      if [[ $# -lt 2 || -z "${2:-}" || "${2:-}" == -* ]]; then
        echo "error: --out requires a FILE argument" >&2
        exit 2
      fi
      out="$2"
      out_set=1
      shift 2
      ;;
    --prompt-file)
      if [[ "$prompt_file_set" -eq 1 ]]; then
        echo "error: --prompt-file specified more than once" >&2
        exit 2
      fi
      if [[ $# -lt 2 || -z "${2:-}" || "${2:-}" == -* ]]; then
        echo "error: --prompt-file requires a FILE argument" >&2
        exit 2
      fi
      prompt_file="$2"
      prompt_file_set=1
      shift 2
      ;;
    *)
      echo "error: unknown flag: $1" >&2
      exit 2
      ;;
  esac
done

if [[ "$model_set" -eq 0 || "$out_set" -eq 0 ]]; then
  echo "error: --model and --out are required" >&2
  exit 2
fi

# Preserve trailing newlines (command substitution strips them).
read_prompt() {
  local content
  content=$(cat -- "$@"; printf x) || return 1
  printf '%s' "${content%x}"
}

if [[ "$prompt_file_set" -eq 1 ]]; then
  if [[ ! -r "$prompt_file" ]]; then
    echo "error: prompt file missing or unreadable: $prompt_file" >&2
    exit 3
  fi
  if ! prompt="$(read_prompt "$prompt_file")"; then
    echo "error: failed to read prompt file: $prompt_file" >&2
    exit 3
  fi
else
  if [[ -t 0 ]]; then
    echo "error: no --prompt-file and stdin is a TTY; pipe a prompt or pass --prompt-file" >&2
    exit 2
  fi
  if ! prompt="$(read_prompt)"; then
    echo "error: failed to read prompt from stdin" >&2
    exit 3
  fi
fi

if [[ -z "${prompt//[[:space:]]/}" ]]; then
  echo "error: prompt is empty or whitespace-only" >&2
  exit 3
fi

if [[ "$CURSOR_AGENT_BIN" == */* ]]; then
  if [[ ! -e "$CURSOR_AGENT_BIN" || ! -x "$CURSOR_AGENT_BIN" ]]; then
    echo "error: CURSOR_AGENT_BIN unavailable: $CURSOR_AGENT_BIN" >&2
    exit 4
  fi
else
  if ! command -v "$CURSOR_AGENT_BIN" >/dev/null 2>&1; then
    echo "error: CURSOR_AGENT_BIN unavailable: $CURSOR_AGENT_BIN" >&2
    exit 4
  fi
fi

out_dir="$(dirname -- "$out")"
if ! mkdir -p -- "$out_dir"; then
  echo "error: failed to create destination directory: $out_dir" >&2
  exit 5
fi

stdout_tmp=""
stderr_tmp=""
out_tmp=""

cleanup() {
  rm -f -- "${stdout_tmp:-}" "${stderr_tmp:-}" "${out_tmp:-}"
}
trap cleanup EXIT

stdout_tmp="$(mktemp "${out_dir}/.cursor-agent-stdout.XXXXXX")" || {
  echo "error: failed to create temp stdout file" >&2
  exit 5
}
stderr_tmp="$(mktemp "${out_dir}/.cursor-agent-stderr.XXXXXX")" || {
  echo "error: failed to create temp stderr file" >&2
  exit 5
}
out_tmp="$(mktemp "${out_dir}/.cursor-agent-out.XXXXXX")" || {
  echo "error: failed to create temp output file" >&2
  exit 5
}

atomic_write() {
  local src="$1"
  # Copy to out_tmp then rename so --out is always replaced atomically.
  if ! cp -- "$src" "$out_tmp"; then
    echo "error: failed to stage output for $out" >&2
    exit 5
  fi
  if ! mv -f -- "$out_tmp" "$out"; then
    echo "error: failed to write $out" >&2
    exit 5
  fi
  out_tmp=""
}

write_failure_file() {
  local upstream_exit="$1"
  local reason="$2"
  local stderr_body=""

  if [[ -f "$stderr_tmp" ]]; then
    stderr_body="$(cat -- "$stderr_tmp"; printf x)"
    stderr_body="${stderr_body%x}"
  fi

  {
    printf '%s\n' "# Cursor panel response failed"
    printf '\n'
    printf '%s\n' "- Model: \`${model}\`"
    printf '%s\n' "- Wrapper exit: \`6\`"
    printf '%s\n' "- Cursor Agent exit: \`${upstream_exit}\`"
    printf '%s\n' "- Reason: \`${reason}\`"
    printf '\n'
    printf '%s\n' "## stderr"
    printf '\n'
    printf '%s\n' '```text'
    printf '%s' "$stderr_body"
    if [[ -n "$stderr_body" && "${stderr_body: -1}" != $'\n' ]]; then
      printf '\n'
    fi
    printf '%s\n' '```'
  } >"$out_tmp" || {
    echo "error: failed to stage failure file for $out" >&2
    exit 5
  }

  if ! mv -f -- "$out_tmp" "$out"; then
    echo "error: failed to write failure file $out" >&2
    exit 5
  fi
  out_tmp=""
}

set +e
"$CURSOR_AGENT_BIN" -p "$prompt" --model "$model" --output-format text --force \
  >"$stdout_tmp" 2>"$stderr_tmp"
upstream_exit=$?
set -e

if [[ "$upstream_exit" -eq 0 ]] && grep -q '[^[:space:]]' "$stdout_tmp"; then
  atomic_write "$stdout_tmp"
  if [[ -s "$stderr_tmp" ]]; then
    cat -- "$stderr_tmp" >&2 || true
  fi
  exit 0
fi

if [[ "$upstream_exit" -ne 0 ]]; then
  reason="non-zero invocation"
else
  reason="empty response"
fi

write_failure_file "$upstream_exit" "$reason"
exit 6
