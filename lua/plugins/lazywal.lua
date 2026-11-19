local dev = vim.fn.expand("~/.git/lazywal")

local function configure()
	require("lazywal").setup({
		-- Override the plugin defaults here, e.g. percentages = { color1 = 85 }.
	})
end

-- Use the local checkout on this machine; clone from GitHub anywhere else.
if vim.fn.isdirectory(dev) == 1 then
	return {
		dir = dev,
		name = "lazywal",
		lazy = false,
		priority = 1000,
		config = configure,
	}
end

return {
	"RenderHam/lazywal",
	lazy = false,
	priority = 1000,
	config = configure,
}
