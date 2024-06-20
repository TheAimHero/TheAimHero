return {
	"hedyhli/outline.nvim",
	cmd = "Outline",
	enabled = false,
	keys = { { "<leader>ls", "<cmd>Outline<cr>", desc = "Document Symbols" } },
	config = function()
		require("outline").setup({
			outline_window = {
				position = "right",
				split_command = nil,

				width = 25,
				relative_width = true,

				auto_close = true,
				auto_jump = true,

				show_numbers = false,
				show_relative_numbers = false,
				wrap = true,

				show_cursorline = true,
				hide_cursor = true,

				focus_on_open = true,
				winhl = "OutlineDetails:Comment,OutlineLineno:LineNr",
			},

			outline_items = {
				highlight_hovered_item = true,
				show_symbol_details = false,
				show_symbol_lineno = false,
			},

			guides = {
				enabled = true,
				markers = {
					bottom = "└",
					middle = "├",
					vertical = "│",
				},
			},

			symbol_folding = {
				autofold_depth = nil,
				auto_unfold_hover = true,
				markers = { " ", " " },
			},

			preview_window = {
				auto_preview = false,
				open_hover_on_preview = true,
				width = 30,
				min_width = 20,
				relative_width = true,
				border = "single",
				winhl = "",
				winblend = 0,
			},
		})
	end,
}
