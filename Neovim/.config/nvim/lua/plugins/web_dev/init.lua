return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "typescriptreact", "javascriptreact", "javascript", "html" },
		config = function()
			require("nvim-ts-autotag").setup({
				skip_tags = "",
			})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		name = "colorizer",
		cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					RGB = true,
					RRGGBB = true,
					names = true,
					RRGGBBAA = true,
					AARRGGBB = true,
					rgb_fn = true,
					hsl_fn = true,
					css = true,
					css_fn = true,
					mode = "background",
					-- @note: This is for inline virtual text
					-- mode = "inline",
					tailwind = "both",
					sass = { enable = true, parsers = { "css" } },
					virtualtext = " ■",
					always_update = false,
				},
				buftypes = {},
			})
		end,
	},
}
