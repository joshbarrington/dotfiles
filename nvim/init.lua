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
  'airblade/vim-gitgutter',
  'shumphrey/fugitive-gitlab.vim',

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
      require('gruvbox').setup {}
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
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-live-grep-args.nvim' },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

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

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    path_display = { 'truncate' },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    live_grep = {
      additional_args = function()
        return { '--hidden', '--follow', '--glob', '!**/.git/*' }
      end,
    },
    find_files = {
      hidden = true,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'markdown', 'yaml', 'toml', 'gomod' },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
