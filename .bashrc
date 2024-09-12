#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

eval "$(fzf --bash)"
eval "$(zoxide init --cmd cd bash)"
eval "$(oh-my-posh --init --shell bash --config ~/dotarch/accessories/vendetta.omp.json)"

PS1="\u@\h:\w\$ "

# History
shopt -s histappend
export HISTSIZE=200000
export HISTFILESIZE=200000
export HISTCONTROL=ignoredups:ignorespace:erasedups
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# BASH VI mode
source $HOME/dotarch/accessories/bash-vi.sh
bind 'set editing-mode vi'
bind 'set show-mode-in-prompt on'
bind 'set keyseq-timeout 0.01'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'
bind 'set keymap vi-insert'
bind 'RETURN: "\e\n"'

# Bash completion
source /usr/share/bash-completion/bash_completion
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind "set completion-ignore-case on"


# Some exports
export EDITOR="nvim"
export TERMIAL="kitty"
export BAT_THEME="ansi"
export BROWSER="firefox"
export LC_ALL=en_IN.UTF-8
export PATH="HOME/.local/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export VIRTUAL_ENV_DISABLE_PROMPT=1

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!**/.git/*" --glob "!**/__pycache__/*" --glob "!**/node_modules/*" --glob "!**/env/*" --glob "!**/target/*"'
export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=header,grid --line-range :500 {} 2> /dev/null"'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window up:3:hidden:wrap --bind 'ctrl-/:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"

# Aliases
alias hh=hstr
alias cat='bat'
alias tx='tmux'
alias ex='exit'
alias vi='nvim'
alias c='clear'
alias ga='git add'
alias nf='neofetch'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gc='git commit'
alias gs='git status'
alias gaa='git add --all'
alias trsh='trashbhuwan'
alias grep='grep -i --color=auto'
alias ls="exa --icons --group-directories-first"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(green)%h%C(reset) - %C(magenta)%aD%C(reset) %C(yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(cyan)%s%C(reset) %C(dim blue)- %an%C(reset)' --all"
alias pyenv-venv='eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"'

#pip search alias
alias psrch='pip_search'
alias pip='function _pip(){
    if [ $1 = "search" ]; then
        pip_search "$2";
    else pip "$@";
    fi;
};_pip'

# TMUX session restoration
alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

# Created by `pipx` on 2024-01-18 08:17:45
export PATH="$PATH:/home/freakybytes/.local/bin"

# lf icons
export LF_ICONS="\
tw=󰉋:\
st=󰉋:\
ow=󰉋:\
dt=󰉋:\
di=󰉋:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=󰵸:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.webp=:\
*.svg=:\
*.svgz=󰜡:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
