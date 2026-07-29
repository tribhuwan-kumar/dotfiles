#!/usr/bin/env bash

PID_FILE="/tmp/flutter_run_$$.pid"

cleanup() {
    rm -f "$PID_FILE"
    trap - EXIT INT TERM
    kill -- -$$ 2>/dev/null
}

trap cleanup EXIT INT TERM

watchexec --quiet --watch lib/ --exts dart --postpone -- "
    if [ -f '$PID_FILE' ]; then
        echo -e '\n[Auto-Reload] File change detected. Triggering hot reload...'
        kill -SIGUSR1 \$(cat '$PID_FILE')
    fi
" &

# Accept args
flutter run --pid-file="$PID_FILE" "$@"
