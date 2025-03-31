return {
  'saghen/blink.cmp',
  dependencies = { 'fang2hou/blink-copilot' },
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
          auto_insert = false,
        },
      },
      trigger = {
        show_on_trigger_character = true,
      },
      documentation = { auto_show = true, window = { border = 'rounded' } },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },
  },
  opts_extend = { 'sources.default' },
}
