return {
	"echasnovski/mini.nvim",
	branch = "main",
	event = { "User FileOpened" },
	dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
	config = function()
		require("mini.ai").setup({ silent = true })

		require("mini.basics").setup({
			options = { extra_ui = false, win_borders = "single" },
			mappings = { basic = true, option_toggle_prefix = "", windows = true, move_with_alt = false },
			autocommands = { basic = false, relnum_in_visual_mode = false },
			silent = true,
		})

		require("mini.cursorword").setup()

		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})

		require("mini.move").setup()

		require("mini.bracketed").setup({
			jump = { suffix = "", options = {} },
			location = { suffix = "", options = {} },
			undo = { suffix = "", options = {} },
			yank = { suffix = "", options = {} },
			comment = { suffix = "", options = {} },
		})
	end,
}
