#!/usr/bin/env bash
# Single-model wrapper around cursor-agent.
# Syntax is designed for macOS Bash 3.2. Verification uses the installed Bash;
# this is not a claim that Bash 3.2 was runtime-tested here.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: cursor-agent.sh --model <id> --out <path> [--prompt-file <path>] [--overwrite]

Run one Cursor CLI model and write its text output to --out.

Options:
  --model <id>           Cursor model id (required)
  --out <path>           Destination file (required)
  --prompt-file <path>   Read prompt from file (otherwise stdin)
  --overwrite            Replace --out if it is an existing regular file
  -h, --help             Show this help

Prompt source:
  --prompt-file wins when given. Otherwise the prompt is read from stdin,
  which must not be a TTY and must not be empty.

Model ids:
  Conservative grammar: ASCII alphanumeric start, then [A-Za-z0-9._/:@+-],
  with no empty or "." / ".." slash segments. Control, whitespace, and
  markdown metacharacters outside that allow-list are rejected.

Destination:
  Existing directories, symlinks, and other non-regular types are refused
  (including with --overwrite). No-clobber publishes with a hard-link
  create-if-absent so a file created during the run is not overwritten.
  --overwrite replaces only a regular file, and only after non-empty success.

Environment:
  CURSOR_AGENT_BIN       Override the cursor-agent executable (default: cursor-agent)

Exact invocation:
  cursor-agent -p "$prompt" --model "$model" --output-format text --force

--force can edit the working tree. Council prompts must tell the model to
stay read-only, and the operator should git-status before and after.

INT/TERM kills the CLI process group (job-control leader plus descendants)
and returns promptly.
EOF
}

die() {
  printf '%s\n' "cursor-agent.sh: $*" >&2
  exit 1
}

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
# shellcheck source=cursor-common.sh
. "$script_dir/cursor-common.sh"

read_prompt_from_file() {
  # Preserve trailing newlines (command substitution would strip them).
  prompt=$(cat -- "$1"; printf x)
  prompt=${prompt%x}
}

model=""
out=""
prompt_file=""
overwrite=0

while [ $# -gt 0 ]; do
  case "$1" in
    --model)
      [ $# -ge 2 ] || die "--model requires a value"
      model=$2
      shift 2
      ;;
    --model=*)
      model=${1#--model=}
      shift
      ;;
    --out)
      [ $# -ge 2 ] || die "--out requires a value"
      out=$2
      shift 2
      ;;
    --out=*)
      out=${1#--out=}
      shift
      ;;
    --prompt-file)
      [ $# -ge 2 ] || die "--prompt-file requires a value"
      prompt_file=$2
      shift 2
      ;;
    --prompt-file=*)
      prompt_file=${1#--prompt-file=}
      shift
      ;;
    --overwrite)
      overwrite=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    -*)
      die "unknown option: $1"
      ;;
    *)
      die "unexpected argument: $1"
      ;;
  esac
done

[ $# -eq 0 ] || die "unexpected argument: $1"
[ -n "$model" ] || die "--model is required"
[ -n "$out" ] || die "--out is required"

cursor_model_id_ok "$model" || die "invalid model id: $model"

if [ -n "$prompt_file" ]; then
  [ -f "$prompt_file" ] && [ ! -L "$prompt_file" ] || die "prompt file not a regular file: $prompt_file"
  [ -r "$prompt_file" ] || die "prompt file not readable: $prompt_file"
  read_prompt_from_file "$prompt_file"
else
  if [ -t 0 ]; then
    die "stdin is a TTY; pass --prompt-file or pipe a non-empty prompt"
  fi
  prompt=$(cat --; printf x)
  prompt=${prompt%x}
fi

[ -n "$prompt" ] || die "prompt is empty"

dest_kind=$(cursor_dest_kind "$out")
case "$dest_kind" in
  missing)
    ;;
  regular)
    if [ "$overwrite" -ne 1 ]; then
      die "refusing to clobber existing file (pass --overwrite): $out"
    fi
    ;;
  directory)
    die "refusing destination that is a directory: $out"
    ;;
  symlink)
    die "refusing destination that is a symlink: $out"
    ;;
  *)
    die "refusing destination that is not a regular file: $out"
    ;;
esac

bin=${CURSOR_AGENT_BIN:-cursor-agent}
case "$bin" in
  */*)
    [ -x "$bin" ] || die "CURSOR_AGENT_BIN is not executable: $bin"
    ;;
  *)
    command -v "$bin" >/dev/null 2>&1 || die "cursor-agent not found on PATH (set CURSOR_AGENT_BIN?): $bin"
    ;;
esac

out_dir=$(dirname -- "$out")
mkdir -p -- "$out_dir"

tmp=""
agent_pid=""
cleanup() {
  if [ -n "${agent_pid:-}" ]; then
    cursor_kill_process_group "$agent_pid"
    agent_pid=""
  fi
  if [ -n "${tmp:-}" ] && [ -e "$tmp" ]; then
    rm -f -- "$tmp"
  fi
}

trap cleanup EXIT
trap 'cleanup; exit 130' INT TERM

tmp=$(mktemp "${out_dir}/.cursor-agent.XXXXXX") || die "failed to create temp file in $out_dir"

# Job control gives the CLI its own process group so INT/TERM can kill descendants.
# set -m can warn when there is no controlling tty; do not let that abort the run.
set +e
set -m
"$bin" -p "$prompt" --model "$model" --output-format text --force >"$tmp" &
agent_pid=$!
wait "$agent_pid"
status=$?
agent_pid=""
set +m
set -e

if [ "$status" -ne 0 ]; then
  die "cursor-agent failed (exit $status) for model: $model"
fi

if [ ! -s "$tmp" ]; then
  die "cursor-agent wrote empty output for model: $model"
fi

if [ "$overwrite" -eq 1 ]; then
  pub_mode=overwrite
else
  pub_mode=noclobber
fi

set +e
cursor_publish "$tmp" "$out" "$pub_mode"
pub_st=$?
set -e
case "$pub_st" in
  0)
    tmp=""
    ;;
  2)
    die "refusing destination that is not a regular file: $out"
    ;;
  *)
    die "refusing to clobber existing file (pass --overwrite): $out"
    ;;
esac

trap - EXIT INT TERM
