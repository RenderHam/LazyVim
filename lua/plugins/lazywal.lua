return {
	"RenderHam/lazywal",
	lazy = false,
	priority = 1000,
	config = function()
		require("lazywal").setup({
			generator = "auto",

			-- This is the single place to choose colors.
			-- Each value is a palette slot (color0..color15, background,
			-- foreground, cursor) or a raw "#rrggbb" value.
			-- Colors are used exactly as generated - no blending.
			-- Run :LazywalRoles to see the resolved mapping.
			roles = {
				-- Base
				bg = "background",
				fg = "foreground",
				bg_alt = "color8",
				subtle = "color8", -- muted UI text (NonText, Conceal, Folded, blame, ghost text)
				selection = "color8",

				-- Syntax
				comment = "color8",
				string = "color2",
				number = "color3", -- numbers, floats, booleans
				constant = "color6",
				variable = "foreground",
				parameter = "foreground",
				property = "foreground",
				func = "color4",
				method = "color4", -- methods are now independent from functions
				keyword = "color5",
				operator = "color5",
				exception = "color9",
				type = "color6",
				tag = "color4",
				punctuation = "foreground",
				special = "color3",

				-- Diagnostics
				error = "color1",
				warn = "color3",
				info = "color4",
				hint = "color6",
				ok = "color2",

				-- UI
				search = "color3",
				linenr = "color8",
				border = "color8",
				heading = "color4",
				link = "color6",
				diff_add = "color2",
				diff_change = "color3",
				diff_delete = "color1",
				menu_sel_fg = "background",
				menu_sel_bg = "color4",
			},

			transparent = false,
			terminal_colors = true,
			styles = { comments = { italic = true } },

			-- Final escape hatch for individual highlight groups:
			-- overrides = function(colors)
			-- 	return { Comment = { fg = colors.comment, italic = true } }
			-- end,
		})
	end,
}
