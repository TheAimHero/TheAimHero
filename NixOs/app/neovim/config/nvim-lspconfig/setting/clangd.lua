local clangd_capabilities = Handlers.capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"
require("lspconfig").clangd.setup({
  on_attach = function(c, b)
    -- c.server_capabilities.documentFormattingProvider = false
    Handlers.lsp_keymaps(b)
  end,
  capabilities = clangd_capabilities,
  cmd = { "clangd" },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = false,
  },
})
