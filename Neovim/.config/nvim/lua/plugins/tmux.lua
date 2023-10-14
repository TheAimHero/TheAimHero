return {
	"aserowy/tmux.nvim",
	event = "VeryLazy",
	cond = function()
		if os.getenv("TMUX") == nil then
			return false
		end
		return true
	end,
	config = function()
		return require("tmux").setup({
			copy_sync = { enable = false },
			navigation = {
				cycle_navigation = true,
				enable_default_keybindings = true,
			},
			resize = { enable_default_keybindings = false },
		})
	end,
}
