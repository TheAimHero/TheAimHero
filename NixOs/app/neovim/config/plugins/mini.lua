local starter = require("mini.starter")
require("mini.ai").setup({ silent = true })

require("mini.basics").setup({
	options = { extra_ui = false, win_borders = "single" },
	mappings = { basic = true, option_toggle_prefix = "", windows = true, move_with_alt = false },
	autocommands = { basic = false, relnum_in_visual_mode = false },
	silent = true,
})

require("mini.notify").setup({ window = { config = { border = "none" }, winblend = 0 } })
vim.notify = require("mini.notify").make_notify()

require("mini.comment").setup({
	options = {
		custom_commentstring = function()
			return require("ts_context_commentstring.internal").calculate_commentstring()
				or vim.bo.commentstring
		end,
	},
})
vim.g.skip_ts_context_commentstring_module = true

require("mini.starter").setup({
	autooepn = true,
	content_hooks = {
		starter.gen_hook.adding_bullet("", true),
		starter.gen_hook.aligning("center", "center"),
		starter.gen_hook.indexing("all", {
			"Git",
			"Telescope",
			"Plugins",
			"Builtin actions",
		}),
	},
	evaluate_single = true,
	header = table.concat({
		[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
		[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
		[[/ /\  /  __/ (_) \ V /| | | | | | |]],
		[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
		[[───────────────────────────────────]],
	}, "\n"),
	items = {
		starter.sections.recent_files(5),
		{ action = "Telescope oldfiles", name = "R: Recent Files", section = "Telescope" },
		{ action = "Telescope find_files", name = "F: Find Files", section = "Telescope" },
		{ action = "Telescope projects", name = "P: Projects", section = "Telescope" },
		{ action = "G", name = "G: Fugitive", section = "Git" },
		{ action = "enew", name = "N: New Buffer", section = "Builtin actions" },
		{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
	},
})
vim.cmd([[
  augroup MiniStarterJK
  au!
  au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
  au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
  au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>lua MiniStarter.update_current_item('next')<CR>
  au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>lua MiniStarter.update_current_item('prev')<CR>
augroup END
]])

require("mini.indentscope").setup({
	draw = { delay = 0 },
	mappings = { object_scope = "", object_scope_with_border = "", goto_top = "", goto_bottom = "" },
	options = { indent_at_cursor = false },
	symbol = "│",
})

require("mini.splitjoin").setup({ mappings = { toggle = "<leader>us" } })

require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })

require("mini.move").setup()

require("mini.clue").setup({
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = "n", keys = "]" },
		{ mode = "n", keys = "[" },
		{ mode = "x", keys = "<Leader>" },
		{ mode = "n", keys = "g" },
		{ mode = "n", keys = "m" },
		{ mode = "x", keys = "g" },
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },
		{ mode = "n", keys = "<C-w>" },
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},
	window = {
		config = { border = "single" },
		delay = 300,
		scroll_down = "<C-d>",
		scroll_up = "<C-u>",
	},
	clues = {
		require("mini.clue").gen_clues.builtin_completion(),
		require("mini.clue").gen_clues.g(),
		require("mini.clue").gen_clues.marks(),
		require("mini.clue").gen_clues.registers(),
		require("mini.clue").gen_clues.windows(),
		require("mini.clue").gen_clues.z(),
	},
})

require("mini.hipatterns").setup({
	highlighters = {
		fix = { pattern = "@fix:", group = "MiniHipatternsFixme" },
		hack = { pattern = "@hack:", group = "MiniHipatternsHack" },
		todo = { pattern = "@todo:", group = "MiniHipatternsTodo" },
		note = { pattern = "@note:", group = "MiniHipatternsNote" },
		perf = { pattern = "@perf:", group = "MiniHipatternsPerf" },
		test = { pattern = "@test:", group = "MiniHipatternsTest" },
		warn = { pattern = "@warn:", group = "MiniHipatternsWarn" },
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})

require("mini.sessions").setup()
vim.keymap.set("n", "<leader>uo", [[<cmd>lua MiniSessions.write("Session.vim")<cr>]], { desc = "Session Save" })

require("mini.statusline").setup({
	set_vim_settings = false,
})

require("mini.tabline").setup()

require("mini.git").setup({
	job = { git_executable = "git", timeout = 30000 },
	command = { split = "auto" },
})

require("mini.diff").setup({
	view = {
		style = vim.go.number and "number" or "sign",
		signs = { add = "▒", change = "▒", delete = "▒" },
		priority = 199,
	},
	source = nil,
	delay = {
		text_change = 200,
	},
	mappings = {
		apply = "",
		reset = "",
		textobject = "",
		goto_first = "[H",
		goto_prev = "[h",
		goto_next = "]h",
		goto_last = "]H",
	},
	options = {
		algorithm = "histogram",
		indent_heuristic = true,
		linematch = 60,
		wrap_goto = false,
	},
})

require("mini.bracketed").setup({
	jump = { suffix = "", options = {} },
	location = { suffix = "", options = {} },
	undo = { suffix = "", options = {} },
	yank = { suffix = "", options = {} },
	comment = { suffix = "", options = {} },
})
