-- de her keymaps gælder så kun ved scd i guess
vim.keymap.set('n', '<leader>cms', '<cmd>SCNvimStart<CR>', { desc = 'Super[C]ollider [S]tart' })
vim.keymap.set('n', '<leader>cmp', '<cmd>SCNvimStop<CR>', { desc = 'Super[C]ollider Sto[P]' })
vim.keymap.set('n', '<leader>cmr', '<cmd>SCNvimRecompile<CR>', { desc = 'Super[C]ollider [R]ecompile' })
vim.keymap.set('n', '<leader>cmg', '<cmd>SCNvimGenerateAssets<CR>', { desc = 'Super[C]ollider [G]enerate assets' })
vim.keymap.set('n', '<leader>cml', '<cmd>SCNvimStatusLine<CR>', { desc = 'Super[C]ollider Status[l]ine' })
vim.keymap.set('n', '<leader>cmd', '<cmd>Telescope scdoc<CR>', { desc = 'Super[C]ollider [D]ocs' })
