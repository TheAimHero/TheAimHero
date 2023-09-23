return {
	"ThePrimeagen/harpoon",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "mf", [[<cmd>lua require("harpoon.mark").add_file()<cr>]], mode = "n", desc = "Add File To Harpoon" },
		{ "ms", [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>]], mode = "n", desc = "Toggle Harpoon Menu" },
		{ "m1", [[<cmd>lua require("harpoon.ui").nav_file(1)<cr>]], mode = "n", desc = "Goto File At Position 1" },
		{ "m2", [[<cmd>lua require("harpoon.ui").nav_file(2)<cr>]], mode = "n", desc = "Goto File At Position 2" },
		{ "m3", [[<cmd>lua require("harpoon.ui").nav_file(3)<cr>]], mode = "n", desc = "Goto File At Position 3" },
		{ "m4", [[<cmd>lua require("harpoon.ui").nav_file(4)<cr>]], mode = "n", desc = "Goto File At Position 4" },
		{ "]v", [[<cmd>lua require("harpoon.ui").nav_next()<cr>]], mode = "n", desc = "Next File" },
		{ "[v", [[<cmd>lua require("harpoon.ui").nav_prev()<cr>]], mode = "n", desc = "Prev File" },
	},
	config = function()
		require("harpoon").setup({
			menu = { width = 60 },
			save_on_toggle = true,
			save_on_change = true,
			enter_on_sendcmd = false,
			tmux_autoclose_windows = false,
			excluded_filetypes = { "harpoon" },
			mark_branch = false,
			tabline = false,
			tabline_prefix = " ",
			tabline_suffix = " ",
		})
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local keymap = vim.keymap.set
	end,
}
