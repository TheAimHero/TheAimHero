return {
	{ "tpope/vim-obsession" },

	{ "nvim-lua/plenary.nvim" },

	--General
	{
		"kylechui/nvim-surround",
		config = true,
		event = "User FileOpened",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FileOpened",
		config = function()
			vim.g.indent_blankline_filetype_exclude = { "norg", "lspinfo", "packer", "checkhealth", "help", "man", "" }
		end,
	},
	{ "famiu/bufdelete.nvim", cmd = { "Bdelete" } },
	{
		"Wansmer/treesj",
		name = "treesj",
		config = true,
		opts = { max_join_length = 12000 },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	},

	--Git
	{ "tpope/vim-fugitive", cmd = { "G", "Git" } },

	--Replace
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
}
