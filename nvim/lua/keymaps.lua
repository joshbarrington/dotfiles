-- Continuous visual tabbing
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Keeping the cursor centered.
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous result' })
-- Move visual selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Paste without delete
vim.keymap.set('x', 'p', [["_dP]])
-- Delete without yank
vim.keymap.set('x', '<leader>d', [["_d]])
-- Map Ctrl + Option + h/j/k/l for pane navigation
vim.keymap.set('n', '<C-M-h>', '<C-w>h', { desc = 'Move to left pane' }) -- Ctrl + Option + h (left)
vim.keymap.set('n', '<C-M-j>', '<C-w>j', { desc = 'Move to bottom pane' }) -- Ctrl + Option + j (down)
vim.keymap.set('n', '<C-M-k>', '<C-w>k', { desc = 'Move to top pane' }) -- Ctrl + Option + k (up)
vim.keymap.set('n', '<C-M-l>', '<C-w>l', { desc = 'Move to right pane' }) -- Ctrl + Option + l (right)
-- Git diff
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>', { desc = '[G]it [D]iff', silent = true })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.get_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.get_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- Split resize keymaps
vim.keymap.set('n', '<M-j>', '<Cmd>resize +2<CR>', { noremap = true, silent = true, desc = 'Increase window height' })
vim.keymap.set('n', '<M-k>', '<Cmd>resize -2<CR>', { noremap = true, silent = true, desc = 'Decrease window height' })
vim.keymap.set(
  'n',
  '<M-l>',
  '<Cmd>vertical resize +2<CR>',
  { noremap = true, silent = true, desc = 'Increase window width' }
)
vim.keymap.set(
  'n',
  '<M-h>',
  '<Cmd>vertical resize -2<CR>',
  { noremap = true, silent = true, desc = 'Decrease window width' }
)
