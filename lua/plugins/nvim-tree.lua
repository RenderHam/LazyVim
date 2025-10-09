return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				preserve_window_proportions = false,
			},
			renderer = {
				group_empty = true,
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = true,
							color = true,
						},
					},
				},
			},
			filters = {
				dotfiles = true,
			},
			diagnostics = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 500,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
				diagnostic_opts = false,
			},
		})
	end,
}
