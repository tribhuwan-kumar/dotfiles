# My dotarch
This is a collection of my dotfiles

### Requirements:

Ensure you have the following installed:
- [git](https://git-scm.com/)

- [stow](https://www.gnu.org/software/stow/)

```bash
pacman -S stow
```

### Installation:

First, clone the repository to your home directory:

```bash
git clone https://github.com/tribhuwan-kumar/dotarch.git
```

Then, navigate to the dotfiles directory:

```bash
cd dotarch
```

Create symlinks to the dotfiles using stow:

```bash
stow .
```

### Used CLI utilities:
```bash
yay -S oh-my-posh
pacman -S lf fd bat eza fzf tree tmux kitty neovim zoxide ripgrep thefuck
```
