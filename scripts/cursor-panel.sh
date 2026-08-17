#!/usr/bin/env bash
# Fan one prompt to requested Cursor models concurrently.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/cursor-panel.sh --out-dir DIR --model MODEL [--model MODEL ...] \
    --prompt-file FILE
  scripts/cursor-panel.sh --out-dir DIR --model MODEL [--model MODEL ...] \
    < prompt.txt

Options:
  --out-dir DIR       Destination panel directory.
  --model MODEL       Repeat once per exact model ID.
  --prompt-file FILE  Shared base prompt; otherwise read stdin.
  -h, --help          Print usage.

Environment:
  CURSOR_AGENT_WRAPPER  Wrapper path; defaults to cursor-agent.sh beside this script.
  CURSOR_AGENT_BIN      Inherited by each wrapper; defaults there to cursor-agent.
EOF
}

SCRIPT_DIR="$(cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CURSOR_AGENT_WRAPPER="${CURSOR_AGENT_WRAPPER:-${SCRIPT_DIR}/cursor-agent.sh}"

out_dir=""
prompt_file=""
out_dir_set=0
prompt_file_set=0
models=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      usage
      exit 0
      ;;
    --out-dir)
      if [[ "$out_dir_set" -eq 1 ]]; then
        echo "error: --out-dir specified more than once" >&2
        exit 2
      fi
      if [[ $# -lt 2 || -z "${2:-}" || "${2:-}" == -* ]]; then
        echo "error: --out-dir requires a DIR argument" >&2
        exit 2
      fi
      out_dir="$2"
      out_dir_set=1
      shift 2
      ;;
    --model)
      if [[ $# -lt 2 || -z "${2:-}" || "${2:-}" == -* ]]; then
        echo "error: --model requires a MODEL argument" >&2
        exit 2
      fi
      models+=("$2")
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

if [[ "$out_dir_set" -eq 0 ]]; then
  echo "error: --out-dir is required" >&2
  exit 2
fi

if [[ "${#models[@]}" -eq 0 ]]; then
  echo "error: at least one --model is required" >&2
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
  if ! shared_prompt="$(read_prompt "$prompt_file")"; then
    echo "error: failed to read prompt file: $prompt_file" >&2
    exit 3
  fi
else
  if [[ -t 0 ]]; then
    echo "error: no --prompt-file and stdin is a TTY; pipe a prompt or pass --prompt-file" >&2
    exit 2
  fi
  if ! shared_prompt="$(read_prompt)"; then
    echo "error: failed to read prompt from stdin" >&2
    exit 3
  fi
fi

if [[ -z "${shared_prompt//[[:space:]]/}" ]]; then
  echo "error: prompt is empty or whitespace-only" >&2
  exit 3
fi

if [[ ! -e "$CURSOR_AGENT_WRAPPER" || ! -x "$CURSOR_AGENT_WRAPPER" ]]; then
  echo "error: CURSOR_AGENT_WRAPPER unavailable: $CURSOR_AGENT_WRAPPER" >&2
  exit 4
fi

sanitize_model_filename() {
  local id="$1"
  local s

  s="$(printf '%s' "$id" | tr '[:upper:]' '[:lower:]')"
  s="${s//\//-}"
  s="${s//\\/-}"
  s="$(printf '%s' "$s" | sed -E 's/[^a-z0-9._-]+/-/g; s/-{2,}/-/g; s/^[.-]+//; s/[.-]+$//')"

  if [[ -z "$s" ]]; then
    return 1
  fi
  printf '%s.md' "$s"
}

sanitized_names=()
output_paths=()

for model in "${models[@]}"; do
  if ! sane="$(sanitize_model_filename "$model")"; then
    echo "error: model ID sanitizes to an empty filename: $model" >&2
    exit 5
  fi
  if [[ "${#sanitized_names[@]}" -gt 0 ]]; then
    for existing in "${sanitized_names[@]}"; do
      if [[ "$existing" == "$sane" ]]; then
        echo "error: sanitized filename collision for model '$model' → $sane" >&2
        exit 5
      fi
    done
  fi
  sanitized_names+=("$sane")
  output_paths+=("${out_dir}/${sane}")
done

if ! mkdir -p -- "$out_dir"; then
  echo "error: failed to create output directory: $out_dir" >&2
  exit 5
fi

write_envelope_prompt() {
  local dest="$1"
  local model_id="$2"
  {
    printf '%s\n' "COUNCIL RUNTIME ENVELOPE"
    printf '\n'
    printf '%s\n' "Runtime Cursor model ID: ${model_id}"
    printf '%s\n' "Follow the role and cognitive-style-inspired lens assigned to this exact ID in"
    printf '%s\n' "the prompt below. You are an independent panel member. Write the final answer"
    printf '%s\n' "to stdout only. Do not edit the repository. Do not refer to unseen panel members."
    printf '\n'
    printf '%s\n' "---"
    printf '%s' "$shared_prompt"
  } >"$dest"
}

write_marker_file() {
  local dest="$1"
  local model_id="$2"
  local wrapper_exit="$3"
  local agent_exit="$4"
  local reason="$5"
  local stderr_body="${6:-}"
  local tmp

  tmp="$(mktemp "${out_dir}/.cursor-panel-marker.XXXXXX")" || return 1
  {
    printf '%s\n' "# Cursor panel response failed"
    printf '\n'
    printf '%s\n' "- Model: \`${model_id}\`"
    printf '%s\n' "- Wrapper exit: \`${wrapper_exit}\`"
    printf '%s\n' "- Cursor Agent exit: \`${agent_exit}\`"
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
  } >"$tmp" || {
    rm -f -- "$tmp"
    return 1
  }
  mv -f -- "$tmp" "$dest"
}

interrupted=0
pids=()
prompt_tmps=()

cleanup_prompt_tmps() {
  local f
  if [[ "${#prompt_tmps[@]}" -gt 0 ]]; then
    for f in "${prompt_tmps[@]}"; do
      rm -f -- "$f"
    done
  fi
}
trap cleanup_prompt_tmps EXIT

kill_pid_tree() {
  local pid="$1"
  local child
  # Recursively terminate descendants, then the worker itself.
  while read -r child; do
    [[ -n "$child" ]] || continue
    kill_pid_tree "$child"
  done < <(pgrep -P "$pid" 2>/dev/null || true)
  kill -TERM "$pid" 2>/dev/null || true
}

on_signal() {
  interrupted=1
  local pid
  if [[ "${#pids[@]}" -gt 0 ]]; then
    for pid in "${pids[@]}"; do
      kill_pid_tree "$pid"
    done
  fi
}
trap on_signal INT TERM

# Launch all workers before awaiting any.
i=0
for model in "${models[@]}"; do
  out_path="${output_paths[$i]}"
  prompt_tmp="$(mktemp "${out_dir}/.cursor-panel-prompt.XXXXXX")" || {
    echo "error: failed to create temp prompt file" >&2
    exit 5
  }
  prompt_tmps+=("$prompt_tmp")
  write_envelope_prompt "$prompt_tmp" "$model"

  (
    exec "$CURSOR_AGENT_WRAPPER" --model "$model" --out "$out_path" --prompt-file "$prompt_tmp"
  ) &
  pids+=("$!")
  i=$((i + 1))
done

fail_count=0
success_count=0

for i in "${!pids[@]}"; do
  pid="${pids[$i]}"
  model="${models[$i]}"
  out_path="${output_paths[$i]}"
  status=0

  # Await every PID even after failures. If a trap interrupted wait, re-wait
  # until the child is reaped.
  while true; do
    if wait "$pid"; then
      status=0
      break
    else
      status=$?
      if [[ "$interrupted" -eq 1 ]] && kill -0 "$pid" 2>/dev/null; then
        continue
      fi
      break
    fi
  done

  if [[ "$status" -eq 0 && -f "$out_path" ]]; then
    success_count=$((success_count + 1))
  else
    fail_count=$((fail_count + 1))
    # On interrupt, leave missing outputs for the cancellation pass.
    if [[ "$interrupted" -eq 0 && ! -f "$out_path" ]]; then
      write_marker_file "$out_path" "$model" "$status" "n/a" "non-zero invocation" \
        "worker exited without writing an output file" || true
    fi
  fi
done

if [[ "$interrupted" -eq 1 ]]; then
  for i in "${!models[@]}"; do
    out_path="${output_paths[$i]}"
    model="${models[$i]}"
    if [[ ! -f "$out_path" ]]; then
      write_marker_file "$out_path" "$model" "130" "n/a" "cancelled" \
        "panel interrupted before this model produced output" || true
    fi
  done
  echo "panel interrupted: ${success_count} succeeded, ${fail_count} failed/cancelled of ${#models[@]} models" >&2
  exit 130
fi

echo "panel complete: ${success_count} succeeded, ${fail_count} failed of ${#models[@]} models" >&2

if [[ "$fail_count" -gt 0 ]]; then
  exit 1
fi
exit 0
