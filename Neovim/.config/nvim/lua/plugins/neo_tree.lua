return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	enabled = true,
	cmd = "Neotree",
	event = "User DirOpened",
	dependencies = { "nui.nvim", "DaikyXendo/nvim-web-devicons", "plenary.nvim" },
	config = function()
		require("neo-tree").setup({
			commands = {},
			window = {
				width = 35,
				mappings = {
					["<C-x>"] = "open_split",
					["<C-v>"] = "open_vsplit",
					["h"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" and node:is_expanded() then
							require("neo-tree.sources.filesystem").toggle_directory(state, node)
						else
							require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
						end
					end,
					["l"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" then
							if not node:is_expanded() then
								require("neo-tree.sources.filesystem").toggle_directory(state, node)
							elseif node:has_children() then
								require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
							end
						else
							state.commands["open"](state)
						end
					end,
				},
			},
			nesting_rules = {},
			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				components = {
					harpoon_index = function(config, node, state)
						local Marked = require("harpoon.mark")
						local path = node:get_id()
						local succuss, index = pcall(Marked.get_index_of, path)
						if succuss and index and index > 0 then
							return {
								text = string.format(" -> %d", index),
								highlight = config.highlight or "NeoTreeDirectoryIcon",
							}
						else
							return {}
						end
					end,
				},
				renderers = {
					file = {
						{ "icon" },
						{ "name" },
						{ "clipboard", zindex = 10 },
						{ "harpoon_index" },
						{ "diagnostics" },
						{ "git_status", highlight = "NeoTreeDimText" },
					},
				},
			},
			buffers = { group_empty_dirs = false },
		})
	end,
}
