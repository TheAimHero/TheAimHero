return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			manual_mode = false,
			detection_methods = { "pattern", "lsp" },
			patterns = { "package.json", "index.norg", ".git" },
			ignore_lsp = {},
			exclude_dirs = { "/home/Vedant", "/home/vedant" },
			show_hidden = true,
			silent_chdir = true,
			scope_chdir = "global",
			datapath = vim.fn.stdpath("data"),
		})
	end,
}
