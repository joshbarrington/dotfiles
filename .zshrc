plugins=(
  git
  docker
)

export ZSH=$HOME/.oh-my-zsh

# Speed up zsh start up
DISABLE_UNTRACKED_FILES_DIRTY="true"
SKIP_GLOBAL_COMPINIT=1
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

# Brew zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Broot
source $HOME/.config/broot/launcher/bash/br

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# path to asdf python
export PATH=$HOME/.asdf/installs/python/3.8.10/bin:$PATH

# aliases
alias tree='tree -I "$(paste -d\| -s ~/.treeignore)"'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"

# Starship prompt
eval "$(starship init zsh)"
