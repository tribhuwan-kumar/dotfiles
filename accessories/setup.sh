#!/usr/bin/env bash

if [ ! -d "$HOME/dotarch" ];then
    git clone https://github/tribhuwan-kumar/dotarch.git "$HOME/dotarch"
fi

checkFile() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        echo "$1 configuration already exists!"
        read -p "Are sure want to delete the current config of $1? [y/N] " RESPONSE
        case "$RESPONSE" in
            [yY][eE][sS]|[yY]) 
                rm -rf "$1"
                return 0
                ;;
            *)
                echo "Cancelled"
                exit 1
                ;;
        esac
    fi
    cd "$HOME/dotarch" || exit && stow .
}

checkPackage(){
    if ! command -v "$1" &> /dev/null; then
        if [ "$1" == "oh-my-posh" ];then
            echo "'$1' is not found!"
            echo "Installing $1"
            yay -S "oh-my-posh"
        elif [ "$1" == "nvim" ];then
            echo "'$1' is not found!"
            echo "Installing $1"
            sudo pacman -S "neovim"
        elif [ "$1" == "trashbhuwan" ];then
            echo "'$1' is not found!"
            echo "Installing $1"
            curl -O https://raw.githubusercontent.com/tribhuwan-kumar/trashbhuwan/main/trashbhuwan && chmod +x trashbhuwan && sudo mv trashbhuwan /usr/local/bin/
        else
            sudo pacman -S "$1"
        fi
    fi
}


checkPackage "curl"
checkPackage "git"
checkPackage "lf"
checkPackage "bat"
checkPackage "mpv"
checkPackage "imv"
checkPackage "eza"
checkPackage "fzf"
checkPackage "stow"
checkPackage "tree"
checkPackage "tmux"
checkPackage "nvim"
checkPackage "kitty"
checkPackage "zoxide"
checkPackage "wl-clipboard"
checkPackage "trashbhuwan"

checkFile "$HOME/.bashrc"
checkFile "$HOME/.tmux.conf"
checkFile "$HOME/.config/lf"
checkFile "$HOME/.config/nix"
checkFile "$HOME/.config/pip"
checkFile "$HOME/.config/mpv"
checkFile "$HOME/.config/imv"
checkFile "$HOME/.config/nvim"
checkFile "$HOME/.config/kitty"


font_install() {
    read -p "Install fonts? [y/N] " RESPONSE
    case "$RESPONSE" in
        [yY][eE][sS]|[yY]) 
            sudo cp "$HOME/dotarch/accessories/FantasqueSansMono" "$HOME/dotarch/accessories/San Francisco" /usr/share/fonts
            return 0
            ;;
        *)
            echo "Not installing fonts"
            exit 1
            ;;
    esac
}
font_install

checkVimPlug(){
    if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
}
checkVimPlug

installTPM(){
    if [ ! -d "$HOME/.tmux" ]; then
        git clone https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"
    fi
}
installTPM
