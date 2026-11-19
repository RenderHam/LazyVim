return {
	"RenderHam/lazywal",
	lazy = false,
	priority = 1000,
	config = function()
		require("lazywal").setup({
			generator = "auto",

			-- This is the single place to adjust the colors.
			-- Each slot blends toward the background: 0 = invisible, 100 = raw
			-- palette color from hellwal/pywall.
			percentages = {
				color0 = 100,
				color1 = 85, -- errors: fiery but not blinding
				color2 = 75, -- strings: softened
				color3 = 85, -- warnings / numbers
				color4 = 90, -- functions
				color5 = 80, -- keywords
				color6 = 80, -- types
				color7 = 100, -- foreground: untouched
				color8 = 100,
				color9 = 85,
				color10 = 75,
				color11 = 85,
				color12 = 90,
				color13 = 80,
				color14 = 80,
				color15 = 100,
			},

			transparent = false,
			terminal_colors = true,
			styles = { comments = { italic = true } },

			-- Per-group fine tuning, if needed:
			-- overrides = function(colors)
			-- 	return { Comment = { fg = colors.grey, italic = true } }
			-- end,
		})
	end,
}
