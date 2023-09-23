return function()
	require("lspconfig").asm_lsp.setup({
		on_attach = function(c, b)
			c.server_capabilities.documentFormattingProvider = false
			require("plugins.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("plugins.nvim-lspconfig.handlers").capabilities,
		cmd = { "asm-lsp" },
		filetypes = { "asm", "vmasm" },
		single_file_support = true,
	})
end
