local keymap = vim.keymap.set

keymap( "n", "mf", [[<cmd>lua require("harpoon.mark").add_file()<cr>]], { desc = "Add File to Harpoon" })
keymap( "n", "ms", [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>]], { desc = "Toggle Harpoon Menu" } )
keymap( "n", "m2", [[<cmd>lua require("harpoon.ui").nav_file(2)<cr>]], { desc = "Goto File At Position 2" } )
keymap( "n", "m3", [[<cmd>lua require("harpoon.ui").nav_file(3)<cr>]], { desc = "Goto File At Position 3" } )
keymap( "n", "m4", [[<cmd>lua require("harpoon.ui").nav_file(4)<cr>]], { desc = "Goto File At Position 4" } )
keymap( "n", "m5", [[<cmd>lua require("harpoon.ui").nav_file(4)<cr>]], { desc = "Goto File At Position 5" } )
keymap( "n", "]v", [[<cmd>lua require("harpoon.ui").nav_next()<cr>]], { desc = "Next File" } )
keymap( "n", "[v", [[<cmd>lua require("harpoon.ui").nav_prev()<cr>]], { desc = "Prev File" } )
