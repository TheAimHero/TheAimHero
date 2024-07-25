local neocodeium = require("neocodeium")
local keymap = vim.keymap.set
neocodeium.setup({
  bin = "/home/vedant/.nix-profile/bin/codeium_language_server",
  show_label = false,
  debounce = true,
  silent = false,
})
keymap("i", "<C-f>", function() neocodeium.accept() end)
keymap("i", "<C-e>", function() neocodeium.clear() end)
keymap("i", "<C-n>", function() neocodeium.cycle(1) end)
keymap("i", "<C-p>", function() neocodeium.cycle(-1) end)
