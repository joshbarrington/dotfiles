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
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Broot
source $HOME/.config/broot/launcher/bash/br

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# aliases
alias tree='tree -I "$(paste -d\| -s ~/.treeignore)"'
alias lg='lazygit'
alias cd='z' # cd to (z)oxide
alias nv='nvim .'
alias T='eza -T'

# mise for version management
eval "$(mise activate zsh)"

# openrouter llm
alias deepseek='llm -m deepseek'
alias gemini-flash='llm -m gemini-flash'
alias gemini='llm -m gemini'

# !k7
[ -f ~/.k7 ] && source ~/.k7
# llm
[ -f ~/.llm-keys ] && source ~/.llm-keys
