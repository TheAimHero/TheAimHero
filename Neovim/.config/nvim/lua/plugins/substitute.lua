return {
	"gbprod/substitute.nvim",
	-- event = "User FileOpened",
	keys = {
		{
			"s",
			"<cmd>lua require('substitute').visual()<cr>",
			mode = "x",
			noremap = true,
			silent = true,
			desc = "Substitute Visual",
		},
		{
			"s",
			"<cmd>lua require('substitute').operator()<cr>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Substitute",
		},
		{
			"ss",
			"<cmd>lua require('substitute').line()<cr>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Substitute Line",
		},
		{

			"S",
			"<cmd>lua require('substitute').eol()<cr>",
			mode = "n",
			noremap = true,
			silent = true,
			desc = "Substitute EOL",
		},
	},
	config = function()
		require("substitute").setup({
			on_substitute = require("yanky.integration").substitute(),
		})
	end,
}
