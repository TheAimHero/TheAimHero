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
	end,
}
