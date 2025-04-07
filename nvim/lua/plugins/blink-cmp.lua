return {
  'saghen/blink.cmp',
  dependencies = { 'giuxtaposition/blink-cmp-copilot' },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'enter',
      ['<TAB>'] = { 'select_next', 'fallback' },
      ['<S-TAB>'] = { 'select_prev', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      ghost_text = { enabled = true },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
      trigger = {
        show_on_trigger_character = true,
      },
      documentation = { auto_show = true, window = { border = 'rounded' } },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      per_filetype = {
        sql = { 'dadbod', 'buffer' },
      },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 100,
          async = true,
        },
        dadbod = {
          name = 'dadbod',
          module = 'vim_dadbod_completion.blink',
        },
      },
    },
  },
  opts_extend = { 'sources.default' },
}
