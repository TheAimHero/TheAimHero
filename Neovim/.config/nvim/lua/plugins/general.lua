return {
	{
		"tpope/vim-obsession",
		keys = { { "<leader>uo", "<cmd>Obsession<cr>", desc = "Save Session" } },
		event = "VeryLazy",
	},

	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},

	--General
	{
		"kylechui/nvim-surround",
		config = true,
		event = "User FileOpened",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		event = "User FileOpened",
		version = "2.*",
		config = function()
			vim.g.indent_blankline_filetype_exclude =
				{ "norg", "lspinfo", "packer", "checkhealth", "help", "man", "", "markdown" }
		end,
	},
	{
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete" },
		keys = { { "<leader>c", "<cmd>Bdelete<cr>", desc = "Close Buffer" } },
	},
	{
		"Wansmer/treesj",
		name = "treesj",
		keys = { { "<leader>us", "<cmd>TSJToggle<cr>", desc = "Split/Join Toggle" } },
		config = true,
		opts = { max_join_length = 12000, use_default_keymaps = false },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	},

	--Git
	{ "tpope/vim-fugitive", cmd = { "G", "Git" } },

	--Replace
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
		init = function()
			vim.keymap.set("n", "<leader>lr", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { desc = "Rename symbol under cursor", expr = true })
		end,
	},
}
