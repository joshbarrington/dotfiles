return {
  'olimorris/codecompanion.nvim',
  dependencies = {},
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'copilot',
        },
      },
      completion = { provider = 'blink.cmp' },
    }
  end,
}
