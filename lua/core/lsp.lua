vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = true,
	virtual_text = {
		source = "if_many",
		prefix = "●",
	},
})

vim.lsp.enable({
	"bashls",
	"bicep",
	"docker_compose_language_service",
	"gopls",
	"html",
	"jsonls",
	"luals",
	"nil_ls",
	"ols",
	"rust_analyzer",
	"taplo",
	"templ",
	"ts_ls",
	"yamlls",
})
