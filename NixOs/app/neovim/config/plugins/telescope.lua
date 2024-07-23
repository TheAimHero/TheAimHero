local actions = require("telescope.actions")
local trouble = require("trouble.sources.telescope")
require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = { width = 0.99, height = 0.99, preview_width = 0.7 },
		},
		prompt_prefix = "🔍 ",
		selection_caret = "󱞩 ",
		set_env = { ["COLORTERM"] = "truecolor" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		file_ignore_patterns = {
			".git/",
			".cache",
			".next",
			"%.o",
			"%.a",
			"%.out",
			"%.class",
			"%.pdf",
			"%.mkv",
			"%.mp4",
			"%.zip",
			"node_modules",
			"target",
		},
		path_display = { truncate = 5 },
		hidden = true,
		color_devicons = true,
		mappings = {
			i = {
				["<C-p>"] = actions.preview_scrolling_up,
				["<c-t>"] = trouble.open,
				["<C-n>"] = actions.preview_scrolling_down,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				["q"] = actions.close,
				["<c-t>"] = trouble.open,
				["<C-c>"] = actions.close,
			},
		},
	},

	pickers = {
		find_files = {
			find_command = { "fd", "--no-ignore", "--type", "f", "--strip-cwd-prefix", "--color=auto" },
			hidden = true,
		},
		live_grep = {
			additional_args = { "--hidden", "--ignore-case" },
			only_sort_text = true,
		},
		buffers = { path_display = { "tail" } },
		colorscheme = {
			enable_preview = true,
		},
	},

	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

local extension = require("telescope").load_extension
extension("fzf")
extension("projects")

local keymap = vim.keymap.set
keymap("n", "<leader>sf", "<cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>", { desc = "Find Files" })
keymap( "n", "<leader>sw", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Workspace" } )
keymap( "n", "<leader>sr", "<cmd>Telescope oldfiles hidden=true<cr>", { desc = "Recent Files" } )
keymap( "n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "Projects" } )
keymap( "n", "<leader>sz","<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find file" } )
keymap( "n", "<leader>ss", "<cmd>Telescope spell_suggest results_title=false layout_strategy=cursor layout_config={width=30,height=9} <cr>", { desc = "Spell Suggest" } )
keymap( "n", "<leader>sl", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep Workspace" } )
