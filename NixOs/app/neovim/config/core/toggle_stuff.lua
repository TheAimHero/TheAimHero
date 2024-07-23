local keymap = vim.keymap.set
local lvl = vim.log.levels

local color = "Catppuccin Mocha"
keymap("n", "\\b", function()
	if color == "Catppuccin Mocha" then
		vim.cmd("colorscheme catppuccin-frappe")
		color = "Catppuccin Custom Frappe"
	else
		vim.cmd("colorscheme catppuccin-mocha")
		color = "Catppuccin Mocha"
	end
	vim.notify("Color Scheme: " .. color, lvl.INFO, { title = "Ui" })
end, { desc = "Toggle Color Scheme" })

keymap("n", "\\w", function()
	vim.wo.wrap = not vim.wo.wrap
	vim.notify(string.format("Wrap  %s", vim.wo.wrap), lvl.INFO, { title = "Ui" })
end, { desc = "Toggle Wrap" })

keymap("n", "\\c", function()
	vim.wo.cursorline = not vim.wo.cursorline
	vim.notify(string.format("Cursorline  %s", vim.wo.cursorline), lvl.INFO, { title = "Ui" })
end, { desc = "Toggle Cursorline" })

keymap("n", "\\s", function()
	vim.wo.spell = not vim.wo.spell -- local to window
	vim.notify(string.format("spell %s", vim.wo.spell), lvl.INFO, { title = "Spell" })
end, { desc = "Toggle Spell" })

local codeium = true
keymap("n", "\\a", function()
	vim.cmd("NeoCodeium toggle")
	codeium = not codeium
	vim.notify(string.format("Codeium %s", codeium), lvl.INFO, { title = "Codeium" })
end, { desc = "Toggle Codeium" })

keymap("n", "\\h", function()
	local inlay_hints_state = vim.lsp.inlay_hint.is_enabled({ bufnr = vim.api.nvim_get_current_buf() })
	vim.lsp.inlay_hint.enable(not inlay_hints_state)
	vim.notify(string.format("Inlay Hints %s", not inlay_hints_state), lvl.INFO, { title = "Inlay Hints" })
end, { desc = "Toggle Inlay Hints" })

local eyeliner = true
keymap("n", "\\e", function()
	vim.cmd("EyelinerToggle")
	eyeliner = not eyeliner
	vim.notify(string.format("Eyeliner %s", eyeliner), lvl.INFO, { title = "Eyeliner" })
end, { desc = "Toggle Eyeliner" })

local state_cmp = true
keymap("n", "\\l", function()
	if state_cmp then
		vim.cmd(":lua require('cmp').setup.buffer { enabled = false }")
	else
		vim.cmd(":lua require('cmp').setup.buffer { enabled = true }")
	end
	state_cmp = not state_cmp
	vim.notify(string.format("Completion %s", state_cmp), lvl.INFO, { title = "Completion" })
end, { desc = "Toggle Completion" })

local diagnostics = true
keymap("n", "\\d", function()
	if diagnostics then
		vim.cmd("lua vim.diagnostic.disable()")
	else
		vim.cmd("lua vim.diagnostic.enable()")
	end
	diagnostics = not diagnostics
	vim.notify(string.format("Diagnostics %s", diagnostics), lvl.INFO, { title = "Diagnostics" })
end, { desc = "Toggle Diagnostics" })
