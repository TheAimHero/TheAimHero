return function()
	require("lspconfig").rust_analyzer.setup({
		on_attach = function(c, b)
			vim.lsp.inlay_hint(b, nil)
			c.server_capabilities.documentFormattingProvider = true
			require("plugins.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		-- FIX: Does not work find a fix to make the capabilities work
		-- capabilities = require("plugins.nvim-lspconfig.handlers").capabilities,
		settings = {
			["rust-analyzer"] = {
				filetypes = { "rust" },
				standalone = true,
				diagnostics = { enable = false },
			},
		},
	})
end
