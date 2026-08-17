#!/usr/bin/env bash
# Parallel fan-out wrapper: Cursor models via cursor-agent.sh.
# Syntax is designed for macOS Bash 3.2. Verification uses the installed Bash;
# this is not a claim that Bash 3.2 was runtime-tested here.
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: cursor-panel.sh [--model <id> ...] [--seat <id> <prompt-file> ...]
                       --out-dir <dir> [--prompt-file <path>] [--resume | --overwrite]

Run one or more Cursor models in parallel. Shared --model seats use one prompt
(--prompt-file or stdin). Repeatable --seat pairs give each seat its own prompt
file. The two forms may be combined. All seats launch concurrently.

Options:
  --model <id>           Shared-prompt seat (repeatable)
  --seat <id> <file>     Per-seat prompt file (repeatable)
  --out-dir <dir>        Directory for per-model markdown outputs (required)
  --prompt-file <path>   Shared prompt for --model seats (otherwise stdin)
  --resume               Skip seats whose output is an existing non-empty
                         regular file; empty regular files are rerun
  --overwrite            Replace existing per-model regular output files
  -h, --help             Show this help

--resume and --overwrite are mutually exclusive. With neither, existing
paths are refused (no-clobber). Directories, symlinks, and other non-regular
existing types are always refused.

Shared --model seats require a non-empty --prompt-file or non-TTY stdin.
--seat prompt files are validated independently and do not require a shared
prompt. Combining --model and --seat is allowed.

Model ids:
  Conservative grammar: ASCII alphanumeric start, then [A-Za-z0-9._/:@+-],
  with no empty or "." / ".." slash segments. Control, whitespace, and
  markdown metacharacters outside that allow-list are rejected. Labels are
  filesystem-safe forms of the id; case-insensitive collisions are refused.

Each published file records exact model provenance. A nonzero child is never
published, even if it wrote a raw file. INT/TERM terminates wrappers so they
kill their CLI process groups; descendants must not survive.

A line-oriented outputs.manifest is written in --out-dir listing published
or resume-skipped seat files (not README.md).

Environment:
  CURSOR_AGENT_BIN       Passed through to cursor-agent.sh
  CURSOR_PANEL_AGENT     Override path to cursor-agent.sh
                         (default: sibling of this script)

--force is used by cursor-agent.sh and can edit the working tree. Council
prompts must tell models to stay read-only; git-status before and after.
EOF
}

die() {
  printf '%s\n' "cursor-panel.sh: $*" >&2
  exit 1
}

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
# shellcheck source=cursor-common.sh
. "$script_dir/cursor-common.sh"

normalize_label() {
  printf '%s' "$1" | sed -e 's/[^A-Za-z0-9._-]/-/g' -e 's/--*/-/g' -e 's/^-//' -e 's/-$//'
}

to_lower() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]'
}

