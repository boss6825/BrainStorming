#!/usr/bin/env bash
# Mock-based tests for cursor-agent.sh and cursor-panel.sh.
# Does not call the real cursor-agent; does not install dependencies.
set -euo pipefail

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
root_dir=$(CDPATH= cd -- "$script_dir/../.." && pwd)
agent_sh="$root_dir/scripts/cursor-agent.sh"
panel_sh="$root_dir/scripts/cursor-panel.sh"
mock_bin="$root_dir/scripts/tests/mocks/cursor-agent"

pass=0
fail=0
skip=0

assert_eq() {
  _name=$1
  _got=$2
  _want=$3
  if [ "$_got" = "$_want" ]; then
    printf 'PASS  %s\n' "$_name"
    pass=$((pass + 1))
  else
    printf 'FAIL  %s (got %s, want %s)\n' "$_name" "$_got" "$_want"
    fail=$((fail + 1))
  fi
}

assert_file_contains() {
  _name=$1
  _file=$2
  _needle=$3
  if grep -F -- "$_needle" "$_file" >/dev/null; then
    printf 'PASS  %s\n' "$_name"
    pass=$((pass + 1))
  else
    printf 'FAIL  %s (missing %s in %s)\n' "$_name" "$_needle" "$_file"
    fail=$((fail + 1))
  fi
}

assert_file_not_contains() {
  _name=$1
  _file=$2
  _needle=$3
  if grep -F -- "$_needle" "$_file" >/dev/null; then
    printf 'FAIL  %s (unexpected %s in %s)\n' "$_name" "$_needle" "$_file"
    fail=$((fail + 1))
  else
    printf 'PASS  %s\n' "$_name"
    pass=$((pass + 1))
  fi
}

work=$(mktemp -d "${TMPDIR:-/tmp}/council-script-tests.XXXXXX")
cleanup() {
  rm -rf -- "$work"
}
trap cleanup EXIT

export CURSOR_AGENT_BIN="$mock_bin"
export MOCK_LOG="$work/mock.log"
: >"$MOCK_LOG"

chmod +x "$agent_sh" "$panel_sh" "$mock_bin"

# ---------------------------------------------------------------------------
# cursor-agent.sh
# ---------------------------------------------------------------------------

prompt_file="$work/prompt.txt"
printf 'hello council\n' >"$prompt_file"

# Prompt file path
out1="$work/agent-file.txt"
"$agent_sh" --model grok --out "$out1" --prompt-file "$prompt_file"
assert_file_contains "agent prompt-file writes model" "$out1" "model=grok"
assert_file_contains "agent prompt-file writes prompt" "$out1" "prompt=hello council"

# Stdin path
out2="$work/agent-stdin.txt"
printf 'from stdin' | "$agent_sh" --model gpt-test --out "$out2"
assert_file_contains "agent stdin writes prompt" "$out2" "prompt=from stdin"

# Empty stdin rejected
out3="$work/agent-empty-stdin.txt"
set +e
printf '' | "$agent_sh" --model grok --out "$out3" 2>"$work/empty-stdin.err"
st=$?
set -e
assert_eq "agent empty stdin exit" "$st" "1"
if [ -e "$out3" ]; then
  printf 'FAIL  agent empty stdin must not create dest\n'
  fail=$((fail + 1))
else
  printf 'PASS  agent empty stdin must not create dest\n'
  pass=$((pass + 1))
fi

# Empty prompt file rejected
empty_prompt="$work/empty-prompt.txt"
: >"$empty_prompt"
out3b="$work/agent-empty-file.txt"
set +e
"$agent_sh" --model grok --out "$out3b" --prompt-file "$empty_prompt" 2>"$work/empty-file.err"
st=$?
set -e
assert_eq "agent empty prompt-file exit" "$st" "1"

# No-clobber
out4="$work/agent-noclobber.txt"
printf 'KEEP\n' >"$out4"
set +e
"$agent_sh" --model grok --out "$out4" --prompt-file "$prompt_file" 2>"$work/noclobber.err"
st=$?
set -e
assert_eq "agent no-clobber exit" "$st" "1"
assert_file_contains "agent no-clobber preserves dest" "$out4" "KEEP"
assert_file_not_contains "agent no-clobber does not write mock" "$out4" "MOCK_OK"

# Overwrite
"$agent_sh" --model grok --out "$out4" --prompt-file "$prompt_file" --overwrite
assert_file_contains "agent overwrite replaces dest" "$out4" "MOCK_OK"

# Empty model output does not land a dest file
out5="$work/agent-empty-model.txt"
set +e
"$agent_sh" --model empty-model --out "$out5" --prompt-file "$prompt_file" 2>"$work/empty-model.err"
st=$?
set -e
assert_eq "agent empty-output exit" "$st" "1"
if [ -e "$out5" ]; then
  printf 'FAIL  agent empty-output must not create dest\n'
  fail=$((fail + 1))
else
  printf 'PASS  agent empty-output must not create dest\n'
  pass=$((pass + 1))
fi

