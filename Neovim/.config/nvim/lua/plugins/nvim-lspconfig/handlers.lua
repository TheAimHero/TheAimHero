local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

M.setup = function()
	require("helpers.init").setup_icons()
	vim.diagnostic.config({
		virtual_text = false,
		signs = false,
		update_in_insert = false,
		underline = false,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "single",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_buf_set_keymap
M.lsp_keymaps = function(bufnr)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float() <cr>", opts)
	keymap(bufnr, "i", "<C-;>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
end

return M
