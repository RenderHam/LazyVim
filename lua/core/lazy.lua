-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	-- param 1
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	defaults = {
		lazy = true,
		version = false,
	},
	-- param 2
	install = {
		missing = true,
		colorscheme = { "lazywal" },
	},
	ui = {
		title = " lazy.nvim 💤",
		border = "rounded",
		pills = false,
	},
	-- automatically check for plugin updates
	-- param 3
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"netrwPlugin",
				"tutor",
			},
		},
	},
})
