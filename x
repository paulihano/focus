#!/usr/bin/bash
#
# x [EMACS-OPTIONS] FILE-NAME [EMACS-CLIENT-OPTIONS]
#
# emacsclient isnot a simple startup
# dependent upon focus
#
# Note: EMACS-OPTIONS will NOT be used if emacs is already running
# --debug-init to locate init problem # M-x goto-pos # to goto a character position
# --no-desktop to deal with desktop problems
#

gBase=$(basename "$0")

declare -a aOptions=()
while [[ - = "${1:0:1}" ]]; do
  aOptions+=("$1")
  shift
done
focus emacs "${aOptions[@]}" # startup emacs without any file
[[ 0 -eq $# ]] && exit # emacsclient will complain without file to open

declare -i zTimeDown=80 # 8 seconds given .1 sleep
while ! emacsclient --no-wait "$@" 2>/dev/null; do
  # --no-wait or emacsclient will wait for buffer to close
  # 2>/dev/null recieves client not found error until emacs is started
  sleep 0.1 # give emacs more time to start
  [[ 0 = $(( zTimeDown-- )) ]] \
    && >&2 "!!! $gBase: emacs startup timed out. !!!" \
    && exit 124 # same code as timeout
done
# attempt to focus the file after startup routines are complete
# would be better to ask emacs what the current buffer is
# would be even better if emacs would focus itself as asked
sleep 1
emacsclient --no-wait "$@"
