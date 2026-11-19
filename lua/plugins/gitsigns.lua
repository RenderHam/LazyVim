return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		current_line_blame = false,
	},
	keys = {
		{ "]h", function() require("gitsigns").next_hunk() end, desc = "Next git hunk" },
		{ "[h", function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" },
		{ "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
		{ "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
		{ "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
		{ "<leader>hb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame line" },
		{ "<leader>hS", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
		{ "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo staged hunk" },
	},
}
