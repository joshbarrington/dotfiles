vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.background = 'dark'
vim.o.termguicolors = true
-- Shift width
vim.o.sw = 4
-- Tabstop
vim.o.ts = 4
-- Expand tab
vim.o.et = true
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'auto:2'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- Show cursor positon
vim.o.cursorline = true
vim.o.cursorcolumn = true
-- Autoindenting
vim.o.expandtab = true
-- No wrap
vim.o.wrap = false
-- Diagnostics
vim.diagnostic.config { jump = { float = true } }