write_provenance() {
  # $1 dest, $2 model, $3 label, $4 raw file, $5 publish mode
  local _dest _model _label _raw _mode _dest_tmp _utc _pub
  _dest=$1
  _model=$2
  _label=$3
  _raw=$4
  _mode=$5
  _dest_tmp=$(mktemp "${_dest}.XXXXXX") || return 1
  _utc=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  {
    cat <<EOF
# Panel output — ${_model}

| Field | Value |
| --- | --- |
| Model (exact) | \`${_model}\` |
| Output label | \`${_label}\` |
| Command | \`cursor-agent -p "\$prompt" --model "${_model}" --output-format text --force\` |
| Written (UTC) | ${_utc} |

Raw model output follows. This file is immutable session evidence; do not edit in place.

---

EOF
    cat -- "$_raw"
  } >"$_dest_tmp" || {
    rm -f -- "$_dest_tmp"
    return 1
  }
  if [ ! -s "$_dest_tmp" ]; then
    rm -f -- "$_dest_tmp"
    return 1
  fi
  cursor_publish "$_dest_tmp" "$_dest" "$_mode" || {
    _pub=$?
    rm -f -- "$_dest_tmp"
    return "$_pub"
  }
}

models=()
seat_prompts=()
out_dir=""
prompt_file=""
resume=0
overwrite=0

while [ $# -gt 0 ]; do
  case "$1" in
    --model)
      [ $# -ge 2 ] || die "--model requires a value"
      models+=("$2")
      seat_prompts+=("")
      shift 2
      ;;
    --model=*)
      models+=("${1#--model=}")
      seat_prompts+=("")
      shift
      ;;
    --seat)
      [ $# -ge 3 ] || die "--seat requires a model id and a prompt file"
      models+=("$2")
      seat_prompts+=("$3")
      shift 3
      ;;
    --out-dir)
      [ $# -ge 2 ] || die "--out-dir requires a value"
      out_dir=$2
      shift 2
      ;;
    --out-dir=*)
      out_dir=${1#--out-dir=}
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
    --resume)
      resume=1
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
[ "${#models[@]}" -gt 0 ] || die "at least one --model or --seat is required"
[ -n "$out_dir" ] || die "--out-dir is required"
[ "$resume" -eq 0 ] || [ "$overwrite" -eq 0 ] || die "--resume and --overwrite cannot be used together"

agent_sh=${CURSOR_PANEL_AGENT:-"$script_dir/cursor-agent.sh"}
[ -f "$agent_sh" ] || die "cursor-agent.sh not found: $agent_sh"
[ -x "$agent_sh" ] || die "cursor-agent.sh is not executable: $agent_sh"

need_shared=0
i=0
while [ "$i" -lt "${#models[@]}" ]; do
  if [ -z "${seat_prompts[$i]}" ]; then
    need_shared=1
  fi
  i=$((i + 1))
done

labels=()
lowers=()
i=0
while [ "$i" -lt "${#models[@]}" ]; do
  m=${models[$i]}
  [ -n "$m" ] || die "model id must not be empty"
  cursor_model_id_ok "$m" || die "invalid model id: $m"
  label=$(normalize_label "$m")
  [ -n "$label" ] || die "model id normalizes to an empty filename: $m"
  lower=$(to_lower "$label")
  j=0
  while [ "$j" -lt "${#lowers[@]}" ]; do
    if [ "$lower" = "${lowers[$j]}" ]; then
      die "normalization collision: '$m' and '${models[$j]}' both map to '${labels[$j]}'"
    fi
    j=$((j + 1))
  done
  labels+=("$label")
  lowers+=("$lower")
  i=$((i + 1))
done

i=0
while [ "$i" -lt "${#models[@]}" ]; do
  sp=${seat_prompts[$i]}
  if [ -n "$sp" ]; then
    [ -f "$sp" ] && [ ! -L "$sp" ] || die "seat prompt is not a regular file: $sp"
    [ -r "$sp" ] || die "seat prompt not readable: $sp"
    [ -s "$sp" ] || die "seat prompt is empty: $sp"
  fi
  i=$((i + 1))
done

mkdir -p -- "$out_dir"

# Pre-check destinations before launching anyone.
i=0
while [ "$i" -lt "${#labels[@]}" ]; do
  dest="$out_dir/${labels[$i]}.md"
  kind=$(cursor_dest_kind "$dest")
  case "$kind" in
    missing)
      ;;
    regular)
      if [ "$resume" -eq 1 ]; then
        :
      elif [ "$overwrite" -eq 1 ]; then
        :
      else
        die "refusing to clobber existing file (pass --overwrite or --resume): $dest"
      fi
      ;;
    directory)
      die "refusing destination that is a directory: $dest"
      ;;
    symlink)
      die "refusing destination that is a symlink: $dest"
      ;;
    *)
      die "refusing destination that is not a regular file: $dest"
      ;;
  esac
  i=$((i + 1))
done

work=""
child_pids=""
interrupted=0

cleanup() {
  if [ -n "${child_pids:-}" ]; then
    for pid in $child_pids; do
      kill -TERM "$pid" >/dev/null 2>&1 || true
    done
    for pid in $child_pids; do
      wait "$pid" >/dev/null 2>&1 || true
    done
    child_pids=""
  fi
  if [ -n "${work:-}" ] && [ -d "$work" ]; then
    rm -rf -- "$work"
    work=""
  fi
}

on_signal() {
  interrupted=1
  cleanup
  exit 130
}

trap cleanup EXIT
trap on_signal INT TERM

work=$(mktemp -d "${TMPDIR:-/tmp}/cursor-panel.XXXXXX") || die "failed to create temp directory"

snapshot=""
if [ "$need_shared" -eq 1 ]; then
  snapshot="$work/prompt.txt"
  if [ -n "$prompt_file" ]; then
    [ -f "$prompt_file" ] && [ ! -L "$prompt_file" ] || die "prompt file not a regular file: $prompt_file"
    [ -r "$prompt_file" ] || die "prompt file not readable: $prompt_file"
    cat -- "$prompt_file" >"$snapshot" || die "failed to read prompt file: $prompt_file"
  else
    if [ -t 0 ]; then
      die "stdin is a TTY; pass --prompt-file or pipe a non-empty prompt"
    fi
    cat -- >"$snapshot" || die "failed to read prompt from stdin"
  fi
  [ -s "$snapshot" ] || die "prompt is empty"
fi

# Freeze per-seat prompts so they cannot change mid-run.
i=0
while [ "$i" -lt "${#models[@]}" ]; do
  sp=${seat_prompts[$i]}
  if [ -n "$sp" ]; then
    frozen="$work/${labels[$i]}.prompt"
    cat -- "$sp" >"$frozen" || die "failed to read seat prompt: $sp"
    seat_prompts[$i]=$frozen
  fi
  i=$((i + 1))
done

ok_count=0
fail_count=0
skip_count=0
fail_list=""
manifest_lines=""

child_pid_list=()
run_flags=()
pub_modes=()

i=0
while [ "$i" -lt "${#models[@]}" ]; do
  m=${models[$i]}
  label=${labels[$i]}
  dest="$out_dir/${label}.md"
  kind=$(cursor_dest_kind "$dest")

  if [ "$resume" -eq 1 ] && cursor_is_complete_regular "$dest"; then
    printf 'cursor-panel.sh: resume skip %s -> %s\n' "$m" "$dest" >&2
    skip_count=$((skip_count + 1))
    manifest_lines="${manifest_lines}${label}.md"$'\n'
    child_pid_list+=("")
    run_flags+=("skip")
    pub_modes+=("")
    i=$((i + 1))
    continue
  fi

  if [ "$overwrite" -eq 1 ]; then
    pub_mode=overwrite
  elif [ "$resume" -eq 1 ] && [ "$kind" = "regular" ]; then
    # Empty regular file: rerun and replace.
    pub_mode=overwrite
  else
    pub_mode=noclobber
  fi

  if [ -n "${seat_prompts[$i]}" ]; then
    pfile=${seat_prompts[$i]}
  else
    pfile=$snapshot
  fi

  raw="$work/${label}.raw"
  "$agent_sh" --model "$m" --out "$raw" --prompt-file "$pfile" --overwrite &
  pid=$!
  child_pids="${child_pids} ${pid}"
  child_pid_list+=("$pid")
  run_flags+=("run")
  pub_modes+=("$pub_mode")
  i=$((i + 1))
done

child_status_list=()
i=0
while [ "$i" -lt "${#models[@]}" ]; do
  pid=${child_pid_list[$i]}
  if [ -n "$pid" ]; then
    set +e
    wait "$pid"
    child_status_list[$i]=$?
    set -e
  else
    child_status_list[$i]=0
  fi
  i=$((i + 1))
done
child_pids=""

i=0
while [ "$i" -lt "${#models[@]}" ]; do
  m=${models[$i]}
  label=${labels[$i]}
  dest="$out_dir/${label}.md"
  raw="$work/${label}.raw"
  flag=${run_flags[$i]}
  st=${child_status_list[$i]}
  pub_mode=${pub_modes[$i]}

  if [ "$flag" = "skip" ]; then
    i=$((i + 1))
    continue
  fi

  if [ "$st" -ne 0 ]; then
    fail_count=$((fail_count + 1))
    fail_list="${fail_list} ${m}"
    printf 'cursor-panel.sh: failed %s (exit %s)\n' "$m" "$st" >&2
    i=$((i + 1))
    continue
  fi

  if [ ! -s "$raw" ]; then
    fail_count=$((fail_count + 1))
    fail_list="${fail_list} ${m}"
    printf 'cursor-panel.sh: failed %s (empty output)\n' "$m" >&2
    i=$((i + 1))
    continue
  fi

  set +e
  write_provenance "$dest" "$m" "$label" "$raw" "$pub_mode"
  wrap_st=$?
  set -e
  if [ "$wrap_st" -eq 0 ]; then
    ok_count=$((ok_count + 1))
    manifest_lines="${manifest_lines}${label}.md"$'\n'
    printf 'cursor-panel.sh: wrote %s\n' "$dest" >&2
  else
    fail_count=$((fail_count + 1))
    fail_list="${fail_list} ${m}"
    if [ "$wrap_st" -eq 2 ]; then
      printf 'cursor-panel.sh: refusing non-regular destination for %s\n' "$m" >&2
    else
      printf 'cursor-panel.sh: failed to wrap output for %s\n' "$m" >&2
    fi
  fi
  i=$((i + 1))
done

if [ "$interrupted" -ne 0 ]; then
  exit 130
fi

manifest="$out_dir/outputs.manifest"
manifest_tmp=$(mktemp "${out_dir}/.outputs.manifest.XXXXXX") || die "failed to create manifest temp"
{
  printf '%s\n' '# cursor-panel.sh outputs.manifest'
  printf '%s\n' '# One basename per published or resume-skipped seat file.'
  printf '%s\n' '# Documentation files in this directory are not listed.'
  printf '%s' "$manifest_lines"
} >"$manifest_tmp"
set +e
cursor_publish "$manifest_tmp" "$manifest" overwrite
man_st=$?
set -e
if [ "$man_st" -ne 0 ]; then
  rm -f -- "$manifest_tmp"
  die "failed to publish outputs.manifest"
fi

printf 'cursor-panel.sh: %s succeeded, %s failed, %s skipped\n' \
  "$ok_count" "$fail_count" "$skip_count" >&2

if [ "$fail_count" -gt 0 ]; then
  if [ -n "$fail_list" ]; then
    printf 'cursor-panel.sh: failed models:%s\n' "$fail_list" >&2
  fi
  exit 1
fi
