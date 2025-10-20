-- Hjælper med formattering i tekst, så alt ikke er 1 linje, auto linebreak når den når wrapmargin
vim.cmd [[
    setlocal wrapmargin=10
    setlocal formatoptions+=t
    setlocal linebreak
    setlocal spell
    setlocal wrap
]]

-- VimTex keymaps
vim.keymap.set('i', '<C-s>', function()
  require('cmp_vimtex.search').search_menu()
end)
