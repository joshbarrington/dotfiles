return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  init = function()
    vim.opt.foldenable = true
    -- vim.opt.foldcolumn = 'auto:9'
    -- vim.o.foldcolumn = '1'
    vim.opt.foldlevel = 99 -- Keep folds open
    vim.opt.foldlevelstart = 99
    vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldclose:'
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end,
  opts = {
    provider_selector = function()
      return { 'treesitter', 'indent' }
    end,
  },
}
