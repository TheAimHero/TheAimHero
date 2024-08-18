require("catppuccin").setup({
	flavour = "mocha",
	background = { light = "latte", dark = "mocha" },
	transparent_background = true,
	show_end_of_buffer = false,
	term_colors = true,
	dim_inactive = { enabled = false, shade = "dark", percentage = 0.5 },
	no_italic = false,
	no_bold = false,
	no_underline = false,
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
	custom_highlights = function()
		return {
			-- sign column
			Folded = { bg = "#45475b", blend = 50 },
			-- Eyeliner highlight groups
			EyelinerPrimary = { fg = "#00c7df", bold = true },
			EyelinerSecondary = { fg = "#f84e03", bold = true },
			EyelinerDimmed = { link = "Comment" },
			-- Mini notify background highlight group
			NotifyBackground = { bg = "none" },
			-- Mini hipatters highlight groups
			MiniStatuslineInactive = { bg = "none" },
			MiniStatuslineFilename = { bg = "none" },
			MiniHipatternsFixme = { bg = "#F38BA8", fg = "#000000", bold = true, italic = true },
			MiniHipatternsTodo = { bg = "#89B4FA", fg = "#000000", bold = true, italic = true },
			MiniHipatternsHack = { bg = "#89DCEB", fg = "#000000", bold = true, italic = true },
			MiniHipatternsPerf = { bg = "#A6E3A1", fg = "#000000", bold = true, italic = true },
			MiniHipatternsWarn = { bg = "#FAB387", fg = "#000000", bold = true, italic = true },
			MiniHipatternsNote = { bg = "#408076", fg = "#ffffff", bold = true, italic = true },
			MiniHipatternsTest = { bg = "#C6A0F6", fg = "#000000", bold = true, italic = true },
			-- MiniTabline highlight groups
			MiniTablineTabpageSection = { bg = "none" },
			MiniTablineCurrent = {
				bg = "none",
				fg = "#89b4fa",
				bold = false,
				sp = "none",
				italic = false,
				cterm = { underline = false, underdashed = false },
			},
			-- Diffview highlight group
			DiffviewDiffChange = { bg = "#45475b" },
		}
	end,
	integrations = {
		cmp = true,
		telescope = { enabled = true, style = "nvchad" },
		mini = { enable = true, indentscope_color = "blue" },
		harpoon = true,
		treesitter = true,
		lsp_trouble = true,
		markdown = true,
		semantic_tokens = true,
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
	},
})
-- setup must be called before loading
vim.cmd.colorscheme("catppuccin-frappe")
