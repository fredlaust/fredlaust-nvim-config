-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*.typ',
    callback = function()
        -- disable markview for this buffer
        vim.cmd 'Markview disable'
        -- or if it has a buf-local toggle:
        -- require("markview").buf_detach(0)
    end,
})
