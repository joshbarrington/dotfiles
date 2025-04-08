return {
  'nanozuki/tabby.nvim',
  config = function()
    require('tabby').setup {
      preset = 'active_wins_at_tail',
      option = {
        nerdfont = true,
        lualine_theme = 'gruvbox',
      },
    }
    vim.api.nvim_set_keymap('n', '<leader>ta', ':$tabnew<CR>', { noremap = true, desc = '[t]ab [a]dd' })
    vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true, desc = '[t]ab [c]lose' })
  end,
}
