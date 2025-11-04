-- Typst keymaps
vim.keymap.set('n', '<C-å>', '<CMD>TypstPreview<CR>', { desc = 'Typst Preview in browser' })

vim.keymap.set('n', '<C-p>', '<CMD>TypstWatch<CR>', { desc = 'Typst P review in PDF-viewer' })

vim.cmd [[
    setlocal wrapmargin=10
    setlocal formatoptions+=t
    setlocal linebreak
    setlocal spell
    setlocal wrap
]]
