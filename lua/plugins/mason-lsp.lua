return {
	"mason-org/mason-lspconfig.nvim",
	lazy = false,
	build = ":MasonUpdate",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
					width = 0.8,
					height = 0.8,
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"bashls",
				"clangd",
				"taplo",
				"templ",
				"yamlls",
				"jqls",
				"stylua",
				"phpactor",
			},
			automatic_enable = {
				--Install em first
				-- exclude = {
				-- 	"ts_ls",
				-- },
			},
		})
	end,
}
