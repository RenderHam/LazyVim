return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		variant = "default",
		transparent = true,
		saturation = 1,
		italic_comments = true,
		hide_fillchars = false,
		borderless_pickers = false,
		terminal_colors = true,
		cache = true,
	},
	config = function(_, opts)
		require("cyberdream").setup(opts)
		vim.cmd("colorscheme cyberdream")
	end,
}
