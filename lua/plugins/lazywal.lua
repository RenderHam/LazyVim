return {
	"RenderHam/lazywal",
	lazy = false,
	priority = 1000,
	config = function()
		require("lazywal").setup({
			generator = "auto",

			-- Choose colors here. Values are palette slots (color0..color15,
			-- background, foreground, cursor) or a raw "#rrggbb" value.
			-- Colors are used exactly as generated - no blending.
			-- Any role not listed here keeps the plugin default.
			-- Run :LazywalRoles to see every resolved role.
			roles = {
				subtle = "color8",
				selection = "color8",
				comment = "color8",
				string = "color2",
				number = "color3",
				func = "color4",
				method = "color4",
				keyword = "color5",
				operator = "color5",
				error = "color1",
			},

			transparent = true,
			terminal_colors = true,
			styles = { comments = { italic = true } },

			-- Final escape hatch for individual highlight groups:
			-- overrides = function(colors)
			-- 	return { Comment = { fg = colors.comment, italic = true } }
			-- end,
		})
	end,
}
