return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	lazy = true,
	version = false,
	config = function()
		require("lspconfig.ui.windows").default_options.border = "single"
	end,
	dependencies = {"mason.nvim", "mason-lspconfig.nvim",},
}
