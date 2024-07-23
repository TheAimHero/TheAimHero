require("lspconfig").tsserver.setup({
  on_attach = function(c, b)
    c.server_capabilities.documentFormattingProvider = false
    Handlers.lsp_keymaps(b)
  end,
  capabilities = Handlers.capabilities,
  settings = {
    typescript = {
      inlayHints = {
      	includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
      	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      	includeInlayVariableTypeHints = true,
      	includeInlayFunctionParameterTypeHints = true,
      	includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      	includeInlayPropertyDeclarationTypeHints = true,
      	includeInlayFunctionLikeReturnTypeHints = true,
      	includeInlayEnumMemberValueHints = true,
    	},
  	},
  	javascript = {
  		inlayHints = {
  			includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
  			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  			includeInlayVariableTypeHints = true,

  			includeInlayFunctionParameterTypeHints = true,
  			includeInlayVariableTypeHintsWhenTypeMatchesName = true,
  			includeInlayPropertyDeclarationTypeHints = true,
  			includeInlayFunctionLikeReturnTypeHints = true,
  			includeInlayEnumMemberValueHints = true,
  		},
  	},
  },
})
