return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd("colorscheme catppuccin-frappe")
	end,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = { light = "latte", dark = "mocha" },
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = true,
			dim_inactive = { enabled = false, shade = "dark", percentage = 0.5 },
			no_italic = false,
			no_bold = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = { "bold" },
				functions = { "italic" },
				keywords = { "italic" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
				frappe = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			custom_highlights = function(colors)
				return {
					LspInlayHint = { link = "Comment" },
					Folded = { bg = "#45475b" },
					EyelinerPrimary = { fg = "#00c7df", bold = true },
					EyelinerSecondary = { fg = "#f84e03", bold = true },
					EyelinerDimmed = { link = "Comment" },
					NotifyBackground = { bg = "#000000" },
				}
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				noice = true,
				nvimtree = true,
				telescope = true,
				notify = true,
				ufo = true,
				mini = true,
				fidget = false,
				markdown = true,
				dap = {
					enabled = true,
					enable_ui = true,
				},
				mason = true,
				alpha = true,
				harpoon = true,
				indent_blankline = { enabled = true },
				neotree = true,
				treesitter = true,
				symbols_outline = true,
				lsp_trouble = false,
				which_key = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
