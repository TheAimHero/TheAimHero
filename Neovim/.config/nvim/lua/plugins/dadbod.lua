return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", commit = "3c397fb2521c899609955ce4403801a795888cdb" },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
	},
	cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },

	init = function()
		vim.keymap.set(
			"n",
			"<leader>ue",
			"<cmd>DBUIToggle<cr>",
			{ silent = true, noremap = true, desc = "Toggle DBUI" }
		)
	end,

	config = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.cmd(
			[[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({sources = {{ name = 'vim-dadbod-completion' },{ name = "nvim_lsp", priority = 10, max_item_count = 50 },{ name = "luasnip" },{ name = "buffer", max_item_count = 10 },{ name = "async_path" },},})]]
		)
	end,
}
