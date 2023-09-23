local function diff_source()
	---@diagnostic disable-next-line: undefined-field
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

return {
	"nvim-lualine/lualine.nvim",
	event = "User FileOpened",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				icons_enabled = true,
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "b:gitsigns_head", icon = "" },
					{
						"diff",
						source = diff_source,
						diff_color = {
							added = "DiagnosticSignOk",
							modified = "DiagnosticSignWarn",
							removed = "DiagnosticSignError",
						},
					},
				},
				lualine_c = {
					{ require("recorder").recordingStatus },
					{ require("recorder").displaySlots },
					{
						function()
							local cur_buf = vim.api.nvim_get_current_buf()
							return require("hbac.state").is_pinned(cur_buf) and "📍" or ""
							-- tip: nerd fonts have pinned/unpinned icons!
						end,
						color = { fg = "#ef5f6b", gui = "bold" },
					},
				},
				lualine_x = {
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						color = { fg = "#ff9e64" },
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					{
						"os.date('%I:%M %p')",
						icons_enabled = true,
						color = { fg = "#ff9e64" },
						icon = "󰞌",
					},
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "filetype" },
				},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = { "" },
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				"fugitive",
				"lazy",
				"trouble",
				"nvim-tree",
				"symbols-outline",
				"quickfix",
				"toggleterm",
				"nvim-dap-ui",
			},
		})
	end,
}
