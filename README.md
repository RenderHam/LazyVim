# LazyVim

A minimal, professional Neovim setup built on [lazy.nvim](https://github.com/folke/lazy.nvim).
Portable across machines: clone it, run one sync command, and Mason installs the rest.

## Requirements

- **Neovim 0.12+** (treesitter v1 requires it; Arch's `neovim` package is 0.12.6)
- **git**, **curl**, **tar**, a **C compiler** (`base-devel`)
- **`tree-sitter-cli` 0.26.1+** for syntax highlighting (Arch: `tree-sitter-cli` in `extra`)
- A **Nerd Font** for icons
- Optional: `hellwal` or `pywall` (wallpaper palette source for the colorscheme), `ripgrep` (faster search), `lazygit` (`<leader>gg`), `wl-clipboard`/`xclip` (system clipboard)

## Fresh install on Arch Linux

```sh
sudo pacman -S neovim git base-devel curl tar tree-sitter-cli ripgrep lazygit
# Install/configure a Nerd Font in your terminal as well.

# Back up an existing config first:
mv ~/.config/nvim ~/.config/nvim.bak

git clone https://github.com/RenderHam/LazyVim.git ~/.config/nvim
nvim --headless -c 'Lazy sync' -c 'qa!'
```

`Lazy sync` clones the pinned plugin versions from `lazy-lock.json`. On the first
interactive launch, Mason installs the language servers and CLI tools (this can
take a few minutes). Treesitter parsers are installed in the background on first
launch; if `tree-sitter-cli` is missing, the config warns and skips them.

The same steps work on any Linux distro with the prerequisites above. No absolute
paths or machine-specific environment variables are stored in the config.

## Health checks

```vim
:checkhealth     " overall health
:Lazy check      " plugin updates
:Mason           " installed servers / tools
:LspInfo         " attached language servers
:ConformInfo     " available formatters
:Lint            " run linters for the current buffer
```

## Layout

```
init.lua                 leader + version guard + entry point
lua/core/                options, autocmds, keymaps, statusline, lazy bootstrap
lua/plugins/             one file per plugin
lsp/<server>.lua         per-server LSP settings (auto-merged by vim.lsp.enable)
lazy-lock.json           pinned plugin versions
.stylua.toml             Lua formatting rules
.editorconfig            whitespace / indentation rules
```

## Tooling

| Area | Tool |
| --- | --- |
| Completion | `blink.cmp` + `LuaSnip` / `friendly-snippets` |
| LSP | `mason-lspconfig` + `nvim-lspconfig`, see `lsp/` |
| Formatting | `conform.nvim` (format-on-save) |
| Linting | `nvim-lint` (shellcheck, yamllint, markdownlint-cli2) |
| Diagnostics | `tiny-inline-diagnostic.nvim` + `noice.nvim` |
| Git | `gitsigns.nvim`, `snacks.lazygit` |
| Navigation | `snacks.picker`, `mini.files` |
| Syntax | `nvim-treesitter` (v1) + textobjects |
| Colorscheme | [`lazywal`](https://github.com/RenderHam/lazywal) (hellwal/pywall palette + per-color blend) |

## Colorscheme: [lazywal](https://github.com/RenderHam/lazywal)

A standalone plugin that replaces a hard-coded palette with the one generated from
your wallpaper. It reads `~/.cache/hellwal/colors-wal.vim` or
`~/.cache/wal/colors.json` (override with `palette_path`) and falls back to a
built-in palette when neither exists. lazy.nvim installs it like any other plugin
into `~/.local/share/nvim/lazy/lazywal`.

Each ANSI slot has a **blend percentage toward the background**: `0` = invisible,
`100` = pure palette color. This lets you tame aggressive wallpaper colors without
changing their hue. Adjust them in `lua/plugins/lazywal.lua` — that file is the
single place for color configuration:

```lua
require("lazywal").setup({
  percentages = {
    color1 = 85,  -- errors stay fiery but not blinding
    color2 = 75,  -- strings softened
    color7 = 100, -- foreground untouched
  },
})
```

| Command | Action |
| --- | --- |
| `:LazywalPreview` | Show the 16 adjusted colors with their percentages |
| `:LazywalSet color1 80` | Change one percentage live and reapply |
| `:LazywalReload` | Re-read the generator output and reapply |

The adjusted palette is also exported as `g:terminal_color_0..15`, so your terminal
matches the editor. Highlights are cached to `~/.cache/nvim/lazywal_theme.json` and
invalidated when the palette file or your options change.

## Keymaps

`<Space>` is the leader. Press it to see the which-key menu.

| Key | Action |
| --- | --- |
| `<leader><leader>` | Smart fuzzy find |
| `<leader>ff` / `<leader>fs` | Files / grep |
| `<leader>ee` | File explorer |
| `<leader>ca` / `<leader>cr` / `<leader>cf` | Code action / rename / format |
| `gd` / `gr` / `gI` | Definition / references / implementation |
| `K` / `gK` | Hover / signature help |
| `<leader>cd` / `<leader>xd` | Line diagnostics / quickfix list |
| `]h` / `[h` | Next / previous git hunk |
| `<leader>hs` / `<leader>hr` / `<leader>hp` | Stage / reset / preview hunk |
| `<leader>gg` | Lazygit |
| `<C-\>` | Toggle terminal |
| `<leader>ts` / `<leader>tw` / `<leader>td` | Toggle spelling / wrap / diagnostics |
| `<leader>qq` | Quit all |
