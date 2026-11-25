return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = "markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		-- Rendered view in normal/command/terminal mode; raw text elsewhere.
		preset = "none",
		completions = { lsp = { enabled = true } },
	},
	keys = {
		{
			"<leader>tm",
			function()
				require("render-markdown").toggle()
			end,
			desc = "Toggle markdown rendering",
		},
	},
}
