#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

set -e

printf "${YELLOW}
███████╗████████╗ █████╗ ██████╗ ████████╗    ██╗   ██╗██████╗
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝    ██║   ██║██╔══██╗
███████╗   ██║   ███████║██████╔╝   ██║       ██║   ██║██████╔╝
╚════██║   ██║   ██╔══██║██╔══██╗   ██║       ██║   ██║██╔═══╝
███████║   ██║   ██║  ██║██║  ██║   ██║       ╚██████╔╝██║
╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝ ╚═╝
${NC}"

sudo printf "${YELLOW}Shell elevated with su permissions${NC}\n"

require() {
    command -v "${1}" &>/dev/null && return 0
    printf "${RED}Missing required application: %s${NC}\n" "${1}" >&2
    return 1
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # install linuxbrew dependencies
    # install yq to parse yaml files
    if require apt; then
        sudo apt update
        sudo apt install -y build-essential procps curl file git
        snap install yq --channel=v3/stable
    fi
fi


if ! require brew; then
    printf "${YELLOW}Installing Homebrew${NC}\n"
    export NONINTERACTIVE=1
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [ -d "/home/linuxbrew/.linuxbrew/bin/brew"]; then
            alias brew='sudo -Hu linuxbrew brew'
        else
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if [ -d "/opt/homebrew/bin/brew"]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    fi
    brew update
else
    printf "${YELLOW}Updating Homebrew${NC}\n"
    brew update
fi

printf "${YELLOW}Installing Homebrew packages${NC}\n"
brew install $(yq -er ".homebrew_installed_packages.[]" packages.yaml)

# Essentials to be installed on Ubuntu
# - wezterm - https://wezterm.org/install/linux.html
# - chrome
# - fira-code-nerd-font - can be installed with brew install ... --cask
# - sway/waybar

# Need to source linuxbrew in bashrc if Linux, to run stow and zsh
sudo printf "${YELLOW}Applying GNU Stow${NC}\n"
rm -f ~/.zshrc
mkdir -p ~/.config
stow -v --adopt -t $HOME home

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
# set starship config
starship preset nerd-font-symbols > ~/.config/starship.toml

# Add linuxbrew to .zshrc if linux
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo printf "${YELLOW}Setting zsh as default shell${NC}\n"
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $(whoami)
zsh -l

printf "${GREEN}Setup complete${NC}\n"
