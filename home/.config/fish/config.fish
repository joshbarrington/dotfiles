/opt/homebrew/bin/brew shellenv | source

set -gx DOCKER_DEFAULT_PLATFORM linux/amd64

# Add Neovim Mason tools to PATH
fish_add_path -a ~/.local/share/nvim/mason/bin

if status is-interactive
    set -g fish_greeting

    # Starship prompt
    starship init fish | source
    # Zoxide - intelligent cd, replaces cd directly
    zoxide init fish --cmd cd | source
    # fzf key bindings and fuzzy completion
    fzf --fish | source
    # mise for version management
    mise activate fish | source

    # abbreviations (expand inline on space)
    abbr -a lg lazygit
    abbr -a nv 'nvim .'
    abbr -a T 'eza -T'

    # openrouter llm
    abbr -a deepseek 'llm -m deepseek'
    abbr -a gemini-flash 'llm -m gemini-flash'
    abbr -a gemini-or 'llm -m gemini'

    alias tree='tree -I (paste -d\| -s ~/.treeignore | string collect)'

    # !k7 - bash file: env via bass, aliases are fish-compatible as-is
    if test -f ~/.k7
        functions -q bass; and bass source ~/.k7
        grep '^alias ' ~/.k7 | source
    end
end

# llm - plain `export X=y` lines, which fish understands
test -f ~/.llm-keys; and source ~/.llm-keys
