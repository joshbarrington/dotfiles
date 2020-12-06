# dotfiles

## Setup

#### Install brew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

#### Install pip

`sudo easy_install pip`

#### Install Ansible

`pip install ansible`

#### Install oh-my-zsh

`git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh`

#### Install zsh prompt

`npm install -g spaceship-prompt`

#### Install Language Servers

##### [C/C++](https://github.com/MaskRay/ccls/wiki/Build)

For ccls config in coc-settings, see https://github.com/MaskRay/ccls/issues/191

- See output of `clang -v -fsyntax-only -x c++ /dev/null` for `extraArgs`
- See output of `clang -print-resource-dir` for `resourceDir`

##### [Terraform](https://github.com/juliosueiras/terraform-lsp)

#### CoC Extensions

`coc-prettier` `coc-fzf-preview` `coc-eslint` `coc-tsserver` `coc-python` `coc-json` `coc-html` `coc-go`
