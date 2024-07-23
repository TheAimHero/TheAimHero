return function()
  require("lspconfig").pyright.setup({
    on_attach = function(c, b)
      c.server_capabilities.documentFormattingProvider = false
      Handlers.lsp_keymaps(b)
    end,
		capabilities = Handlers.capabilities,
    settings = {
      python = {},
    },
  })
end
