return {
	require("plugins.nvim-lspconfig.nvim_lspconfig"),
	require("plugins.nvim-lspconfig.mason"),
	require("plugins.nvim-lspconfig.mason-lspconfig"),
	require("plugins.nvim-lspconfig.null-ls"),
	require("plugins.nvim-lspconfig.mason-null-ls"),
	{ "b0o/schemastore.nvim", ft = "json", lazy = true },
}
