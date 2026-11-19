return {
	"stevearc/conform.nvim",
	event = "BufReadPre",
	config = function()
		vim.g.autoformat = true
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				-- go = { "goimports_reviser", "gofmt" },
				html = { "prettier" },
				javascript = { "prettier" },
				typescript = { "ts_ls" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				-- rust = { "rustfmt" },
				scss = { "prettier" },
				sh = { "shfmt" },
				-- templ = { "templ" },
				toml = { "taplo" },
				yaml = { "prettier" },
				php = { "php_cs_fixer" },
				go = { "gopls" },
			},

			format_after_save = function()
				if not vim.g.autoformat then
					return
				else
					return { lsp_format = "fallback" }
				end
			end,

			formatters = {
				-- goimports_reviser = {
				-- 	command = "goimports-reviser",
				-- 	args = { "-output", "stdout", "$FILENAME" },
				-- },
			},
		})
	end,
}
