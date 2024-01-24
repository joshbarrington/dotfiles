return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>o',
      function()
        require('oil').open()
      end,
      mode = 'n',
      desc = 'open [O]il',
    },
  },
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
      },
    }
  end,
}
