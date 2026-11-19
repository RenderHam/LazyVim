return {
	"stevearc/conform.nvim",
	event = "BufReadPre",
	init = function()
		vim.g.autoformat = true
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		default_format_opts = { lsp_format = "fallback" },
		formatters_by_ft = {
			["_"] = { "trim_whitespace" },
			css = { "prettier" },
			dart = { "dart_format" },
			go = { "goimports", "gofmt" },
			html = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			php = { "php_cs_fixer" },
			scss = { "prettier" },
			sh = { "shfmt" },
			templ = { "templ" },
			toml = { "taplo" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = function()
			if vim.g.autoformat == false then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters = {
			shfmt = { prepend_args = { "-i", "4" } },
		},
	},
}
