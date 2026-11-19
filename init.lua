local version = vim.version()
if version.major < 1 and version.minor < 12 then
	vim.notify_once("This config requires Neovim 0.12 or newer", vim.log.levels.ERROR)
end

-- Set the leader before any plugin spec is evaluated.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core")
