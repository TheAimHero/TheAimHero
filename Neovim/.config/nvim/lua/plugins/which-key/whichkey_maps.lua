local wk = require("which-key")
wk.register({
	h = { "<cmd>nohlsearch<cr><cmd>Noice dismiss<cr>", "No Highlight/Notification" },
	u = { name = "Utils" },
	s = {
		name = "Search",
		w = { "<cmd>Telescope find_files hidden=true<cr>", "Workspace" }, -- create a binding with label
		r = { "<cmd>Telescope oldfiles hidden=true<cr>", "Recent Files" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
		z = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy find file" },
		s = {
			"<cmd>Telescope spell_suggest results_title=false layout_strategy=cursor layout_config={width=30,height=9} <cr>",
			"Spell Suggest",
		},
		l = { "<cmd>Telescope live_grep<cr>", "Live Grep Workspace" },
	},
	l = { name = "LSP" },
	g = { name = "Git" },
	w = { name = "Window" },
	b = {
		name = "Buffers",
		f = { "<cmd>Telescope buffers<cr>", "Find" },
	},
	t = { name = "Toggle Term" },
	d = { name = "Debug" },
}, { prefix = "<leader>", mode = "n", silent = true, noremap = true })
