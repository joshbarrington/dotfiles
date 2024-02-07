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

# Starship prompt
eval "$(starship init zsh)"
# Zoxide - intelligent cd
eval "$(zoxide init zsh)"

# Brew zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Broot
source $HOME/.config/broot/launcher/bash/br

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# path(s) to asdf installs
export PATH=$HOME/.asdf/installs/python/3.8.10/bin:$PATH
export PATH=$HOME/.asdf/installs/nodejs/16.20.2/bin:$PATH

# path
export PATH="/Users/joshua.barrington/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# aliases
alias tree='tree -I "$(paste -d\| -s ~/.treeignore)"'
alias lg='lazygit'
alias cd='z' # cd to (z)oxide
