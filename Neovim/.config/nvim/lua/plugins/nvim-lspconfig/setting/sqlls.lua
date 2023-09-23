return function()
	require("lspconfig").sqlls.setup({
		on_attach = function(c, b)
			c.server_capabilities.documentFormattingProvider = false
			require("plugins.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("plugins.nvim-lspconfig.handlers").capabilities,
		root_dir = require("lspconfig").util.root_pattern("*"),
	})
end