# Empty-output with overwrite must not clobber dest
out5b="$work/agent-empty-overwrite.txt"
printf 'ORIGINAL\n' >"$out5b"
set +e
"$agent_sh" --model empty-model --out "$out5b" --prompt-file "$prompt_file" --overwrite 2>"$work/empty-overwrite.err"
st=$?
set -e
assert_eq "agent empty-output overwrite exit" "$st" "1"
assert_file_contains "agent empty-output overwrite preserves dest" "$out5b" "ORIGINAL"

# Failed model does not create dest
out6="$work/agent-fail.txt"
set +e
"$agent_sh" --model fail-model --out "$out6" --prompt-file "$prompt_file" 2>"$work/fail-model.err"
st=$?
set -e
assert_eq "agent failed model exit" "$st" "1"
if [ -e "$out6" ]; then
  printf 'FAIL  agent failed model must not create dest\n'
  fail=$((fail + 1))
else
  printf 'PASS  agent failed model must not create dest\n'
  pass=$((pass + 1))
fi

# Directory destination refused (including --overwrite)
mkdir -p "$work/agent-dir-dest"
set +e
"$agent_sh" --model grok --out "$work/agent-dir-dest" --prompt-file "$prompt_file" 2>"$work/agent-dir.err"
st=$?
set -e
assert_eq "agent directory dest exit" "$st" "1"
assert_file_contains "agent directory dest message" "$work/agent-dir.err" "directory"
if [ -d "$work/agent-dir-dest" ]; then
  printf 'PASS  agent directory dest remains a directory\n'
  pass=$((pass + 1))
else
  printf 'FAIL  agent directory dest was replaced\n'
  fail=$((fail + 1))
fi
set +e
"$agent_sh" --model grok --out "$work/agent-dir-dest" --prompt-file "$prompt_file" --overwrite 2>"$work/agent-dir-ow.err"
st=$?
set -e
assert_eq "agent directory dest overwrite exit" "$st" "1"

# Symlink destination refused
ln -s "$work/agent-file.txt" "$work/agent-symlink-dest"
set +e
"$agent_sh" --model grok --out "$work/agent-symlink-dest" --prompt-file "$prompt_file" --overwrite 2>"$work/agent-symlink.err"
st=$?
set -e
assert_eq "agent symlink dest exit" "$st" "1"
assert_file_contains "agent symlink dest message" "$work/agent-symlink.err" "symlink"
if [ -L "$work/agent-symlink-dest" ]; then
  printf 'PASS  agent symlink dest remains a symlink\n'
  pass=$((pass + 1))
else
  printf 'FAIL  agent symlink dest was replaced\n'
  fail=$((fail + 1))
fi

# Other non-regular (fifo) if mkfifo exists
if command -v mkfifo >/dev/null 2>&1; then
  mkfifo "$work/agent-fifo-dest"
  set +e
  "$agent_sh" --model grok --out "$work/agent-fifo-dest" --prompt-file "$prompt_file" --overwrite 2>"$work/agent-fifo.err"
  st=$?
  set -e
  assert_eq "agent fifo dest exit" "$st" "1"
  if [ -p "$work/agent-fifo-dest" ]; then
    printf 'PASS  agent fifo dest remains a fifo\n'
    pass=$((pass + 1))
  else
    printf 'FAIL  agent fifo dest was replaced\n'
    fail=$((fail + 1))
  fi
  rm -f "$work/agent-fifo-dest"
else
  printf 'SKIP  agent fifo dest (mkfifo not available)\n'
  skip=$((skip + 1))
fi

# Concurrent no-clobber race: both pass the initial missing-dest check
race_out="$work/agent-race.txt"
export MOCK_SLEEP=1
set +e
"$agent_sh" --model slow-race-a --out "$race_out" --prompt-file "$prompt_file" 2>"$work/race-a.err" &
race_p1=$!
"$agent_sh" --model slow-race-b --out "$race_out" --prompt-file "$prompt_file" 2>"$work/race-b.err" &
race_p2=$!
wait "$race_p1"
race_s1=$?
wait "$race_p2"
race_s2=$?
set -e
unset MOCK_SLEEP
race_ok=0
race_fail=0
if [ "$race_s1" -eq 0 ]; then race_ok=$((race_ok + 1)); else race_fail=$((race_fail + 1)); fi
if [ "$race_s2" -eq 0 ]; then race_ok=$((race_ok + 1)); else race_fail=$((race_fail + 1)); fi
assert_eq "agent noclobber race one success" "$race_ok" "1"
assert_eq "agent noclobber race one failure" "$race_fail" "1"
if [ -f "$race_out" ] && [ ! -L "$race_out" ] && [ -s "$race_out" ]; then
  printf 'PASS  agent noclobber race dest is non-empty regular\n'
  pass=$((pass + 1))
else
  printf 'FAIL  agent noclobber race dest is not a non-empty regular file\n'
  fail=$((fail + 1))
