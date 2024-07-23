require("lspconfig").gopls.setup({
	on_attach = function(_, b)
		Handlers.lsp_keymaps(b)
	end,
	capabilities = Handlers.capabilities,
	settings = {
		gopls = {
			analyses = {
				unreachable = true,
				nilness = true,
				unusedparams = true,
				useany = true,
				unusedwrite = true,
				ST1003 = true,
				undeclaredname = true,
				fillreturns = true,
				nonewvars = true,
				fieldalignment = true,
				shadow = true,
			},
			codelenses = {
				generate = true,
				gc_details = true,
				test = true,
				tidy = true,
				vendor = true,
				regenerate_cgo = true,
				upgrade_dependency = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			matcher = "Fuzzy",
			symbolMatcher = "fuzzy",
			semanticTokens = true,
		},
	},
})
