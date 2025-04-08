require 'settings'
require 'keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'shumphrey/fugitive-gitlab.vim',
  'mg979/vim-visual-multi',

  {
    'JezerM/oil-lsp-diagnostics.nvim',
    opts = {},
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },

  {
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
  },

  {
    'folke/which-key.nvim',
    config = function()
      local wk = require 'which-key'
      wk.add {
        { '<leader>ya', '<cmd>%y<cr>', desc = 'Buffer contents' },
        { '<leader>yp', "<cmd>let @+ = expand('%:~:.')<cr> <cmd><cr>", desc = 'Relative Path' },
      }
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        overrides = {
          SignColumn = { bg = '#282828' },
        },
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  { 'numToStr/Comment.nvim', opts = {} },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        sql = { 'sqlfmt' },
        markdown = { 'prettier' },
        go = { 'goimports' },
      },
    },
    keys = {
      {
        '<leader>bf',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = 'n',
        desc = '[F]ormat buffer',
      },
    },
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },

  { import = 'plugins' },
}, {})

-- Remove trailing whitespace on write
vim.api.nvim_create_autocmd('BufWritePre', { command = '%s/\\s\\+$//e' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'markdown', 'yaml', 'toml', 'gomod' },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

