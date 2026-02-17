return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
    },
    config = function()
      -- 1. Use an Autocommand for keymaps (The 0.11+ way)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
          end

          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })

      -- 2. Define servers with the correct 'settings' nesting
      local servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              staticcheck = true,
              completeUnimported = true,
              usePlaceholders = true,
              buildFlags = { "-tags=manual" },
            },
          },
        },
        pyright = {},
        rust_analyzer = {},
        taplo = {},
        lua_ls = {
          settings = { -- THIS WRAPPER IS REQUIRED
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Ensure blink is loaded before calling this
      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      -- 3. Use the native enable function
      for server_name, config in pairs(servers) do
        -- Merge custom settings with the default configuration provided by nvim-lspconfig
        local defaults = vim.lsp.config[server_name] or {}
        vim.lsp.config[server_name] = vim.tbl_deep_extend('force', defaults, {
          capabilities = capabilities,
          settings = config.settings,
        })
        vim.lsp.enable(server_name)
      end

      vim.lsp.handlers['textDocument/codeAction'] = vim.lsp.with(vim.lsp.handlers.code_action, {
        border = 'rounded',
        relative = 'cursor', -- Makes it appear "inline" at the cursor
      })
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    end,
  },
}
