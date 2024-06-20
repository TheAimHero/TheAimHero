return {
	"mfussenegger/nvim-dap",
	lazy = true,
	keys = {

		{ "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
		{
			"<leader>dT",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			desc = "Conditional Breakpoint",
		},
		{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Start/Continue" },
		{ "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
		{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
		{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
		{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
		{ "<leader>ds", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
		{ "<leader>dS", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
		{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
		{ "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
	},
	dependencies = {
		require("plugins.dap.dap_virtual_text"),
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		require("plugins.dap.nvim-dap")
		require("plugins.dap.dapui_auto")
	end,
}
