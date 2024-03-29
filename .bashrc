#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh --init --shell bash --config ~/dotfiles/Blade-Runner-2049.omp.json)"
eval "$(zoxide init --cmd cd bash)"

PS1="\u@\h:\w\$ "

# HSTR configuration 
alias hh=hstr
export HSTR_CONFIG=hicolor
shopt -s histappend
export HISTCONTROL=ignorespace
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
# synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n

# Bash completion
source /usr/share/bash-completion/bash_completion
bind 'TAB:menu-complete'
set show-all-if-ambiguous on
bind 'set show-all-if-ambiguous on'
bind "set completion-ignore-case on"


# some exports
export LC_ALL=en_IN.UTF-8
export PATH="HOME/.local/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export VIRTUAL_ENV_DISABLE_PROMPT=1

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=header,grid --line-range :500 {} 2> /dev/null"'

# Aliases
alias tx='tmux'
alias ex='exit'
alias vi='nvim'
alias c='clear'
alias vim='nvim'
alias ga='git add'
alias nf='neofetch'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gc='git commit'
alias gs='git status'
alias gaa='git add --all'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

#pip search alias
alias psrch='pip_search'
alias pip='function _pip(){
    if [ $1 = "search" ]; then
        pip_search "$2";
    else pip "$@";
    fi;
};_pip'

# tmux session restoration
alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

# Created by `pipx` on 2024-01-18 08:17:45
export PATH="$PATH:/home/freakybytes/.local/bin"
