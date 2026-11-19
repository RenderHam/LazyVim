return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "v1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = { preset = "default" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		snippets = { preset = "luasnip" },
		signature = { enabled = true },
		cmdline = { completion = { menu = { auto_show = true } } },
		completion = {
			menu = {
				scrollbar = false,
				border = "rounded",
			},
			documentation = {
				auto_show = true,
				window = { border = "rounded" },
			},
		},
	},
	config = function(_, opts)
		opts.enabled = function()
			local disabled_ft = { "TelescopePrompt", "grug-far" }
			return not vim.tbl_contains(disabled_ft, vim.bo.filetype)
				and vim.b.completion ~= false
				and vim.bo.buftype ~= "prompt"
		end
		require("blink.cmp").setup(opts)
	end,
}
