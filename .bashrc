#
# ~/.bashrc
#
[[ $- != *i* ]] && return

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
alias psrch='pip_search'
alias grep='grep -i --color=auto'
alias hibernate='systemctl hibernate'
alias ls="exa --icons --group-directories-first"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(green)%h%C(reset) - %C(magenta)%aD%C(reset) %C(yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(cyan)%s%C(reset) %C(dim blue)- %an%C(reset)' --all"
alias pyenv-venv='eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"'
alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

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
. "/home/freakybytes/.deno/env"

# Some exports
export EDITOR="nvim"
export TERMIAL="kitty"
export BAT_THEME="gruvbox-dark"
export BROWSER="firefox"
export LC_ALL=en_IN.UTF-8
export PATH="HOME/.local/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH="$PATH:/home/freakybytes/.local/bin"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"

# FZF
export FZF_DEFAULT_COMMAND="rg --files"

export FZF_DEFAULT_OPTS="
  --color=fg:#bdae93,fg+:#ebdbb2,bg:#0C0D0C,bg+:#292929
  --color=hl:#bdae93,hl+:#ebdbb2,info:#afaf87,marker:#a9b665
  --color=prompt:#ea6962,spinner:#7daea3,pointer:#e78a4e,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border-label=''
  --border='rounded'
  --preview-window='border-rounded'
  --bind 'ctrl-y:preview-up,ctrl-e:preview-down'
  --bind 'ctrl-b:preview-page-up,ctrl-f:preview-page-down'
  --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'
  --bind 'shift-up:preview-top,shift-down:preview-bottom'
  --bind 'alt-up:half-page-up,alt-down:half-page-down'
  --preview 'bat -n --color=always --style=header,grid --line-range :500 {} 2> /dev/null'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target,env,__pycache__,.next,dist
  --preview 'tree -C {}'"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target,env,__pycache__,.next,dist
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(fzf --bash)"
eval "$(oh-my-posh --init --shell bash --config ~/dotarch/accessories/vendetta.omp.json)"
eval "$(zoxide init --cmd cd bash)"
