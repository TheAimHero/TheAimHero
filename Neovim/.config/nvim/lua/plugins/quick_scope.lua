return {
	"jinh0/eyeliner.nvim",
	event = "User FileOpened",
	config = function()
		require("eyeliner").setup({
			highlight_on_key = false, -- show highlights only after keypress
			dim = false, -- dim all other characters if set to true (recommended!)
		})

		vim.api.nvim_create_autocmd({ "Colorscheme" }, {
			pattern = { "*" },
			callback = function()
				vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#00c7df", bold = true })
				vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#f84e03", bold = true })
				vim.api.nvim_set_hl(0, "EyelinerDimmed", { link = "Comment" })
			end,
		})

	end,
}
