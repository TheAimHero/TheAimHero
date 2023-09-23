return {
	"zoriya/auto-save.nvim",
	enabled = true,
	event = "InsertLeave",
	config = function()
		require("auto-save").setup({
			execution_message = {
				message = function()
					return " "
				end,
			},
			condition = function(buf)
				if vim.fn.getbufvar(buf, "&filetype") == "sql" then
					return false
				end
			end,

			trigger_events = { "CmdlineEnter" },
		})
	end,
}
