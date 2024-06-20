return {
	"akinsho/toggleterm.nvim",
	cmd = "ToggleTerm",
	keys = {

		{
			"<leader>tv",
			"<cmd>ToggleTerm size=75 direction=vertical dir='echo expand('%:p:h')'<cr>",
			desc = "Vertical",
		},
		{
			"<leader>th",
			"<cmd>ToggleTerm size=12 direction=horizontal dir='echo expand('%:p:h')'<cr>",
			desc = "Horizontal",
		},
		{ "<leader>tf", "<cmd>ToggleTerm size=15 direction=float dir='echo expand('%:p:h')'<cr>", desc = "Float" },
		{ "<leader>tt", "<cmd>ToggleTerm  direction=tab dir='echo expand('%:p:h')'<cr>", desc = "Tab" },
	},
	config = function()
		require("toggleterm").setup({
			autochdir = true,
			float_opts = { border = "single" },
			shade_terminals = false,
		})
	end,
}
