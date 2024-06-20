local keymap = vim.keymap.set

return {
	"anuvyklack/windows.nvim",
	commit = "4dcfd82374726097a05bc1fe3b3b6e934be184eb",
	event = "WinNew",
	cmd = { "WindowsEqualize", "WindowsMaximize" },
	dependencies = {
		{ "anuvyklack/middleclass" },
	},
	config = function()
		require("windows").setup({
			ignore = {
				buftype = { "quickfix" },
				filetype = { "Outline", "NvimTree", "neo-tree", "undotree", "gundo" },
			},
		})
		keymap("n", "<leader>wf", "<cmd>WindowsMaximize<cr>", { desc = "Focus", noremap = true, silent = true })
		keymap(
			"n",
			"<leader>w_",
			"<cmd>WindowsMaximizeHorizontally<cr>",
			{ desc = "Maximize Horizontal", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>w|",
			"<cmd>WindowsMaximizeVertically<cr>",
			{ desc = "Maximize Vertical", noremap = true, silent = true }
		)
		keymap("n", "<leader>we", "<cmd>WindowsEqualize<cr>", { desc = "Equalize", noremap = true, silent = true })
	end,
}
