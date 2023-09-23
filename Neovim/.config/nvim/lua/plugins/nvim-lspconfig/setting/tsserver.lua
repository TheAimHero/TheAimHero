return function()
	require("lspconfig").tsserver.setup({
		on_attach = function(c, b)
			vim.lsp.inlay_hint(b, nil)
			c.server_capabilities.documentFormattingProvider = false
			require("plugins.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("plugins.nvim-lspconfig.handlers").capabilities,
		settings = {
			diagnostics = { ignoredCodes = { 6133 } },
			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = true,
				},
			},
		},
		root_dir = require("lspconfig").util.root_pattern(".git", "index.norg"),
	})
end
