require("which-key").setup({
	plugins = {
		marks = false,
		registers = true,
		spelling = { enabled = false, suggestions = 20 },
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			windows = false,
			nav = false,
			z = true,
			g = true,
		},
	},
	operators = { gc = "Comments" },
	key_labels = {
		["<space>"] = "SPC",
		["<cr>"] = "ENTER",
		["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "single",
		position = "bottom",
	},
	layout = {
		height = { min = 1, max = 10 },
		width = { min = 0, max = 50 },
		spacing = 10,
		align = "left",
	},
	ignore_missing = false,
	hidden = {},
	show_help = true,
	show_keys = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k", "f" },
		n = { "<C-d>", "<C-u>" },
		v = { "j", "k" },
	},
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},
})
