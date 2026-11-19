local parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"c_sharp",
	"gitignore",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"html",
	"http",
	"json",
	"lua",
	"luadoc",
	"luap",
	"markdown",
	"markdown_inline",
	"php",
	"python",
	"ron",
	"rust",
	"sql",
	"templ",
	"toml",
	"typescript",
	"vimdoc",
	"yaml",
}

local function select_textobject(query)
	return function()
		require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
	end
end

local function move_textobject(direction, query)
	return function()
		require("nvim-treesitter-textobjects.move")[direction](query, "textobjects")
	end
end

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
			init = function()
				vim.g.no_plugin_maps = true
			end,
			config = function()
				require("nvim-treesitter-textobjects").setup({
					select = { lookahead = true },
					move = { set_jumps = true },
				})

				local map = vim.keymap.set
				local opts = { silent = true }

				map({ "x", "o" }, "af", select_textobject("@function.outer"), opts)
				map({ "x", "o" }, "if", select_textobject("@function.inner"), opts)
				map({ "x", "o" }, "ac", select_textobject("@class.outer"), opts)
				map({ "x", "o" }, "ic", select_textobject("@class.inner"), opts)
				map({ "x", "o" }, "aa", select_textobject("@parameter.outer"), opts)
				map({ "x", "o" }, "ia", select_textobject("@parameter.inner"), opts)
				map({ "x", "o" }, "al", select_textobject("@loop.outer"), opts)
				map({ "x", "o" }, "il", select_textobject("@loop.inner"), opts)
				map({ "x", "o" }, "ai", select_textobject("@conditional.outer"), opts)
				map({ "x", "o" }, "ii", select_textobject("@conditional.inner"), opts)
				map({ "x", "o" }, "ab", select_textobject("@block.outer"), opts)
				map({ "x", "o" }, "ib", select_textobject("@block.inner"), opts)

				map("n", "]f", move_textobject("goto_next_start", "@function.outer"), opts)
				map("n", "]c", move_textobject("goto_next_start", "@class.outer"), opts)
				map("n", "]F", move_textobject("goto_next_end", "@function.outer"), opts)
				map("n", "]C", move_textobject("goto_next_end", "@class.outer"), opts)
				map("n", "[f", move_textobject("goto_previous_start", "@function.outer"), opts)
				map("n", "[c", move_textobject("goto_previous_start", "@class.outer"), opts)
				map("n", "[F", move_textobject("goto_previous_end", "@function.outer"), opts)
				map("n", "[C", move_textobject("goto_previous_end", "@class.outer"), opts)
			end,
		},
	},
	config = function()
		require("nvim-treesitter").setup()
		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("config_treesitter", { clear = true }),
			callback = function(args)
				local lang = args.match
				if not pcall(vim.treesitter.language.add, lang) then
					return
				end
				pcall(vim.treesitter.start, args.buf, lang)
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
