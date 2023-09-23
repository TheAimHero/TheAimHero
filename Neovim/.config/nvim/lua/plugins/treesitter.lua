return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-ts-context-commentstring" },
	version = false,
	build = ":TSUpdate",
	cmd = { "TSInstall", "TSUpdate", "TSUninstall", "TSInstallInfo" },
	event = { "User FileOpened" },
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = false,
			ensure_installed = { "markdown", "markdown_inline", "comment", "lua", "bash", 'vim', 'regex' },
			-- sync_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = false,
				filetypes = { "html", "xml", "javascript", "javascriptreact", "typescript", "typescriptreact" },
			},
			incremental_selection = { enable = true },
		})
	end,
}
