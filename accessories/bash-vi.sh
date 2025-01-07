paste_from_clipboard() {
    local shift=$1
    local head=${READLINE_LINE:0:READLINE_POINT+shift}
    local tail=${READLINE_LINE:READLINE_POINT+shift}
    local paste=$(pbpaste -n)
    local paste_len=${#paste}

    READLINE_LINE=${head}${paste}${tail}
    let READLINE_POINT+=$paste_len+$shift-1
}

yank_line_to_clipboard() {
    echo $READLINE_LINE | pbcopy
}

kill_line_to_clipboard() {
    yank_line_to_clipboard
    READLINE_LINE=""
}

bind -m vi-command -x '"P": paste_from_clipboard 0'
bind -m vi-command -x '"p": paste_from_clipboard 1'
bind -m vi-command -x '"yy": yank_line_to_clipboard'
bind -m vi-command -x '"xx": kill_line_to_clipboard'
bind -m vi-command '"k": history-search-backward'
bind -m vi-command '"j": history-search-forward'
