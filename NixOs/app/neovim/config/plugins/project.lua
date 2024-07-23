require("project_nvim").setup({
	manual_mode = false,
	detection_methods = { "pattern", "lsp" },
	patterns = { "package.json", ".git", "go.mod", "Session.vim" },
	ignore_lsp = {},
	exclude_dirs = { "/home/vedant" },
	show_hidden = true,
	silent_chdir = true,
	scope_chdir = "global",
	datapath = vim.fn.stdpath("data"),
})
