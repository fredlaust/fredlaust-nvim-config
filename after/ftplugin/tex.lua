require('texpresso').attach()
local autocmd = vim.api.nvim_create_autocmd
autocmd({ 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('texpressoGroup', {}),
  callback = function()
    vim.cmd 'TeXpressoSync'
  end,
})
