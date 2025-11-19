vim.keymap.set('n', '<C-p>', function()
    vim.cmd [[
    setlocal wrapmargin=33
    setlocal formatoptions+=t
    setlocal linebreak
    setlocal wrap
    setlocal foldcolumn=9
    setlocal signcolumn=yes:9
  ]]
end, { desc = 'Enable wrapping and layout options' })
