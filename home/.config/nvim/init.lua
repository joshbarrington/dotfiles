require 'settings'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'shumphrey/fugitive-gitlab.vim',
  'mg979/vim-visual-multi',
  {
    'JezerM/oil-lsp-diagnostics.nvim',
    opts = {},
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  { 'numToStr/Comment.nvim',               opts = {} },
  { import = 'plugins' },
}, {})

-- Remove trailing whitespace on write
vim.api.nvim_create_autocmd('BufWritePre', { command = '%s/\\s\\+$//e' })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'markdown', 'yaml', 'toml', 'gomod' },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}
