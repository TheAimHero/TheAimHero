require("telescope").setup({
	extensions = {
		file_browser = {
			display_stat = {},
			-- initial_mode = "normal",
			hijack_netrw = true,
			cwd_to_path = true,
			path = "%:p:h",
			mappings = {
				["i"] = {
					["<C-e>"] = function(prompt_bufnr)
						local fb_utils = require("telescope._extensions.file_browser.utils")
						local action_state = require("telescope.actions.state")
						local Path = require("plenary.path")
						local current_picker = action_state.get_current_picker(prompt_bufnr)
						local finder = current_picker.finder
						local bufr_path = Path:new(vim.fn.expand("#:p"))
						local bufr_parent_path = bufr_path:parent():absolute()

						if finder.path ~= bufr_parent_path then
							finder.path = bufr_parent_path
							fb_utils.selection_callback(current_picker, bufr_path:absolute())
						else
							finder.path = vim.loop.cwd()
						end
						fb_utils.redraw_border_title(current_picker)
						current_picker:refresh(finder, {
							new_prefix = fb_utils.relative_path_prefix(finder),
							reset_prompt = true,
							multi = current_picker._multi,
						})
					end,
				},
				["n"] = {
					["e"] = function(prompt_bufnr)
						local fb_utils = require("telescope._extensions.file_browser.utils")
						local action_state = require("telescope.actions.state")
						local Path = require("plenary.path")
						local current_picker = action_state.get_current_picker(prompt_bufnr)
						local finder = current_picker.finder
						local bufr_path = Path:new(vim.fn.expand("#:p"))
						local bufr_parent_path = bufr_path:parent():absolute()

						if finder.path ~= bufr_parent_path then
							finder.path = bufr_parent_path
							fb_utils.selection_callback(current_picker, bufr_path:absolute())
						else
							finder.path = vim.loop.cwd()
						end
						fb_utils.redraw_border_title(current_picker)
						current_picker:refresh(finder, {
							new_prefix = fb_utils.relative_path_prefix(finder),
							reset_prompt = true,
							multi = current_picker._multi,
						})
					end,
				},
			},
		},
	},
})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

local keymap = vim.keymap.set
keymap("n", "<leader>e", "<cmd>Telescope file_browser default_selection_index=2<cr> ", { desc = "Toggle File Browser" })
