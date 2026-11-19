local M = {}

--- Shared behavior for every LSP client that attaches to a buffer.
--- Server-specific settings live in `lsp/<server>.lua`.
M.setup = function()
	vim.diagnostic.config({
		signs = true,
		underline = false,
		update_in_insert = true,
		virtual_text = false,
	})

	local group = vim.api.nvim_create_augroup("config_lsp_attach", { clear = true })

	vim.api.nvim_create_autocmd("LspAttach", {
		group = group,
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			-- Breadcrumbs in the statusline.
			if client:supports_method("textDocument/documentSymbol", args.buf) then
				local ok, navic = pcall(require, "nvim-navic")
				if ok then
					navic.attach(client, args.buf)
				end
			end

			-- Inlay hints, when the server supports them.
			if client:supports_method("textDocument/inlayHint", args.buf) then
				vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
			end

			-- ts_ls exposes source actions (organize imports, etc.) separately.
			if client.name == "ts_ls" then
				vim.api.nvim_buf_create_user_command(
					args.buf,
					"LspTypescriptSourceAction",
					function()
						local provider = client.server_capabilities.codeActionProvider
						local kinds = provider and provider.codeActionKinds or {}
						local source_actions = vim.tbl_filter(function(action)
							return vim.startswith(action, "source.")
						end, kinds)
						vim.lsp.buf.code_action({ context = { only = source_actions } })
					end,
					{ desc = "TypeScript source actions" }
				)
			end
		end,
	})
end

M.setup()

return M
