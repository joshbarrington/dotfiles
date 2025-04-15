return {
  'olimorris/codecompanion.nvim',
  dependencies = {},
  config = function()
    require('codecompanion').setup {
      adapters = {
        openrouter = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = {
              url = 'https://openrouter.ai/api',
              api_key = 'OPENROUTER_API_KEY',
              chat_url = '/v1/chat/completions',
            },
            schema = {
              model = {
                default = 'deepseek/deepseek-chat-v3-0324:free',
              },
            },
          })
        end,
      },
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
    }
  end,
}
