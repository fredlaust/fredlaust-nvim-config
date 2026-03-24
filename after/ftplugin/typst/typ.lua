-- Typst keymaps
vim.keymap.set('n', '<leader>tP', '<CMD>TypstPreview<CR>', { desc = 'Typst Preview in browser' })

vim.keymap.set('n', '<leader>tw', '<CMD>TypstWatch<CR>', { desc = 'Typst Preview in PDF-viewer' })

vim.cmd [[
    setlocal wrapmargin=10
    setlocal formatoptions+=t
    setlocal linebreak
    setlocal spell
    setlocal wrap
]]
