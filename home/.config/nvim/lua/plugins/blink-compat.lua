return {
  'saghen/blink.compat',
  version = '2.*',
  lazy = true,
  -- make sure to set opts so that lazy.nvim calls blink.compat's setup
  opts = {
    debug = true,
    impersonate_nvim_cmp = true,
  },
}
