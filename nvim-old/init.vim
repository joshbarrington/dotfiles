let g:python3_host_prog = "/Users/" . $USER . "/.venv/neovim3/bin/python"

let mapleader = " "

set termguicolors

set mouse=a
set ruler
set cursorcolumn
set cursorline
set hidden
set number
set nowrap
set clipboard=unnamedplus
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set completeopt=longest,menuone
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Paste over visual selection
vnoremap p "_dP
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Remove trailing whitespace on save of .py files
autocmd BufWritePre *.py :%s/\s\+$//e

" CoC example config
set shortmess+=c                " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>e :<C-u>CocList diagnostics<cr>
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> K :call CocAction('doHover')<CR>

call plug#begin()
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot'
    Plug 'Yggdroot/indentLine'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
    Plug 'tpope/vim-surround' 
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-rhubarb'
    Plug 'vwxyutarooo/nerdtree-devicons-syntax'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'machakann/vim-highlightedyank'
    Plug 'conradirwin/vim-bracketed-paste'
    Plug 'gruvbox-community/gruvbox'
    Plug 'wincent/ferret'
    Plug 'pangloss/vim-javascript'
    Plug 'mattn/emmet-vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" NvimTree
map <C-n> :NvimTreeOpen<CR>
map <C-c> :NvimTreeClose<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Ctrl-Space to open completion list
inoremap <silent><expr> <c-space> coc#refresh()
" Use enter to confirm coc completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Airline 
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Emmet leader key use ',,' to trigger HTML tag completion
let g:user_emmet_leader_key=','

" Select Airline Tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5

" Appearance
set background=dark
colorscheme gruvbox

" Set .mk extension to Make filetype
au BufRead,BufNewFile *.mk setfiletype Make

" Don't conceal or fold markdown and json
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1

noremap <Leader>f :Format<CR>
noremap <Leader>i :CocCommand python.sortImports<CR>
noremap <Leader>p :CocCommand fzf-preview.ProjectFiles<CR>
noremap <Leader>g :CocCommand fzf-preview.GitFiles<CR>
noremap <Leader>b :CocCommand fzf-preview.Buffers<CR>
noremap <leader>r :Rg<CR>

" Add missing imports on save
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" FZF preview options
let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_command = 'bat  --style=numbers --color=always --line-range :500 {-1}'
let g:fzf_preview_fzf_preview_window_option = 'nowrap'

lua require'nvim-tree'.setup {}
