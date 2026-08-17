#!/usr/bin/env bash
# Shared helpers for cursor-agent.sh and cursor-panel.sh.
# Syntax is designed for macOS Bash 3.2 (no associative arrays, no wait -n,
# no GNU-only helpers). This file is not a runtime-tested Bash 3.2 suite;
# verification uses whatever Bash is installed (see PLAN.md).
#
# Model id grammar (conservative, Cursor-realistic):
#   - starts with an ASCII alphanumeric
#   - then only [A-Za-z0-9._/:@+-]
#   - slash-separated segments must be non-empty and not "." or ".."
# Control characters, whitespace, and markdown metacharacters outside that
# allow-list are rejected. Callers still check case-insensitive filename
# collisions after normalizing for the filesystem.

cursor_model_id_ok() {
  _m=$1
  case "$_m" in
    "") return 1 ;;
  esac
  _re='^[A-Za-z0-9][A-Za-z0-9._/:@+-]*$'
  if ! [[ "$_m" =~ $_re ]]; then
    return 1
  fi
  case "/$_m/" in
    *'//'* | */'..'/* | */'.'/*)
      return 1
      ;;
  esac
  return 0
}

# stdout: missing | regular | directory | symlink | other
cursor_dest_kind() {
  if [ -L "$1" ]; then
    printf '%s\n' symlink
    return 0
  fi
  if [ ! -e "$1" ]; then
    printf '%s\n' missing
    return 0
  fi
  if [ -f "$1" ]; then
    printf '%s\n' regular
    return 0
  fi
  if [ -d "$1" ]; then
    printf '%s\n' directory
    return 0
  fi
  printf '%s\n' other
}

# True when dest is an existing non-empty regular file (not a symlink).
cursor_is_complete_regular() {
  if [ -L "$1" ]; then
    return 1
  fi
  if [ -f "$1" ] && [ -s "$1" ]; then
    return 0
  fi
  return 1
}

cursor_ln_if_absent() {
  _src=$1
  _dest=$2
  case "$_src" in
    -*) _src="./$_src" ;;
  esac
  case "$_dest" in
    /*) ;;
    -*) _dest="./$_dest" ;;
  esac
  ln "$_src" "$_dest"
}

# cursor_publish SRC DEST MODE
# MODE: noclobber | overwrite
# 0 = published, 1 = dest exists / create failed, 2 = dest is not a regular file
# noclobber uses hard-link create-if-absent (src and dest are in the same directory).
# overwrite replaces only a missing path or an existing regular file, via mv.
cursor_publish() {
  _src=$1
  _dest=$2
  _mode=$3
  _kind=$(cursor_dest_kind "$_dest")
  case "$_mode" in
    noclobber)
      if [ "$_kind" != "missing" ]; then
        if [ "$_kind" = "regular" ]; then
          return 1
        fi
        return 2
      fi
      cursor_ln_if_absent "$_src" "$_dest" || return 1
      rm -f -- "$_src"
      return 0
      ;;
    overwrite)
      case "$_kind" in
        missing|regular)
          ;;
        *)
          return 2
          ;;
      esac
      mv -f -- "$_src" "$_dest" || return 1
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

# Kill and reap a job-control process group whose leader pid is $1.
# Never signals the caller's own process group with a negative pid.
cursor_kill_process_group() {
  _leader=$1
  if [ -z "${_leader:-}" ]; then
    return 0
  fi
  _wrap_pgid=$(ps -o pgid= -p $$ 2>/dev/null | tr -d ' \t')
  _got=$(ps -o pgid= -p "$_leader" 2>/dev/null | tr -d ' \t')
  _pgid=${_got:-$_leader}
  if [ -n "$_pgid" ] && [ "$_pgid" != "$$" ] && [ "$_pgid" != "${_wrap_pgid:-}" ]; then
    kill -TERM -"$_pgid" >/dev/null 2>&1 || true
    kill -KILL -"$_pgid" >/dev/null 2>&1 || true
  else
    kill -TERM "$_leader" >/dev/null 2>&1 || true
    kill -KILL "$_leader" >/dev/null 2>&1 || true
  fi
  wait "$_leader" >/dev/null 2>&1 || true
}
