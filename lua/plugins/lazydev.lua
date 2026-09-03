return { -- LSP Plugin

	-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
	-- used for completion, annotations and signatures of Neovim apis
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "${3rd}/love2d/library", words = { "love" } },
		},
	},
	config = function(_, opts)
		require("lazydev").setup(opts)
		vim.lsp.config("lua_ls", {
			root_markers = { ".git", ".luarc.json" },
			settings = {
				Lua = {
					completion = { callSnippet = "Replace" },
					diagnostics = {
						disable = {
							"missing-fields",
							"lowercase-global",
							-- "name-style-check",
						},
					},
					workspace = {
						userThirdParty = vim.fn.expand("~/.local/share/LuaAddons"),
						checkThirdParty = "Apply",
					},
					telemetry = { enable = false },
				},
			},
		})
	end,
}
