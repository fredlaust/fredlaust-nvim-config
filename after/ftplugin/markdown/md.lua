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

-- https://www.reddit.com/r/neovim/comments/ynm6n6/comment/iva5pgg/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- Hentede den nedenstående funktionalitet fra reddit
local colorscheme = 'flexoki2'
local ok, _ = pcall(vim.api.nvim_command, 'colorscheme ' .. colorscheme)
if not ok then
    print 'error setting colorscheme'
end

vim.opt_local.conceallevel = 2
