require("trouble").setup({
  padding = false,
  use_diagnostic_signs = true,
  auto_close = true,
  auto_fold = false,
  action_keys = {},
  modes = {
    lsp_document_symbols = {
      win = { size = 40, position = "right" },
      preview = { size = 20, type = "split", position = "bottom", wo = { foldenable = false } },
    },
  },
})

local keymap = vim.keymap.set
keymap("n", "<leader>ld", "<cmd>Trouble diagnostics toggle focus=true multiline=true filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" })
keymap("n", "<leader>lw", "<cmd>Trouble diagnostics toggle focus=true multiline=true<cr>",
  { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>ls", "<cmd>Trouble lsp_document_symbols toggle focus=true<cr>", { desc = "Symbols (Trouble)" })
keymap("n", "gd", "<cmd>Trouble lsp_definitions toggle focus=true<cr>", { desc = "Goto Defination" })
