return {
	"mskelton/flutter.nvim",
	config = function()
		require("flutter-tools").setup({
			hot_reload = false, -- Hot reload automatically on save
			lsp = {
				capabilities = function(capabilities)
					capabilities.specificThingIDontWant = false
					return capabilities
				end,
			},
		})
	end,
}
