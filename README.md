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
`ln -s ~/github/dotfiles/bat/* ~/.config/bat/`

#### Install oh-my-zsh

`git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh`

#### Install zsh prompt

`npm install -g spaceship-prompt`

#### Vim Plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### Install Language Servers

##### [C/C++](https://github.com/MaskRay/ccls/wiki/Build)

For ccls config in coc-settings, see https://github.com/MaskRay/ccls/issues/191

- See output of `clang -v -fsyntax-only -x c++ /dev/null` for `extraArgs`
- See output of `clang -print-resource-dir` for `resourceDir`

##### [Terraform](https://github.com/juliosueiras/terraform-lsp)

#### CoC Extensions

`coc-prettier` `coc-fzf-preview` `coc-eslint` `coc-tsserver` `coc-pyright` `coc-json` `coc-html` `coc-go` `coc-cmake` `coc-rust-analyzer`
