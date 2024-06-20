return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>ld",
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>ls",
			"<cmd>Trouble lsp_document_symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
	},
	config = function()
		require("trouble").setup({
			padding = false,
			-- position = "right",
			-- width = 25,
			use_diagnostic_signs = true,
			auto_close = true,
			auto_fold = false,
			action_keys = {},
		})
	end,
}
