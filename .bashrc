#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="HOME/.local/bin:$PATH"
export LC_ALL=en_IN.UTF-8


eval "$(oh-my-posh --init --shell bash --config /home/freakybytes/.cache/oh-my-posh/themes/Blade-Runner-2049.omp.json)"
eval "$(zoxide init --cmd cd bash)"
# export _ZO_FZF_OPTS="--case-insensitive --query=''"

PS1="\u@\h:\w\$ "
# ZSH_THEME="robbyrussell"
set show-all-if-ambiguous on


alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'


# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n

# NPM
export PATH=~/.npm-global/bin:$PATH

#Bash autocompletion
# bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'
bind "set completion-ignore-case on"
export VIRTUAL_ENV_DISABLE_PROMPT=1



source /usr/share/bash-completion/bash_completion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'


export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=header,grid --line-range :500 {} 2> /dev/null"'

alias ll='ls --color=auto'
alias gs='git status'
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias vim='nvim'
alias vi='nvim'
alias nf='neofetch'
alias c='clear'
alias tx='tmux'
alias ex='exit'

#pip search alias
alias psrch='pip_search'
alias pip='function _pip(){
    if [ $1 = "search" ]; then
        pip_search "$2";
    else pip "$@";
    fi;
};_pip'


# Created by `pipx` on 2024-01-18 08:17:45
export PATH="$PATH:/home/freakybytes/.local/bin"
