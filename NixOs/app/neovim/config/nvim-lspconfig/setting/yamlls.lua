require("lspconfig").yamlls.setup({
  on_attach = function(c, b)
    c.server_capabilities.documentFormattingProvider = false
    Handlers.lsp_keymaps(b)
  end,
  capabilities = Handlers.capabilities,
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})
