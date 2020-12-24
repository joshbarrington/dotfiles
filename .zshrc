# Path to your oh-my-zsh installation.
export ZSH="/Users/joshua.barrington/.oh-my-zsh"

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

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# asdf start up script
. /usr/local/opt/asdf/asdf.sh

export PATH="/usr/local/sbin:/usr/local/opt/llvm/bin:$PATH"
# go path
export GOPATH=$HOME/.asdf/installs/golang/1.15/go
export GOBIN=$HOME/.asdf/installs/golang/1.15/go/bin
# path to asdf python
export PATH=$HOME/.asdf/installs/python/3.6.10/bin:$PATH
# path to asdf go
export PATH=$GOPATH:$GOBIN:$PATH
