return function()
	require("lspconfig").tailwindcss.setup({
		on_attach = function(c, b)
			require("plugins.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("plugins.nvim-lspconfig.handlers").capabilities,
		filetypes = { "typescriptreact", "javascriptreact", "html", "templ" },
		init_options = { userLanguages = { templ = "html" } },
		root_dir = require("lspconfig").util.root_pattern(
			"tailwind.config.js",
			"tailwind.config.ts",
			"tailwind.config.cjs"
		),
		settings = {
			tailwindCSS = {
				experimental = { classRegex = { { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" } } },
			},
		},
	})
end
