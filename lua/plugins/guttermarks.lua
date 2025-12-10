return {
    'dimtion/guttermarks.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'FileType' },
    lazy = false,
    opts = {
        special_mark = {
            enabled = true,
        },
    },
}
