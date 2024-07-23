require("eyeliner").setup({
	highlight_on_key = false,
	dim = false,
})

vim.api.nvim_create_autocmd({ "Colorscheme" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#00c7df", bold = true })
		vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#f84e03", bold = true })
		vim.api.nvim_set_hl(0, "EyelinerDimmed", { link = "Comment" })
	end,
})
