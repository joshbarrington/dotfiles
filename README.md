# dotfiles

## Setup

#### Install brew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

#### Install Ansible / Run playbook

- https://github.com/geerlingguy/mac-dev-playbook
- replace contents of `default.config.yml` with `mac-dev-playbook/config.yml`

#### Reset git remote to use SSH

`git remote set-url origin git@github.com:USERNAME/REPOSITORY.git`

#### Symlinks

`ln -s ~/github/dotfiles/nvim/* ~/.config/nvim/`\
`ln -s ~/github/dotfiles/bat/* ~/.config/bat/`\
`ln -s ~/github/dotfiles/starship/starship.toml  ~/.config/starship.toml`

#### Install oh-my-zsh

`git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh`

#### Set Starship icons
`starship preset nerd-font-symbols > ~/.config/starship.toml`

#### Misc Applications

[Spek](https://github.com/withmorten/spek-alternative/releases)
