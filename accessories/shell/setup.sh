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
  "bc"
  "lf"
  "git"
  "bat"
  "mpv"
  "imv"
  "feh"
  "fzf"
  "eza"
  "ufw"
  "bat"
  "lua"
  "less"
  "wget"
  "stow"
  "tree"
  "tmux"
  "htop"
  "kitty"
  "p7zip"
  "bluez"
  "rsync"
  "aria2"
  "neovim"
  "nomacs"
  "zoxide"
  "luajit"
  "kanata"
  "blueman"
  "kvantum"
  "nftables"
  "flatpak"
  "ntfs-3g"
  "firefox"
  "nethogs"
  "kwallet"
  "neofetch"
  "ctpv-git"
  "pipewire"
  "luarocks"
  "spectacle"
  "alsa-utils"
  "shellcheck"
  "teamviewer"
  "oh-my-posh"
  "intel-ucode"
  "kwallet-pam"
  "wireplumber"
  "exfat-utils"
  "ksshaskpass"
  "bluez-utils"
  "sof-firmware"
  "wl-clipboard"
  "iptables-nft"
  "pipewire-alsa"
  "pipewire-jack"
  "alsa-firmware"
  "kwalletmanager"
  "kde-gtk-config"
  "pipewire-pulse"
  "tree-sitter-lua"
  "bash-completion"
  "plasma-firewall"
  "telegram-desktop"
  "proton-vpn-gtk-app"
  "pipewire-libcamera"
  "power-profiles-daemon"
  "exfat-utils" "ntfs-3g" "aria2"
)

installBase() {
  if ! command -v git &> /dev/null; then
    sudo pacman -S git base-devel
  fi
  if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si
  fi
  if ! command -v rustc &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
  if ! command -v bun &> /dev/null; then
    curl -fsSL https://bun.com/install | bash
  fi
  if ! command -v npm &> /dev/null; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  fi
}

installBase

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
    sudo cp -r "$HOME/dotfiles/accessories/fonts/FantasqueSansMono" "$HOME/dotfiles/accessories/fonts/San Francisco" /usr/share/fonts
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
        echo -e "setting up dotfiles, please wait!!"
        git clone --branch lsp https://github/tribhuwan-kumar/dotfiles.git "$HOME/dotfiles"
        echo -e "checking essential pacakages"
        installPackges
        installOrphanPackages
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
