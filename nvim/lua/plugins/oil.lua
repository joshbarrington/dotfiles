return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
        require("oil").setup()
        vim.keymap.set("n", "<leader>o", function() require("oil").open() end, { desc = "Open [O]il" })
  end,
}
