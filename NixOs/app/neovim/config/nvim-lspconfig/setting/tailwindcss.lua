require("lspconfig").tailwindcss.setup({
  on_attach = function(c, b)
    Handlers.lsp_keymaps(b)
  end,
  capabilities = Handlers.capabilities,
  filetypes = { "typescriptreact", "javascriptreact", "html", "templ" },
  init_options = { userLanguages = { templ = "html" } },
  root_dir = require("lspconfig").util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.ts",
    "tailwind.config.cjs"
  ),
  settings = {
    tailwindCSS = {
      experimental = { classRegex = { { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" } } },
    },
  },
})
