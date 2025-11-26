-- TODO: Tilføj funktion til at åbne nye noter fra any dir, og så ender det henne vault
return {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    -- ft = 'markdown',
    lazy = false,

    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in the next major release
        workspaces = {
            {
                name = 'personal',
                path = '~/Source/Obsidian-Notes/Main-Obsidian-Vault',
            },
        },

        completion = {
            nvim_cmp = true,
            -- min_chars = 2,
        },

        picker = {
            name = 'telescope.nvim',
        },

        -- ui = { enable = false },

        new_notes_location = 'notes_subdir',
    },
}
