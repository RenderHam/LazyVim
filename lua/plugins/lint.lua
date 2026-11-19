return {
	"mfussenegger/nvim-lint",
	event = "BufReadPre",
	config = function()
		local lint = require("lint")

		-- Lua diagnostics are provided by lua_ls.
		lint.linters_by_ft = {
			bash = { "shellcheck" },
			markdown = { "markdownlint-cli2" },
			sh = { "shellcheck" },
			yaml = { "yamllint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("config_lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})

		vim.api.nvim_create_user_command("Lint", function()
			lint.try_lint()
		end, { desc = "Run linters for the current buffer" })
	end,
}
