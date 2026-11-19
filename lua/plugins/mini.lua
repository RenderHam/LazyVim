return {
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"echasnovski/mini.icons",
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("mini.icons").setup(opts)
			require("mini.icons").mock_nvim_web_devicons()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("mini_indentscope_disable", { clear = true }),
				pattern = {
					"help",
					"lazy",
					"mason",
					"notify",
					"snacks_terminal",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"echasnovski/mini.files",
		keys = {
			{
				"<leader>ee",
				function()
					local path = vim.bo.buftype ~= "nofile" and vim.api.nvim_buf_get_name(0) or nil
					local ok = pcall(require("mini.files").open, path)
					if not ok then
						require("mini.files").open()
					end
				end,
				desc = "Open file explorer",
			},
		},
		opts = {
			windows = { width_focus = 40, width_nofocus = 40 },
		},
	},
}
