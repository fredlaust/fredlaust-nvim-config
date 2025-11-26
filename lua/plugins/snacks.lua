return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        --
        -- animate
        -- bigfile = { enabled = true },
        -- bufdelete = { enabled = true },
        -- dashboard = { enabled = true },
        -- debug = { enabled = true },
        -- dim = { enabled = true },
        -- explorer = { enabled = true },
        -- gh = { enabled = true },
        -- git = { enabled = true },
        -- gitbrowse = { enabled = true },
        image = { enabled = true },
        -- indent = { enabled = true },
        -- input = { enabled = true },
        -- keymap = { enabled = true },
        -- layout = { enabled = true },
        lazygit = {
            enabled = true,
            configure = true,
        },
        -- notifier = { enabled = true },
        -- notify = { enabled = true },
        -- picker = { enabled = true },
        -- profiler = { enabled = true },
        -- quickfile = { enabled = true },
        -- rename = { enabled = true },
        -- scope = { enabled = true },
        -- scratch = { enabled = true },
        -- scroll = { enabled = true },
        -- statuscolumn = { enabled = true },
        -- terminal = { enabled = true },
        -- toggle = { enabled = true },
        -- util = { enabled = true },
        -- win = { enabled = true },
        -- words = { enabled = true },
        -- zen = { enabled = true },
    },
    keys = {
        {
            '<leader>gg',
            function()
                Snacks.lazygit()
            end,
            desc = 'Lazygit',
        },
    },
}
