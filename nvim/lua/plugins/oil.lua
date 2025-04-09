return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      lsp_file_methods = {
        enabled = true,
      },
    }
    vim.keymap.set('n', '<leader>o', function()
      require('oil').open()
    end, { desc = 'Open [O]il' })
  end,
}
