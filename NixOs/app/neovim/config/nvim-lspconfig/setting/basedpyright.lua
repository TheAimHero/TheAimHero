require("lspconfig").basedpyright.setup({
  on_attach = function(c, b)
    c.server_capabilities.documentFormattingProvider = false
    Handlers.lsp_keymaps(b)
  end,
  capabilities = Handlers.capabilities,
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportMissingTypeStubs = false,
        },
      },
    },
  },
})
