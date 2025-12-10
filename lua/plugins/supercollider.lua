return {
    'davidgranstrom/scnvim',
    lazy = false,
    config = function()
        local scnvim = require 'scnvim'
        local map = scnvim.map
        local map_expr = scnvim.map_expr
        scnvim.setup {
            keymaps = {

                ['<M-e>'] = map('editor.send_line', { 'i', 'n' }),
                ['<C-e>'] = {
                    map('editor.send_block', { 'i', 'n' }),
                    map('editor.send_selection', 'x'),
                },
                ['<CR>'] = map 'postwin.toggle',
                -- ['<M-CR>'] = map('postwin.toggle', 'i'),
                ['<C-L>'] = map('postwin.clear', { 'n', 'i' }),
                ['<C-k>'] = map('signature.show', { 'n', 'i' }),
                ['<leader>cs'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
                ['<leader>ct'] = map 'sclang.start',
                ['<leader>ck'] = map 'sclang.recompile',
                ['<leader>cb'] = map_expr 's.boot',
                ['<leader>ce'] = map_expr 's.meter',
            },
            editor = {
                highlight = {
                    color = 'IncSearch',
                },
            },
            postwin = {
                float = {
                    enabled = true,
                },
            },
        }
    end,
}
