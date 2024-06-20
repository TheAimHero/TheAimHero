return {
	"luckasRanarison/nvim-devdocs",
	keys = { { "<leader>ud", "<cmd>DevdocsOpen<cr>", desc = "DevDocs" } },
	cmd = {
		"DevdocsFetch",
		"DevdocsInstall",
		"DevdocsUninstall",
		"DevdocsOpen",
		"DevdocsOpenFloat",
		"DevdocsUpdate",
		"DevdocsUpdateAll",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-devdocs").setup({
			dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
			telescope = {}, -- passed to the telescope picker
			telescope_alt = { -- when searching globally without preview
				layout_config = {
					width = 75,
				},
			},
			float_win = { -- passed to nvim_open_win(), see :h api-floatwin
				relative = "editor",
				height = 25,
				width = 100,
				border = "single",
			},
			wrap = false, -- text wrap, only applies to floating window
			ensure_installed = {}, -- get automatically installed
		})
	end,
}
