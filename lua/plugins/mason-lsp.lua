return {
	"mason-org/mason-lspconfig.nvim",
	lazy = false,
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
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				auto_update = false,
				ensure_installed = {
					-- Formatters
					"stylua",
					"prettier",
					"shfmt",
					"goimports",
					"taplo",
					"php-cs-fixer",
					-- Linters
					"shellcheck",
					"yamllint",
					"markdownlint-cli2",
				},
			},
		},
	},
	opts = {
		-- Language servers. Custom settings live in `lsp/<server>.lua`.
		ensure_installed = {
			"bashls",
			"clangd",
			"gopls",
			"html",
			"jsonls",
			"jqls",
			"lua_ls",
			"phpactor",
			"rust_analyzer",
			"tailwindcss",
			"taplo",
			"templ",
			"ts_ls",
			"yamlls",
		},
		automatic_enable = true,
	},
}
