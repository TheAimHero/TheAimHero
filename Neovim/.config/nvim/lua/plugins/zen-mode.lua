local keymap = vim.keymap.set

return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.95,
				width = 1,
				height = 1,
				options = {
					signcolumn = "no",
					statuscolumn = " ",
					number = false,
					relativenumber = false,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false,
					showcmd = false,
					laststatus = 0,
				},
				gitsigns = { enabled = false },
				tmux = { enabled = false },
				kitty = { enabled = true, font = "+1" },
			},
			on_open = function(win) end,
			on_close = function() end,
		})
    keymap("n", "<leader>wj", "<cmd>ZenMode<cr>", { desc = "Zen Mode", noremap = true, silent = true })
	end,
}
