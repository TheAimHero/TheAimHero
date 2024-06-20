local keymap = vim.keymap.set

local color = "Catppuccin Mocha"
keymap("n", "\\b", function()
	if color == "Catppuccin Mocha" then
		vim.cmd("colorscheme catppuccin-frappe")
		color = "Catppuccin Custom Frappe"
	else
		vim.cmd("colorscheme catppuccin-mocha")
		color = "Catppuccin Mocha"
	end
	vim.notify("Color Scheme: " .. color, "info", { title = "Ui" })
end, { desc = "Toggle Color Scheme" })

keymap("n", "\\w", function()
	vim.wo.wrap = not vim.wo.wrap
	vim.notify(string.format("Wrap  %s", vim.wo.wrap), "info", { title = "Ui" })
end, { desc = "Toggle Wrap" })

keymap("n", "\\c", function()
	vim.wo.cursorline = not vim.wo.cursorline
	vim.notify(string.format("Cursorline  %s", vim.wo.cursorline), "info", { title = "Ui" })
end, { desc = "Toggle Cursorline" })

keymap("n", "\\s", function()
	vim.wo.spell = not vim.wo.spell -- local to window
	vim.notify(string.format("spell %s", vim.wo.spell), "info", { title = "Spell" })
end, { desc = "Toggle Spell" })

local codeium = true
keymap("n", "\\a", function()
	if codeium then
		vim.cmd("NeoCodeium disable")
	else
		vim.cmd("NeoCodeium enable")
	end
	codeium = not codeium
	vim.notify(string.format("Codeium %s", codeium), "info", { title = "Codeium" })
end, { desc = "Toggle Codeium" })

local indentation = true
keymap("n", "\\i", function()
	vim.cmd("IndentBlanklineToggle")
	indentation = not indentation
	vim.notify(string.format("Indentation %s", indentation), "info", { title = "Indent Blankline" })
end, { desc = "Toggle Indentation" })

local diagnostics = false
keymap("n", "\\d", function()
	require("lsp_lines").toggle()
	diagnostics = not diagnostics
	vim.notify(string.format("Lsp Lines %s", diagnostics), "info", { title = "Lsp Lines" })
end, { desc = "Toggle Lsp Lines" })

local noice = true
keymap("n", "\\n", function()
	if noice then
		vim.cmd("Noice disable")
	else
		vim.cmd("Noice enable")
	end
	noice = not noice
	vim.notify(string.format("Noice %s", noice), "info", { title = "Noice" })
end, { desc = "Toggle Noice" })

local gitsigns = true
keymap("n", "\\g", function()
	vim.cmd("Gitsigns toggle_numhl")
	gitsigns = not gitsigns
	vim.notify(string.format("Gitsigns %s", gitsigns), "info", { title = "Gitsigns" })
end, { desc = "Toggle Gitsigns" })

keymap("n", "\\h", function()
	local inlay_hints_state = vim.lsp.inlay_hint.is_enabled({ bufnr = vim.api.nvim_get_current_buf() })
	vim.lsp.inlay_hint.enable(not inlay_hints_state)
	vim.notify(string.format("Inlay Hints %s", not inlay_hints_state), "info", { title = "Inlay Hints" })
end, { desc = "Toggle Inlay Hints" })

local eyeliner = true
keymap("n", "\\e", function()
	vim.cmd("EyelinerToggle")
	eyeliner = not eyeliner
	vim.notify(string.format("Eyeliner %s", eyeliner), "info", { title = "Eyeliner" })
end, { desc = "Toggle Eyeliner" })

local state_cmp = true
keymap("n", "\\l", function()
	if state_cmp then
		vim.cmd(":lua require('cmp').setup.buffer { enabled = false }")
	else
		vim.cmd(":lua require('cmp').setup.buffer { enabled = true }")
	end
	state_cmp = not state_cmp
	vim.notify(string.format("Completion %s", state_cmp), "info", { title = "Completion" })
end, { desc = "Toggle Completion" })

keymap("n", "\\C", function()
	local res = vim.api.nvim_exec("set colorcolumn?", true)
	if string.find(res, "80") then
		vim.cmd("set colorcolumn=")
	else
		vim.cmd("set colorcolumn=80")
	end
	vim.notify(string.format("Colorcolumn %s", vim.wo.colorcolumn), "info", { title = "Ui" })
end, { desc = "Toggle Colorcolumn" })
