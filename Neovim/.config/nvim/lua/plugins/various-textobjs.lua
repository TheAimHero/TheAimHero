return {
	"chrisgrieser/nvim-various-textobjs",
	event = "User FileOpened",
	config = function()
		require("various-textobjs").setup({
			useDefaultKeymaps = true,
			lookForwardLines = 100,
			disabledKeymaps = { "gc" },
		})

		vim.keymap.set("n", "gx", function()
			-- select URL
			require("various-textobjs").url()

			-- plugin only switches to visual mode when textobj found
			local foundURL = vim.fn.mode():find("v")
			if not foundURL then
				return
			end

			-- retrieve URL with the z-register as intermediary
			vim.cmd.normal({ '"zy', bang = true })
			local url = vim.fn.getreg("z")

			-- open with the OS-specific shell command
			local opener
			if vim.fn.has("macunix") == 1 then
				opener = "open"
			elseif vim.fn.has("linux") == 1 then
				opener = "xdg-open"
			elseif vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 then
				opener = "start"
			end
			local openCommand = string.format("%s '%s' >/dev/null 2>&1", opener, url)
			vim.fn.system(openCommand)
		end, { desc = "URL Opener" })
	end,
}
