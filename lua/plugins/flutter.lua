return {
	"nvim-flutter/flutter-tools.nvim",
	ft = "dart",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		lsp = {
			color = { enabled = true },
		},
		debugger = { enabled = false },
	},
}
