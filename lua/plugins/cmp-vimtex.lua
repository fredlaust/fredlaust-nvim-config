return {
    {
        'micangl/cmp-vimtex',
        ft = 'tex',
        config = function()
            require('cmp_vimtex').setup {}
        end,
    },
}
