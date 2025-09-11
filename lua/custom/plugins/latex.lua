-- require('texpresso').attach()
-- latex related vim shit
return {
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_compiler_latexmk_engines = { _ = '-pdflatex' }
      vim.g.vimtex_view_method = 'zathura'
    end,
  },

  {
    'let-def/texpresso.vim',
    lazy = false,
  },
}

-- Latex settings

-- vimtex

-- texpresso

-- luasnip
