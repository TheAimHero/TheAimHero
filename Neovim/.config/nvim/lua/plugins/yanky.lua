return {
	"gbprod/yanky.nvim",
	keys = {
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank" },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "YankyPutAfter" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "YankyPutBefore" },
		{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "YankyPutBefore" },
		{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "YankyPutBefore" },
		{ "]r", "<Plug>(YankyCycleForward)", mode = { "n" }, desc = "YankyCycleForward" },
		{ "[r", "<Plug>(YankyCycleBackward)", mode = { "n" }, desc = "YankyCycleBackward" },
		{ "<leader>uy", "<cmd>Telescope yank_history<cr>", mode = "n", desc = "YankyRingHistory" },
	},
	dependencies = { "telescope.nvim", "kkharji/sqlite.lua" },
	config = function()
		local utils = require("yanky.utils")
		local mapping = require("yanky.telescope.mapping")
		require("yanky").setup({
			system_clipboard = {
				sync_with_ring = true,
			},
			picker = {
				select = { action = nil },
				telescope = {
					use_default_mappings = false,
					mappings = {
						default = mapping.set_register(utils.get_default_register()),
					},
				},
			},
			ring = {
				history_length = 100,
				storage = "sqlite",
				sync_with_numbered_registers = true,
				cancel_event = "update",
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 500,
			},
		})
		require("telescope").load_extension("yank_history")
	end,
}
