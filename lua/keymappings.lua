-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- MINE EGNE KEYMAPS I GUESS
-- Remaps til scrolling half-page, så den også centrerer
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Neotree keymaps
vim.keymap.set('n', '<C-æ>', '<CMD>Neotree toggle<CR>')

-- Luasnip keymaps
local ls = require 'luasnip'

vim.keymap.set({ 'i' }, '<C-K>', function()
    ls.expand()
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-L>', function()
    ls.jump(1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-H>', function()
    ls.jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

-- Oil keymaps
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Snacks

-- Obsidian
vim.keymap.set('n', '<leader>of', '<cmd>Obsidian quick_switch<cr>') -- f som i find files ligesom i telescope. lidt mere ergonomic end q
vim.keymap.set('n', '<leader>ob', '<cmd>Obsidian backlinks<cr>')
vim.keymap.set('n', '<leader>on', '<cmd>Obsidian new<cr>')
vim.keymap.set('n', '<leader>os', '<cmd>Obsidian search<cr>')
vim.keymap.set('n', '<leader>op', '<cmd>Obsidian paste_image<cr>')
vim.keymap.set('n', '<leader>oc', '<cmd>Obsidian check<cr>')
vim.keymap.set('n', '<leader>ot', '<cmd>Obsidian tags<cr>')
vim.keymap.set('n', '<leader>oi', '<cmd>Obsidian toc<cr>') -- i som i indholdsfortegnelse
vim.keymap.set('v', '<leader>ol', ':Obsidian link<cr>')
vim.keymap.set('v', '<leader>oe', '<cmd>Obsidian extract_note<cr>')
vim.keymap.set('v', '<leader>on', '<cmd>Obsidian link_new<cr>')

-- grep vault
vim.keymap.set('n', '<leader>og', function()
    require('telescope.builtin').live_grep { cwd = '/home/write/Source/Obsidian-Notes/Main-Obsidian-Vault/' }
end, { desc = 'Grep Vault' })

--WebDev shit
vim.keymap.set('n', '<leader>ps', '<cmd>LivePreview start<CR>')
vim.keymap.set('n', '<leader>pc', '<cmd>LivePreview close<CR>')

-- NoNeckPain
vim.keymap.set('n', '<leader>cc', '<cmd>NoNeckPain<cr>', { desc = '[C]enter with NoNeckPain' })
vim.keymap.set('n', '<leader>cu', '<cmd>NoNeckPainWidthUp<cr>', { desc = '[C]enter [W]idth [U]p' })
vim.keymap.set('n', '<leader>cd', '<cmd>NoNeckPainWidthDown<cr>', { desc = '[C]enter [W]idth [D]own' })

-- Colorscheme
vim.keymap.set('n', '<leader>1', '<cmd>colorscheme flexoki<cr>')
vim.keymap.set('n', '<leader>2', '<cmd>colorscheme flexoki2<cr>')

-- Quickfix list
vim.keymap.set('n', '<A-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<A-k>', '<cmd>cprev<CR>zz')

-- Diagnostic ting
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = '[D]iagnostic [O]pen float' })
vim.keymap.set('n', '<leader>dh', vim.diagnostic.hide, { desc = '[D]iagnostic [H]ide' })
vim.keymap.set('n', '<leader>ds', vim.diagnostic.show, { desc = '[D]iagnostic [S]how' })

vim.keymap.set('n', '<leader>dn', function()
    vim.diagnostic.jump { diagnostic = vim.diagnostic.get_next() }
    vim.schedule(function()
        vim.diagnostic.open_float()
    end)
end, { desc = '[D]iagnostic [N]ext' })

vim.keymap.set('n', '<leader>dp', function()
    vim.diagnostic.jump { diagnostic = vim.diagnostic.get_prev() }
    vim.schedule(function()
        vim.diagnostic.open_float()
    end)
end, { desc = '[D]iagnostic [N]ext' })
