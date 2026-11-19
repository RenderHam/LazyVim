return {
	"RenderHam/lazywal",
	lazy = false,
	priority = 1000,
	config = function()
		require("lazywal").setup({
			generator = "auto",

			-- This is the single place to choose colors.
			-- Any role can be set to a palette slot (color0..color15,
			-- background, foreground, cursor) or a raw "#rrggbb" value.
			-- Colors are used exactly as generated — no blending.
			--
			-- Run :LazywalRoles to see the full resolved mapping.
			roles = {
				-- comment = "color1",       -- comments use color1
				-- string  = "color2",
				-- func    = "color4",
				-- error   = "color9",       -- bright variant
				-- warn    = "#ffaa00",      -- raw color override
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
