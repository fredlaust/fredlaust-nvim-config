-- using lazy.nvim
return {
	"S1M0N38/love2d.nvim",
	-- event = "VeryLazy",
	ft = "lua",
	version = vim.version.range("3"),
	opts = {
		path_to_love_bin = "love-git",
	},
	keys = {
		{ "<leader>v", ft = "lua", desc = "LÖVE" },
		{ "<leader>vv", "<cmd>Love run<cr>", ft = "lua", desc = "Run LÖVE" },
		{ "<leader>vs", "<cmd>Love stop<cr>", ft = "lua", desc = "Stop LÖVE" },
		{ "<leader>vw", "<cmd>Love watch<cr>", ft = "lua", desc = "Watch LÖVE" },
		{ "<leader>vi", "<cmd>Love info<cr>", ft = "lua", desc = "Info LÖVE" },
		{ "<leader>vo", "<cmd>Love output<cr>", ft = "lua", desc = "Output LÖVE" },
	},
	enabled = true,
}
