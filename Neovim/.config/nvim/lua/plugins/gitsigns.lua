local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

return {
	"lewis6991/gitsigns.nvim",
	cmd = "Gitsigns",
	event = "User FileOpened",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = false,
			numhl = true,
			linehl = false,
			word_diff = false,
			watch_gitdir = { interval = 1000, follow_files = true },
			attach_to_untracked = true,
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			max_file_length = 40000,
			preview_config = {

				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
		keymap(
			"n",
			"]g",
			"<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
			{ desc = "Next Hunk", noremap = true, silent = true }
		)
		keymap(
			"n",
			"[g",
			"<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
			{ desc = "Previous Hunk", noremap = true, silent = true }
		)
		keymap(
			"n",
			"[g",
			"<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
			{ desc = "Previous Hunk", noremap = true, silent = true }
		)

		keymap(
			"n",
			"<leader>gl",
			"<cmd>lua require 'gitsigns'.blame_line()<cr>",
			{ desc = "Blame", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>gg",
			"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
			{ desc = "Preview Hunk", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>gr",
			"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
			{ desc = "Reset Hunk", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>gR",
			"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
			{ desc = "Reset Buffer", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>gs",
			"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
			{ desc = "Stage Hunk", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>gS",
			"<cmd>lua require 'gitsigns'.stage_buffer()<cr>",
			{ desc = "Stage Buffer", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>go",
			"<cmd>Telescope git_status<cr>",
			{ desc = "Open changed file", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>gb",
			"<cmd>Telescope git_branches<cr>",
			{ desc = "Checkout branch", noremap = true, silent = true }
		)
		keymap(
			"n",
			"<leader>gd",
			"<cmd>Gitsigns diffthis HEAD<cr>",
			{ desc = "Git Diff", noremap = true, silent = true }
		)
	end,
}
