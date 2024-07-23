require("lspconfig").jsonls.setup({
  on_attach = function(c, b)
    c.server_capabilities.documentFormattingProvider = false
    Handlers.lsp_keymaps(b)
  end,
  capabilities = Handlers.capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})
