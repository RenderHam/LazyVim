return {
	"uZer/pywal16.nvim",
	dev = true,
	lazy = false,
	priority = 0,
	config = function()
		require("pywal16").setup({})

		vim.cmd.colorscheme("pywal16")
	end,
}
