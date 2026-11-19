local opt = vim.opt

opt.shell = "bash"
opt.clipboard = "unnamedplus"
opt.termguicolors = true

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false -- noice.nvim takes over
opt.showtabline = 0
opt.laststatus = 3
opt.mouse = "a"
opt.fillchars:append({ eob = " " })

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Editing
opt.confirm = true
opt.undofile = true
opt.swapfile = false
opt.scrolloff = 12
opt.wrap = false
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = "shift:2"
opt.showbreak = "↳"
opt.conceallevel = 1
opt.spelllang = "en_nz"

-- Windows and timing
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 250
opt.timeoutlen = 400

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Statusline
opt.statusline = require("core.statusline").statusline

-- Cursor
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
