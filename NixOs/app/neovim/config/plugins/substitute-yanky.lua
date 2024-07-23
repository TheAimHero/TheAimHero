local keymap = vim.keymap.set

require("substitute").setup({
	on_substitute = require("yanky.integration").substitute(),
})

keymap("n", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true, silent = true, desc = "Substitute Visual" })
keymap("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true, silent = true, desc = "Substitute" })
keymap("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true, silent = true, desc = "Substitute Line" })
keymap("n",  "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true, silent = true, desc = "Substitute EOL" })

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
		storage = "shada",
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

keymap({"n", "x" }, "y", "<Plug>(YankyYank)", { desc = "Yank" } )
keymap({"n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "YankyPutAfter" } )
keymap({"n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "YankyPutBefore" } )
keymap({"n", "x" }, "]r", "<Plug>(YankyCycleForward)",  { desc = "YankyCycleForward" } )
keymap({"n", "x" }, "[r", "<Plug>(YankyCycleBackward)", { desc = "YankyCycleBackward" } )
keymap({"n", "x" }, "<leader>sy", "<cmd>Telescope yank_history<cr>",  { desc = "YankyRingHistory" } )

