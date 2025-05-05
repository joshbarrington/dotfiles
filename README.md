# dotfiles

## Setup

#### Install brew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

#### Generate GitHub SSH key

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

#### Install Ansible / Run playbook

- https://github.com/geerlingguy/mac-dev-playbook
- replace contents of `default.config.yml` with `mac-dev-playbook/config.yml`

#### Reset git remote to use SSH

`git remote set-url origin git@github.com:USERNAME/REPOSITORY.git`

#### Stow
`stow -v -t $HOME home`

#### Pipe brew.yaml list
`yq e -r ".homebrew_installed_packages.[]" brew.yaml`

#### Install oh-my-zsh

`git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh`

#### Set Starship icons
`starship preset nerd-font-symbols > ~/.config/starship.toml`

#### Misc Applications

- [Spek](https://github.com/withmorten/spek-alternative/releases)
- [FakinTheFunk](https://fakinthefunk.net/en/)
