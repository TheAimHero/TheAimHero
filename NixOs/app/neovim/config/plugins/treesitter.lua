require("nvim-treesitter.configs").setup({
	auto_install = false,
	modules = {},
	ignore_install = {},
	sync_install = false,
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	indent = { enable = true },
	incremental_selection = { enable = true },
})
