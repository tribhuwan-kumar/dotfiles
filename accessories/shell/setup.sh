#!/usr/bin/env bash

configs=(
  "$HOME/.bashrc"
  "$HOME/.tmux.conf"
  "$HOME/.config/lf"
  "$HOME/.config/nix"
  "$HOME/.config/pip"
  "$HOME/.config/mpv"
  "$HOME/.config/imv"
  "$HOME/.config/nvim"
  "$HOME/.config/kitty"
)

packages=(
  "base-devel"
  "lf"
  "git"
  "bat"
  "mpv"
  "imv"
  "feh"
  "fzf"
  "eza"
  "bat"
  "lua"
  "stow"
  "tree"
  "tmux"
  "htop"
  "kitty"
  "neovim"
  "nomacs"
  "zoxide"
  "luajit"
  "nodejs"
  "firefox"
  "nethogs"
  "neofetch"
  "ctpv-git"
  "luarocks"
  "shellcheck"
  "teamviewer"
  "oh-my-posh"
  "wl-clipboard"
  "tree-sitter-lua"
  "bash-completion"
  "telegram-desktop"
  "proton-vpn-gtk-app"
  "firefox-developer-edition"
)

installPackges() {
  for package in "${packages[@]}"; do
    if ! pacman -Qi "$package" &> /dev/null; then
      echo -e "$package is not found installing with pacman!!"
      if ! sudo pacman -S --noconfirm "$package"; then
        echo -e "$package doesn't found in pacman attempting to install with yay!!"
        if ! yay --noconfirm "$package"; then
          echo -e "failed to install $package with both pacman and yay, manaual intervation is required"
        else
          echo -e "$package installed successfully!!"
        fi
      else
        echo -e "$package successfully installed!!"
      fi
    else
      echo -e "$package is already installed, skipping!"
    fi
  done
}

installOrphanPackages() {
  if ! command -v trashbhuwan &> /dev/null; then
    curl -s -O https://raw.githubusercontent.com/tribhuwan-kumar/trashbhuwan/main/trashbhuwan && chmod +x trashbhuwan && sudo mv trashbhuwan /usr/local/bin/
  fi
  if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  fi
  if [ ! -d "$HOME/.tmux/plugins/tpm" ] &> /dev/null; then
    git clone https://github.com/tmux-plugins/tpm.git "$HOME/.tmux/plugins/tpm"
  fi
  if fc-list | grep -i -e "FantasqueSans" -e "San Francisco" > /dev/null; then
    echo "fonts are already installed"
  else
    sudo cp "$HOME/dotfiles/accessories/FantasqueSansMono" "$HOME/dotfiles/accessories/San Francisco" /usr/share/fonts
  fi
  if [ ! -d "$HOME/.local/share/icons/WhiteSur" ]; then
    git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git && cd WhiteSur-icon-theme && ./install.sh && cd .. && rm -rf ./WhiteSur-icon-theme
  fi
  if [ ! -f "$HOME/.local/share/color-schemes/Vendetta.colors" ]; then
    ln -s "$HOME/dotfiles/accessories/KDE/Vendetta.colors" "$HOME/.local/share/color-schemes/Vendetta.colors"
  fi
}

setupDotfiles() {
  for config in "${configs[@]}"; do
    if [ -d "$config" ] || [ -f "$config" ] &> /dev/null; then
      echo -e "'$config' configuration already exists!!"
    fi
  done
  echo -e "configuration of these applications are already exists!!"
  read -p "Are sure want to delete these configurations and use dotfiles's configurations? [y/N] " RESPONSE
  case "$RESPONSE" in
    [yY][eE][sS]|[yY])
      for config in "${configs[@]}"; do
        mv "$config" "$config.bak"
      done
      if [ ! -d "$HOME/dotfiles" ] &> /dev/null; then
        echo -e "checking essential pacakages"
        installPackges
        installOrphanPackages
        echo -e "setting up dotfiles, please wait!!"
        git clone --branch lsp https://github/tribhuwan-kumar/dotfiles.git "$HOME/dotfiles"
        if cd "$HOME/dotfiles" && stow . > /dev/null; then
          echo -e "dotfiles's configuration was successfull, now you can enjoy the perfect OS enviorment :)"
        else
          echo -e "something went wrong, please report it"
        fi
      else
        echo -e "checking essential pacakages"
        installPackges
        installOrphanPackages
        if cd "$HOME/dotfiles" && stow . > /dev/null; then
          echo -e "dotfiles's configuration was successfull, now you can enjoy the perfect OS enviorment :)"
        else
          echo -e "something went wrong, please report it"
        fi
      fi
      ;;
    *)
      echo "dotfiles setup cancelled!!"
      ;;
  esac
}

setupDotfiles

# kde accent color ==> #726c5a

