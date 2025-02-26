return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()
      require('nvim-dap-virtual-text').setup()

      vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = '[d]ap Toggle [b]reakpoint' })
      vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = '[d]ap [c]ontinue' })
      vim.keymap.set('n', '<Leader>dr', dap.restart, { desc = '[d]ap [r]estart' })
      vim.keymap.set('n', '<Leader>dg', dap.run_to_cursor, { desc = '[d]ap [g]o' })
      vim.keymap.set('n', '<Leader>dsi', dap.step_into)
      vim.keymap.set('n', '<Leader>dso', dap.step_over)
      vim.keymap.set('n', '<Leader>dst', dap.step_out)
      vim.keymap.set('n', '<Leader>dsb', dap.step_back)
      vim.keymap.set('n', '<Leader>dv', function()
        require('dapui').eval(nil, { enter = true })
      end, { desc = '[d]ap view' })

      vim.fn.sign_define(
        'DapBreakpoint',
        { text = '⏺', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' }
      )

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
