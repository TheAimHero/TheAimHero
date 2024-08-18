Handlers = {}

Handlers.capabilities = vim.lsp.protocol.make_client_capabilities()
Handlers.capabilities.textDocument.completion.completionItem.snippetSupport = true
Handlers.capabilities = require("cmp_nvim_lsp").default_capabilities(Handlers.capabilities)

Handlers.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}
	local setup_icons = function()
		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end
	end
	setup_icons()
	vim.diagnostic.config({
		virtual_text = {
			spacing = 5,
			severity = {
				max = vim.diagnostic.severity.ERROR,
				min = vim.diagnostic.severity.ERROR,
			},
		},
		signs = false,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = { focusable = true, border = "single" },
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "single", focusable = true, close_events = { "CursorMoved", "BufHidden", "InsertCharPre" } }
	)
end

local keymap = vim.api.nvim_buf_set_keymap
Handlers.lsp_keymaps = function(bufnr)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Hover" })
	keymap(
		bufnr,
		"n",
		"gi",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		{ noremap = true, silent = true, desc = "Go to Implementation" }
	)
	-- @note: use conform instead
	-- keymap(
	-- 	bufnr,
	-- 	"n",
	-- 	"<leader>lf",
	-- 	"<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
	-- 	{ noremap = true, silent = true, desc = "Format" }
	-- )
	keymap(
		bufnr,
		"n",
		"gr",
		"<cmd>Trouble lsp_references toggle focus=true<cr>",
		{ noremap = true, silent = true, desc = "References" }
	)
	keymap(
		bufnr,
		"n",
		"<leader>lr",
		"<cmd>lua vim.lsp.buf.rename()<cr>",
		{ noremap = true, silent = true, desc = "Rename" }
	)
	keymap(
		bufnr,
		"n",
		"<leader>la",
		"<cmd>lua vim.lsp.buf.code_action()<cr>",
		{ noremap = true, silent = true, desc = "Code Actions" }
	)
	keymap(
		bufnr,
		"n",
		"gl",
		"<cmd>lua vim.diagnostic.open_float() <cr>",
		{ noremap = true, silent = true, desc = "Line Diagnostics" }
	)
	keymap(
		bufnr,
		"i",
		"<C-v>",
		"<cmd>lua vim.lsp.buf.signature_help()<cr>",
		{ noremap = true, silent = true, desc = "Signature Help" }
	)
end

Handlers.setup()
require("lspconfig.ui.windows").default_options.border = "single"
