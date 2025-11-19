--  NOTE: Must happen before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'plugins' },
}, { --UI til Nvim
    ui = {
        -- if you are using a nerd font: set icons to an empty table which will use the
        -- default lazy.nvim defined nerd font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
        border = 'rounded',
    },
})

-- Importerer andre config filer
require 'autcmds'
require 'keymappings'
require 'plugins-config'
require 'settings'

--LSP-specific configs
-- vim.lsp.config('tinymist', {
--
--     settings = {
--
--         formatterMode = 'typstyle',
--
--         exportPdf = 'onType',
--
--         semanticTokens = 'disable',
--     },
-- })

-- Ændre visual mode colors
-- https://vonheikemen.github.io/learn-nvim/feature/colorscheme.html
-- vim.cmd 'highlight Visual guibg=#404040'

vim.env.PATH = vim.env.HOME .. '/node_modules/.bin:' .. vim.env.PATH
