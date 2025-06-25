return {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            html = { 'prettier' },
            htmlangular = { 'prettier' },
            sql = { 'sqlfmt' },
            markdown = { 'prettier' },
            go = { 'goimports' },
            yaml = { 'yamlfmt' },

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
}
