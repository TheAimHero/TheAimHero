return function()
	require("lspconfig").yamlls.setup({
		on_attach = function(c, b)
			c.server_capabilities.documentFormattingProvider = false
			require("plugins.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("plugins.nvim-lspconfig.handlers").capabilities,
		settings = {
			yaml = {
				schemaStore = { enable = false, url = "" },
				schemas = require("schemastore").yaml.schemas(),
			},
		},
	})
end
