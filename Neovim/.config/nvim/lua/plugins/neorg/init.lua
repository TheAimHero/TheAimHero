return {
	"nvim-neorg/neorg",
	ft = "norg",
	cmd = "Neorg",
	build = ":Neorg sync-parsers",
	config = function()
		local opts = {
			load = {
				["core.defaults"] = {},
				["core.ui"] = {},
				["core.looking-glass"] = {},
				["core.keybinds"] = {},
				["core.concealer"] = {
					config = {
						icon_preset = "diamond",
						icons = { todo = { done = { icon = "" }, pending = { icon = "" } } },
					},
				},
				["core.itero"] = {},
				["core.esupports.indent"] = {},
				["core.summary"] = {},
				["core.ui.calendar"] = {},
				["core.integrations.nvim-cmp"] = {},
				["core.integrations.treesitter"] = {},
				["core.completion"] = { config = { engine = "nvim-cmp" } },
			},
		}
		require("neorg").setup(vim.tbl_deep_extend("force", opts, require("plugins.neorg.neorg_workspaces")))
	end,
}
