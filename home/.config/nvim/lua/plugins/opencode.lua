return {
  'sudo-tee/opencode.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        anti_conceal = { enabled = false },
        file_types = { 'markdown', 'opencode_output' },
      },
      ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
    },
  },
  config = function()
    require('opencode').setup({})

    vim.keymap.set("n", "<leader>qc", function()
      Snacks.input({
        prompt = "Opencode Quick Chat",
        icon = " ",
        win = { relative = "cursor" }
      }, function(value)
        if value and value ~= "" then
          require("opencode.api").quick_chat(value)
        end
      end)
    end, { desc = "Opencode Quick Chat" })
  end,
}