fi
assert_file_contains "agent noclobber race complete mock" "$race_out" "MOCK_OK"
# Exactly one of the two models landed
race_a=0
race_b=0
grep -F "model=slow-race-a" "$race_out" >/dev/null && race_a=1
grep -F "model=slow-race-b" "$race_out" >/dev/null && race_b=1
if [ "$((race_a + race_b))" -eq 1 ]; then
  printf 'PASS  agent noclobber race single winner\n'
  pass=$((pass + 1))
else
  printf 'FAIL  agent noclobber race mixed or empty winner (a=%s b=%s)\n' "$race_a" "$race_b"
  fail=$((fail + 1))
fi

# Malformed model ids
set +e
"$agent_sh" --model "foo bar" --out "$work/bad-id.txt" --prompt-file "$prompt_file" 2>"$work/bad-space.err"
st=$?
set -e
assert_eq "agent id with space exit" "$st" "1"
assert_file_contains "agent id with space message" "$work/bad-space.err" "invalid model id"

set +e
"$agent_sh" --model 'foo*bar' --out "$work/bad-id.txt" --prompt-file "$prompt_file" 2>"$work/bad-star.err"
st=$?
set -e
assert_eq "agent id with star exit" "$st" "1"

set +e
"$agent_sh" --model 'foo/../bar' --out "$work/bad-id.txt" --prompt-file "$prompt_file" 2>"$work/bad-trav.err"
st=$?
set -e
assert_eq "agent id traversal exit" "$st" "1"

set +e
"$agent_sh" --model 'foo/./bar' --out "$work/bad-id.txt" --prompt-file "$prompt_file" 2>"$work/bad-dot.err"
st=$?
set -e
assert_eq "agent id dot-segment exit" "$st" "1"

set +e
"$agent_sh" --model 'foo|bar' --out "$work/bad-id.txt" --prompt-file "$prompt_file" 2>"$work/bad-pipe.err"
st=$?
set -e
assert_eq "agent id pipe exit" "$st" "1"

set +e
"$agent_sh" --model 'foo`bar' --out "$work/bad-id.txt" --prompt-file "$prompt_file" 2>"$work/bad-tick.err"
st=$?
set -e
assert_eq "agent id backtick exit" "$st" "1"

set +e
"$agent_sh" --model '-leading' --out "$work/bad-id.txt" --prompt-file "$prompt_file" 2>"$work/bad-lead.err"
st=$?
set -e
assert_eq "agent id leading hyphen exit" "$st" "1"

# Realistic valid id
out_okid="$work/agent-okid.txt"
"$agent_sh" --model 'org/model:tag@plus+ok.1' --out "$out_okid" --prompt-file "$prompt_file"
assert_file_contains "agent valid realistic id" "$out_okid" "model=org/model:tag@plus+ok.1"

# TTY stdin rejected
if command -v python3 >/dev/null 2>&1; then
  out7="$work/agent-tty.txt"
  set +e
  python3 - "$agent_sh" "$out7" "$mock_bin" <<'PY'
import os, pty, sys
agent, dest, mock = sys.argv[1], sys.argv[2], sys.argv[3]
pid, fd = pty.fork()
if pid == 0:
    os.environ["CURSOR_AGENT_BIN"] = mock
    os.execv("/usr/bin/env", ["env", "bash", agent, "--model", "grok", "--out", dest])
_pid, status = os.waitpid(pid, 0)
if os.WIFEXITED(status):
    raise SystemExit(os.WEXITSTATUS(status))
raise SystemExit(1)
PY
  st=$?
  set -e
  assert_eq "agent TTY stdin exit" "$st" "1"
  if [ -e "$out7" ]; then
    printf 'FAIL  agent TTY stdin must not create dest\n'
    fail=$((fail + 1))
  else
    printf 'PASS  agent TTY stdin must not create dest\n'
    pass=$((pass + 1))
  fi
else
  printf 'SKIP  agent TTY stdin (python3 not available)\n'
  skip=$((skip + 1))
fi

# ---------------------------------------------------------------------------
# cursor-panel.sh
# ---------------------------------------------------------------------------

