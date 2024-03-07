# My dotarch
This is a collection of my dotfiles

### Requirements:

Ensure you have the following installed:
- [git](https://git-scm.com/)

```bash
pacman -S git
```

- [stow](https://www.gnu.org/software/stow/)

```bash
pacman -S stow
```

### Installation:

First, clone the repository to your home directory:

```bash
git clone https://github.com/tribhuwan-kumar/dotfiles.git
```

Then, navigate to the dotfiles directory:

```bash
cd dotfiles
```

Create symlinks to the dotfiles using stow:

```bash
stow .
```

### Used CLI utilities:
```bash
pacman -S fd bat exa fzf tmux neovim zoxide ripgrep thefuck 
yay -S oh-my-posh
```


