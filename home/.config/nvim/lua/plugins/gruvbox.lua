return {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
        require('gruvbox').setup {
            overrides = {
                SignColumn = { bg = '#282828' },
                DiagnosticSignError = { bg = '#282828', fg = '#fa4834' },
                DiagnosticSignWarn = { bg = '#282828', fg = '#d69821' },
                DiagnosticSignHint = { bg = '#282828', fg = '#689c69' },
                DiagnosticSignInfo = { bg = '#282828', fg = '#458487' },
            },
        }
        vim.cmd.colorscheme 'gruvbox'
    end,
}
