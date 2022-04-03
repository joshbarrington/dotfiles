# Path to your oh-my-zsh installation.
export ZSH="/Users/joshuabarrington/.oh-my-zsh"

plugins=(
  git
  docker
)

# Speed up zsh start up
DISABLE_UNTRACKED_FILES_DIRTY="true"
SKIP_GLOBAL_COMPINIT=1

source $ZSH/oh-my-zsh.sh

# Brew zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Broot
source /Users/joshuabarrington/.config/broot/launcher/bash/br

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# asdf start up script
. /usr/local/opt/asdf/asdf.sh

# export PATH="/usr/local/sbin:/usr/local/opt/llvm/bin:$PATH"

# go path
# export GOPATH=$HOME/.asdf/installs/golang/1.15/go
# export GOBIN=$HOME/.asdf/installs/golang/1.15/go/bin

# path to asdf python
export PATH=$HOME/.asdf/installs/python/3.8.12/bin:$PATH

# path to asdf go
# export PATH=$GOPATH:$GOBIN:$PATH

# rustup
# source "$HOME/.cargo/env"

# aliases
alias tree='tree -I "$(paste -d\| -s ~/.treeignore)"'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"
