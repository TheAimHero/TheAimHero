require("lspconfig").html.setup({
  on_attach = function(c, b)
    -- c.server_capabilities.documentFormattingProvider = false
    Handlers.lsp_keymaps(b)
  end,
  capabilities = Handlers.capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "ejs" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  settings = {},
  single_file_support = true,
})
