return { -- Color scheme
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'navarasu/onedark.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('onedark').setup {
      style = 'darker',
      code_style = {
        comments = 'none',
      },
    }
    require('onedark').load()
  end,
}
