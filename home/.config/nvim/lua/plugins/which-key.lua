return {
    'folke/which-key.nvim',
    config = function()
        local wk = require 'which-key'
        wk.add {
            { '<leader>ya', '<cmd>%y<cr>',                                 desc = 'Buffer contents' },
            { '<leader>yp', "<cmd>let @+ = expand('%:~:.')<cr> <cmd><cr>", desc = 'Relative Path' },
        }
    end,
}