write_panel_stub() {
  _dest=$1
  _model=$2
  _label=$3
  _body=$4
  cat > "$_dest" <<EOF
# Panel output — ${_model}

| Field | Value |
| --- | --- |
| Model (exact) | \`${_model}\` |
| Output label | \`${_label}\` |
| Command | \`cursor-agent -p "\$prompt" --model "${_model}" --output-format text --force\` |
| Written (UTC) | 2020-01-01T00:00:00Z |

Raw model output follows. This file is immutable session evidence; do not edit in place.

---

${_body}
EOF
}

panel_dir="$work/panel"
mkdir -p "$panel_dir"

# Prompt-file fan-out + provenance
"$panel_sh" --model grok --model "google/gemini-test" --out-dir "$panel_dir" --prompt-file "$prompt_file"
assert_file_contains "panel grok provenance" "$panel_dir/grok.md" "Model (exact) | \`grok\`"
assert_file_contains "panel slash-model provenance" "$panel_dir/google-gemini-test.md" "Model (exact) | \`google/gemini-test\`"
assert_file_contains "panel slash-model command" "$panel_dir/google-gemini-test.md" '--model "google/gemini-test"'
assert_file_contains "panel grok raw body" "$panel_dir/grok.md" "MOCK_OK"

# Stdin materialized once (both outputs share the same prompt)
panel_dir2="$work/panel-stdin"
mkdir -p "$panel_dir2"
printf 'shared-stdin-prompt' | "$panel_sh" --model a --model b --out-dir "$panel_dir2"
assert_file_contains "panel stdin model a" "$panel_dir2/a.md" "prompt=shared-stdin-prompt"
assert_file_contains "panel stdin model b" "$panel_dir2/b.md" "prompt=shared-stdin-prompt"

# Empty stdin rejected
panel_dir2b="$work/panel-empty-stdin"
mkdir -p "$panel_dir2b"
set +e
printf '' | "$panel_sh" --model a --out-dir "$panel_dir2b" 2>"$work/panel-empty-stdin.err"
st=$?
set -e
assert_eq "panel empty stdin exit" "$st" "1"

# No-clobber
printf 'KEEP-PANEL\n' >"$panel_dir/grok.md"
set +e
"$panel_sh" --model grok --model extra --out-dir "$panel_dir" --prompt-file "$prompt_file" 2>"$work/panel-noclobber.err"
st=$?
set -e
assert_eq "panel no-clobber exit" "$st" "1"
assert_file_contains "panel no-clobber preserves dest" "$panel_dir/grok.md" "KEEP-PANEL"
if [ -e "$panel_dir/extra.md" ]; then
  printf 'FAIL  panel no-clobber must not launch remaining models\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel no-clobber must not launch remaining models\n'
  pass=$((pass + 1))
fi

# Overwrite
"$panel_sh" --model grok --out-dir "$panel_dir" --prompt-file "$prompt_file" --overwrite
assert_file_contains "panel overwrite replaces dest" "$panel_dir/grok.md" "MOCK_OK"
assert_file_not_contains "panel overwrite drops old content" "$panel_dir/grok.md" "KEEP-PANEL"

# Normalization collision
set +e
"$panel_sh" --model foo/bar --model foo-bar --out-dir "$work/panel-collide" --prompt-file "$prompt_file" 2>"$work/collide.err"
st=$?
set -e
assert_eq "panel collision exit" "$st" "1"
assert_file_contains "panel collision message" "$work/collide.err" "normalization collision"

# Case-insensitive collision (macOS-safe)
set +e
"$panel_sh" --model Grok --model grok --out-dir "$work/panel-case" --prompt-file "$prompt_file" 2>"$work/case.err"
st=$?
set -e
assert_eq "panel case-collision exit" "$st" "1"
assert_file_contains "panel case-collision message" "$work/case.err" "normalization collision"

# Failure preservation: one fails, the other is kept, exit non-zero
mix_dir="$work/panel-mix"
mkdir -p "$mix_dir"
set +e
"$panel_sh" --model keep-me --model fail-me --out-dir "$mix_dir" --prompt-file "$prompt_file" 2>"$work/mix.err"
st=$?
set -e
assert_eq "panel mixed failure exit" "$st" "1"
assert_file_contains "panel mixed success preserved" "$mix_dir/keep-me.md" "MOCK_OK"
if [ -e "$mix_dir/fail-me.md" ]; then
  printf 'FAIL  panel must not write dest for failed model\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel must not write dest for failed model\n'
  pass=$((pass + 1))
fi
assert_file_contains "panel reports failed model" "$work/mix.err" "fail-me"

# Resume: skip only when existing output has exact matching provenance
resume_dir="$work/panel-resume"
mkdir -p "$resume_dir"
"$panel_sh" --model keep-me --out-dir "$resume_dir" --prompt-file "$prompt_file"
cp "$resume_dir/keep-me.md" "$work/keep-me.resume.bak"
"$panel_sh" --model keep-me --model also-new --out-dir "$resume_dir" --prompt-file "$prompt_file" --resume
if cmp -s "$resume_dir/keep-me.md" "$work/keep-me.resume.bak"; then
  printf 'PASS  panel resume matching provenance leaves dest unchanged\n'
  pass=$((pass + 1))
else
  printf 'FAIL  panel resume matching provenance rewrote dest\n'
  fail=$((fail + 1))
fi
assert_file_contains "panel resume matching provenance header" "$resume_dir/keep-me.md" "Model (exact) | \`keep-me\`"
assert_file_contains "panel resume writes missing" "$resume_dir/also-new.md" "MOCK_OK"

# Resume: non-empty without provenance fails safely (no skip, no overwrite, no other launch)
resume_miss="$work/panel-resume-missing"
mkdir -p "$resume_miss"
printf 'NO-PROVENANCE\n' >"$resume_miss/keep-me.md"
set +e
"$panel_sh" --model keep-me --model also-new --out-dir "$resume_miss" --prompt-file "$prompt_file" --resume 2>"$work/resume-missing.err"
st=$?
set -e
assert_eq "panel resume missing provenance exit" "$st" "1"
assert_file_contains "panel resume missing provenance message" "$work/resume-missing.err" "missing exact Model (exact) provenance"
assert_file_contains "panel resume missing provenance preserves dest" "$resume_miss/keep-me.md" "NO-PROVENANCE"
assert_file_not_contains "panel resume missing provenance does not wrap dest" "$resume_miss/keep-me.md" "MOCK_OK"
if [ -e "$resume_miss/also-new.md" ]; then
  printf 'FAIL  panel resume missing provenance must not launch remaining models\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel resume missing provenance must not launch remaining models\n'
  pass=$((pass + 1))
fi

# Resume: normalization-alias mismatch (foo/bar artifact resumed as foo-bar) fails
resume_alias="$work/panel-resume-alias"
mkdir -p "$resume_alias"
write_panel_stub "$resume_alias/foo-bar.md" "foo/bar" "foo-bar" "KEEP-ALIAS"
set +e
"$panel_sh" --model foo-bar --out-dir "$resume_alias" --prompt-file "$prompt_file" --resume 2>"$work/resume-alias.err"
st=$?
set -e
assert_eq "panel resume alias mismatch exit" "$st" "1"
assert_file_contains "panel resume alias mismatch message" "$work/resume-alias.err" "provenance mismatch"
assert_file_contains "panel resume alias mismatch names file model" "$work/resume-alias.err" "foo/bar"
assert_file_contains "panel resume alias mismatch names requested" "$work/resume-alias.err" "foo-bar"
assert_file_contains "panel resume alias mismatch preserves dest" "$resume_alias/foo-bar.md" "KEEP-ALIAS"
assert_file_not_contains "panel resume alias mismatch does not overwrite" "$resume_alias/foo-bar.md" "MOCK_OK"

# Resume + overwrite refused
set +e
"$panel_sh" --model keep-me --out-dir "$resume_dir" --prompt-file "$prompt_file" --resume --overwrite 2>"$work/resume-overwrite.err"
st=$?
set -e
assert_eq "panel resume+overwrite exit" "$st" "1"

# Parallelism: two slow models should overlap in wall time
par_dir="$work/panel-parallel"
mkdir -p "$par_dir"
export MOCK_SLEEP=2
if command -v python3 >/dev/null 2>&1; then
  start_ms=$(python3 -c 'import time; print(int(time.time()*1000))')
  "$panel_sh" --model slow-a --model slow-b --out-dir "$par_dir" --prompt-file "$prompt_file"
  end_ms=$(python3 -c 'import time; print(int(time.time()*1000))')
  elapsed_ms=$((end_ms - start_ms))
  # Sequential would be ~4000ms+. Allow generous overhead but require overlap.
  if [ "$elapsed_ms" -lt 3500 ]; then
    printf 'PASS  panel parallelism (elapsed %sms < 3500ms)\n' "$elapsed_ms"
    pass=$((pass + 1))
  else
    printf 'FAIL  panel parallelism (elapsed %sms; expected overlap)\n' "$elapsed_ms"
    fail=$((fail + 1))
  fi
else
  start=$(date +%s)
  "$panel_sh" --model slow-a --model slow-b --out-dir "$par_dir" --prompt-file "$prompt_file"
  end=$(date +%s)
  elapsed=$((end - start))
  if [ "$elapsed" -lt 4 ]; then
    printf 'PASS  panel parallelism (elapsed %ss < 4s sequential)\n' "$elapsed"
    pass=$((pass + 1))
  else
    printf 'FAIL  panel parallelism (elapsed %ss; expected overlap)\n' "$elapsed"
    fail=$((fail + 1))
  fi
fi
assert_file_contains "panel parallel wrote slow-a" "$par_dir/slow-a.md" "model=slow-a"
assert_file_contains "panel parallel wrote slow-b" "$par_dir/slow-b.md" "model=slow-b"
unset MOCK_SLEEP

assert_file_contains "panel manifest lists slow-a" "$par_dir/outputs.manifest" "slow-a.md"
assert_file_contains "panel manifest lists slow-b" "$par_dir/outputs.manifest" "slow-b.md"
if grep -Fx -- "README.md" "$par_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel manifest excludes README (unexpected README.md listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel manifest excludes README\n'
  pass=$((pass + 1))
fi

# Directory / symlink destinations
dir_panel="$work/panel-dir-dest"
mkdir -p "$dir_panel"
mkdir -p "$dir_panel/grok.md"
set +e
"$panel_sh" --model grok --out-dir "$dir_panel" --prompt-file "$prompt_file" 2>"$work/panel-dir.err"
st=$?
set -e
assert_eq "panel directory dest exit" "$st" "1"
assert_file_contains "panel directory dest message" "$work/panel-dir.err" "directory"

sym_panel="$work/panel-sym-dest"
mkdir -p "$sym_panel"
ln -s "$prompt_file" "$sym_panel/grok.md"
set +e
"$panel_sh" --model grok --out-dir "$sym_panel" --prompt-file "$prompt_file" --overwrite 2>"$work/panel-sym.err"
st=$?
set -e
assert_eq "panel symlink dest exit" "$st" "1"
assert_file_contains "panel symlink dest message" "$work/panel-sym.err" "symlink"
if [ -L "$sym_panel/grok.md" ]; then
  printf 'PASS  panel symlink dest remains a symlink\n'
  pass=$((pass + 1))
else
  printf 'FAIL  panel symlink dest was replaced\n'
  fail=$((fail + 1))
fi

# Resume: empty regular file is rerun/replaced; matching-provenance non-empty skipped
resume2="$work/panel-resume2"
mkdir -p "$resume2"
write_panel_stub "$resume2/keep-me.md" "keep-me" "keep-me" "KEEP-RESUME"
: >"$resume2/also-new.md"
"$panel_sh" --model keep-me --model also-new --out-dir "$resume2" --prompt-file "$prompt_file" --resume
assert_file_contains "panel resume keeps non-empty" "$resume2/keep-me.md" "KEEP-RESUME"
assert_file_not_contains "panel resume does not rewrite non-empty" "$resume2/keep-me.md" "MOCK_OK"
assert_file_contains "panel resume replaces empty" "$resume2/also-new.md" "MOCK_OK"
assert_file_contains "panel resume manifest skip" "$resume2/outputs.manifest" "keep-me.md"
assert_file_contains "panel resume manifest rerun" "$resume2/outputs.manifest" "also-new.md"

# Resume: directory dest rejected
resume_dir_dest="$work/panel-resume-dir"
mkdir -p "$resume_dir_dest"
mkdir -p "$resume_dir_dest/keep-me.md"
set +e
"$panel_sh" --model keep-me --out-dir "$resume_dir_dest" --prompt-file "$prompt_file" --resume 2>"$work/resume-dir.err"
st=$?
set -e
assert_eq "panel resume directory dest exit" "$st" "1"
assert_file_contains "panel resume directory dest message" "$work/resume-dir.err" "directory"

# Resume: symlink dest rejected
resume_sym="$work/panel-resume-sym"
mkdir -p "$resume_sym"
ln -s "$prompt_file" "$resume_sym/keep-me.md"
set +e
"$panel_sh" --model keep-me --out-dir "$resume_sym" --prompt-file "$prompt_file" --resume 2>"$work/resume-sym.err"
st=$?
set -e
assert_eq "panel resume symlink dest exit" "$st" "1"
assert_file_contains "panel resume symlink dest message" "$work/resume-sym.err" "symlink"

# Write-then-nonzero: must not publish raw, must list failure
wf_dir="$work/panel-writefail"
mkdir -p "$wf_dir"
set +e
"$panel_sh" --model keep-me --model writefail-me --out-dir "$wf_dir" --prompt-file "$prompt_file" 2>"$work/writefail.err"
st=$?
set -e
assert_eq "panel writefail mixed exit" "$st" "1"
assert_file_contains "panel writefail keeps success" "$wf_dir/keep-me.md" "MOCK_OK"
if [ -e "$wf_dir/writefail-me.md" ]; then
  printf 'FAIL  panel must not publish writefail dest\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel must not publish writefail dest\n'
  pass=$((pass + 1))
fi
assert_file_contains "panel writefail names failed model" "$work/writefail.err" "writefail-me"
assert_file_contains "panel writefail summary counts" "$work/writefail.err" "1 succeeded, 1 failed, 0 skipped"
assert_file_not_contains "panel writefail dest not in manifest" "$wf_dir/outputs.manifest" "writefail-me.md"
assert_file_contains "panel writefail success in manifest" "$wf_dir/outputs.manifest" "keep-me.md"

# Manifest merge: Codex + earlier seat survive; duplicates dropped; stale/unsafe not retained
merge_dir="$work/panel-manifest-merge"
mkdir -p "$merge_dir"
"$panel_sh" --model grok --out-dir "$merge_dir" --prompt-file "$prompt_file"
cat > "$merge_dir/codex-manual.md" <<'EOF'
# Panel output — Codex (plugin)

| Field | Value |
| --- | --- |
| Model (exact) | `codex-local-default` |
| Output label | `codex-manual` |
| Command | `/codex:review` |
| Written (UTC) | 2020-01-01T00:00:00Z |

Raw model output follows. This file is immutable session evidence; do not edit in place.

---

CODEX-BODY
EOF
printf 'ESCAPE-BODY\n' >"$work/escape.md"
mkdir -p "$merge_dir/nested"
printf 'NESTED-BODY\n' >"$merge_dir/nested/path.md"
ln -s "$merge_dir/grok.md" "$merge_dir/link-me.md"
: >"$merge_dir/empty-stale.md"
cat > "$merge_dir/outputs.manifest" <<'EOF'
# old comment that must not survive
grok.md
grok.md
codex-manual.md
gone-stale.md
../escape.md
/tmp/abs.md
README.md
nested/path.md
link-me.md
empty-stale.md
EOF
"$panel_sh" --model extra --out-dir "$merge_dir" --prompt-file "$prompt_file"
assert_file_contains "panel merge keeps earlier seat" "$merge_dir/outputs.manifest" "grok.md"
assert_file_contains "panel merge keeps Codex entry" "$merge_dir/outputs.manifest" "codex-manual.md"
assert_file_contains "panel merge lists new seat" "$merge_dir/outputs.manifest" "extra.md"
grok_n=$(grep -c -Fx -- "grok.md" "$merge_dir/outputs.manifest" || true)
assert_eq "panel merge grok listed once" "$grok_n" "1"
codex_n=$(grep -c -Fx -- "codex-manual.md" "$merge_dir/outputs.manifest" || true)
assert_eq "panel merge Codex listed once" "$codex_n" "1"
assert_file_contains "panel merge canonical header" "$merge_dir/outputs.manifest" "# cursor-panel.sh outputs.manifest"
assert_file_not_contains "panel merge drops old comments" "$merge_dir/outputs.manifest" "old comment that must not survive"
if grep -Fx -- "gone-stale.md" "$merge_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel merge drops stale missing (unexpected listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel merge drops stale missing\n'
  pass=$((pass + 1))
fi
if grep -Fx -- "../escape.md" "$merge_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel merge drops traversal (unexpected listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel merge drops traversal\n'
  pass=$((pass + 1))
fi
if grep -Fx -- "/tmp/abs.md" "$merge_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel merge drops absolute (unexpected listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel merge drops absolute\n'
  pass=$((pass + 1))
fi
if grep -Fx -- "README.md" "$merge_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel merge drops README (unexpected listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel merge drops README\n'
  pass=$((pass + 1))
fi
if grep -Fx -- "nested/path.md" "$merge_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel merge drops nested path (unexpected listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel merge drops nested path\n'
  pass=$((pass + 1))
fi
if grep -Fx -- "link-me.md" "$merge_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel merge drops symlink entry (unexpected listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel merge drops symlink entry\n'
  pass=$((pass + 1))
fi
if grep -Fx -- "empty-stale.md" "$merge_dir/outputs.manifest" >/dev/null; then
  printf 'FAIL  panel merge drops empty stale (unexpected listing)\n'
  fail=$((fail + 1))
else
  printf 'PASS  panel merge drops empty stale\n'
  pass=$((pass + 1))
fi
assert_file_contains "panel merge earlier seat file intact" "$merge_dir/grok.md" "model=grok"
assert_file_contains "panel merge Codex file intact" "$merge_dir/codex-manual.md" "CODEX-BODY"

# Malformed panel model id
set +e
"$panel_sh" --model 'foo*bar' --out-dir "$work/panel-badid" --prompt-file "$prompt_file" 2>"$work/panel-badid.err"
st=$?
set -e
assert_eq "panel malformed id exit" "$st" "1"
assert_file_contains "panel malformed id message" "$work/panel-badid.err" "invalid model id"

set +e
"$panel_sh" --model 'foo/../bar' --out-dir "$work/panel-badid2" --prompt-file "$prompt_file" 2>"$work/panel-trav.err"
st=$?
set -e
assert_eq "panel traversal id exit" "$st" "1"

# --seat distinct prompts; no shared prompt required
seat_a="$work/seat-a.txt"
seat_b="$work/seat-b.txt"
printf 'persona-alpha-prompt\n' >"$seat_a"
printf 'persona-beta-prompt\n' >"$seat_b"
seat_dir="$work/panel-seats"
mkdir -p "$seat_dir"
"$panel_sh" --seat grok "$seat_a" --seat extra "$seat_b" --out-dir "$seat_dir"
assert_file_contains "panel seat grok prompt" "$seat_dir/grok.md" "prompt=persona-alpha-prompt"
assert_file_contains "panel seat extra prompt" "$seat_dir/extra.md" "prompt=persona-beta-prompt"
assert_file_not_contains "panel seat grok not beta" "$seat_dir/grok.md" "persona-beta-prompt"
assert_file_not_contains "panel seat extra not alpha" "$seat_dir/extra.md" "persona-alpha-prompt"

# Combine --model (shared) and --seat
mix_seat="$work/panel-mix-seat"
mkdir -p "$mix_seat"
"$panel_sh" --model keep-me --seat extra "$seat_b" --out-dir "$mix_seat" --prompt-file "$prompt_file"
assert_file_contains "panel mix shared prompt" "$mix_seat/keep-me.md" "prompt=hello council"
assert_file_contains "panel mix seat prompt" "$mix_seat/extra.md" "prompt=persona-beta-prompt"

# --model still requires shared prompt
set +e
"$panel_sh" --model grok --out-dir "$work/panel-need-shared" --seat extra "$seat_b" \
  </dev/null 2>"$work/need-shared.err"
st=$?
set -e
assert_eq "panel --model without shared prompt exit" "$st" "1"

# Empty seat prompt rejected independently
empty_seat="$work/empty-seat.txt"
: >"$empty_seat"
set +e
"$panel_sh" --seat grok "$empty_seat" --out-dir "$work/panel-empty-seat" 2>"$work/empty-seat.err"
st=$?
set -e
assert_eq "panel empty seat prompt exit" "$st" "1"
assert_file_contains "panel empty seat prompt message" "$work/empty-seat.err" "seat prompt is empty"

# Seat prompt missing
set +e
"$panel_sh" --seat grok "$work/no-such-seat.txt" --out-dir "$work/panel-missing-seat" 2>"$work/missing-seat.err"
st=$?
set -e
assert_eq "panel missing seat prompt exit" "$st" "1"

# Concurrent --seat (overlap)
export MOCK_SLEEP=2
seat_par="$work/panel-seat-par"
mkdir -p "$seat_par"
if command -v python3 >/dev/null 2>&1; then
  start_ms=$(python3 -c 'import time; print(int(time.time()*1000))')
  "$panel_sh" --seat slow-a "$seat_a" --seat slow-b "$seat_b" --out-dir "$seat_par"
  end_ms=$(python3 -c 'import time; print(int(time.time()*1000))')
  elapsed_ms=$((end_ms - start_ms))
  if [ "$elapsed_ms" -lt 3500 ]; then
    printf 'PASS  panel --seat parallelism (elapsed %sms < 3500ms)\n' "$elapsed_ms"
    pass=$((pass + 1))
  else
    printf 'FAIL  panel --seat parallelism (elapsed %sms; expected overlap)\n' "$elapsed_ms"
    fail=$((fail + 1))
  fi
else
  printf 'SKIP  panel --seat parallelism (python3 not available)\n'
  skip=$((skip + 1))
fi
unset MOCK_SLEEP

# Grandchild cleanup: panel TERM must not leave descendants; must return promptly
gc_dir="$work/panel-grandchild"
mkdir -p "$gc_dir"
gc_pidfile="$work/grandchild.pid"
export MOCK_GRANDCHILD_PID_FILE="$gc_pidfile"
: >"$gc_pidfile"
"$panel_sh" --model grandchild-hang --out-dir "$gc_dir" --prompt-file "$prompt_file" \
  >"$work/gc.out" 2>"$work/gc.err" &
panel_pid=$!
n=0
while [ "$n" -lt 15 ]; do
  if [ -s "$gc_pidfile" ]; then
    break
  fi
  sleep 1
  n=$((n + 1))
done
if [ ! -s "$gc_pidfile" ]; then
  printf 'FAIL  grandchild pid file never appeared\n'
  fail=$((fail + 1))
  kill -TERM "$panel_pid" >/dev/null 2>&1 || true
  wait "$panel_pid" >/dev/null 2>&1 || true
else
  gpid=$(cat "$gc_pidfile")
  if kill -0 "$gpid" >/dev/null 2>&1; then
    printf 'PASS  grandchild is alive before interrupt\n'
    pass=$((pass + 1))
  else
    printf 'FAIL  grandchild was not alive before interrupt\n'
    fail=$((fail + 1))
  fi
  if command -v python3 >/dev/null 2>&1; then
    start_ms=$(python3 -c 'import time; print(int(time.time()*1000))')
  else
    start_s=$(date +%s)
  fi
  kill -TERM "$panel_pid" >/dev/null 2>&1 || true
  set +e
  wait "$panel_pid"
  pst=$?
  set -e
  if command -v python3 >/dev/null 2>&1; then
    end_ms=$(python3 -c 'import time; print(int(time.time()*1000))')
    elapsed_ms=$((end_ms - start_ms))
    if [ "$elapsed_ms" -lt 5000 ]; then
      printf 'PASS  panel interrupt returned promptly (%sms < 5000ms)\n' "$elapsed_ms"
      pass=$((pass + 1))
    else
      printf 'FAIL  panel interrupt slow (%sms)\n' "$elapsed_ms"
      fail=$((fail + 1))
    fi
  else
    end_s=$(date +%s)
    elapsed_s=$((end_s - start_s))
    if [ "$elapsed_s" -lt 5 ]; then
      printf 'PASS  panel interrupt returned promptly (%ss < 5s)\n' "$elapsed_s"
      pass=$((pass + 1))
    else
      printf 'FAIL  panel interrupt slow (%ss)\n' "$elapsed_s"
      fail=$((fail + 1))
    fi
  fi
  assert_eq "panel interrupt exit" "$pst" "130"
  sleep 1
  if kill -0 "$gpid" >/dev/null 2>&1; then
    printf 'FAIL  grandchild survived panel interrupt (pid %s)\n' "$gpid"
    fail=$((fail + 1))
    kill -KILL "$gpid" >/dev/null 2>&1 || true
  else
    printf 'PASS  grandchild did not survive panel interrupt\n'
    pass=$((pass + 1))
  fi
  if command -v pgrep >/dev/null 2>&1; then
    leftover=$(pgrep -P "$panel_pid" 2>/dev/null || true)
    if [ -z "$leftover" ]; then
      printf 'PASS  no leftover children of panel pid\n'
      pass=$((pass + 1))
    else
      printf 'FAIL  leftover children of panel pid: %s\n' "$leftover"
      fail=$((fail + 1))
    fi
  fi
fi
unset MOCK_GRANDCHILD_PID_FILE

printf '\n%s passed, %s failed, %s skipped\n' "$pass" "$fail" "$skip"
if [ "$fail" -gt 0 ]; then
  exit 1
fi
