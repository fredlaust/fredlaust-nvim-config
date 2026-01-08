if vim.loop.os_uname().sysname == "Linux" then
    path = '~/Source/Obsidian-Notes/Main-Obsidian-Vault'
elseif vim.loop.os_uname().sysname == "Windows_NT" then
    path = "C:\\Users\\frede\\Documents\\Obsidian Vault\\"
else 
    print'Error setting path for Obsidian'
end

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
                path = path
            },
        },

        completion = {
            min_chars = 1,
        },

        picker = {
            name = 'telescope.nvim',
        },

        -- ui = { enable = false },

        note_id_func = function(title)
            return title
        end,

        new_notes_location = 'notes_subdir',
    },
}
