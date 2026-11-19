# LazyVim

A minimal, professional Neovim setup built on [lazy.nvim](https://github.com/folke/lazy.nvim).
Requires **Neovim 0.11+** and a Nerd Font.

## Install on a new machine

```sh
# Back up an existing config first, then:
git clone https://github.com/RenderHam/LazyVim.git ~/.config/nvim
nvim --headless -c 'Lazy sync' -c 'qa!'
```

On first launch, Mason installs the configured language servers and CLI tools.
Check progress with `:Mason`.

```vim
:Lazy check      " plugin updates
:checkhealth     " overall health
:LspInfo         " attached language servers
:ConformInfo     " available formatters
```

## Layout

```
init.lua                 leader + entry point
lua/core/                options, autocmds, keymaps, statusline, lazy bootstrap
lua/plugins/             one file per plugin
lsp/<server>.lua         per-server LSP settings (auto-merged by vim.lsp.enable)
lazy-lock.json           pinned plugin versions
```

## Tooling

| Area | Tool |
| --- | --- |
| Completion | `blink.cmp` + `LuaSnip` / `friendly-snippets` |
| LSP | `mason-lspconfig` + `nvim-lspconfig`, see `lsp/` |
| Formatting | `conform.nvim` (format-on-save) |
| Linting | `nvim-lint` |
| Diagnostics | `tiny-inline-diagnostic.nvim` + `noice.nvim` |
| Git | `gitsigns.nvim`, `snacks.lazygit` |
| Navigation | `snacks.picker`, `mini.files` |
| Syntax | `nvim-treesitter` |

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
