return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon'):setup()
    require('harpoon'):extend(require('harpoon.extensions').builtins.command_on_nav 'UfoEnableFold')
  end,
  keys = (function()
    local mappings = {
      {
        '<leader>ha',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon [a]dd file',
      },
      {
        '<leader>hm',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon [m]enu',
      },
    }
    for i = 1, 6 do
      table.insert(mappings, {
        '<leader>' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon file ' .. i,
      })
    end
    return mappings
  end)(),
}
