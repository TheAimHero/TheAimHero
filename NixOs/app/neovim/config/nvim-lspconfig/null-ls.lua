local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = true,
	border = "single",

	sources = {
		-- diagnostics.cspell.with({
		-- 	diagnostics_postprocess = function(diagnostic)
		-- 		diagnostic.severity = vim.diagnostic.severity.HINT
		-- 	end,
		-- }),
		formatting.prettierd.with({ disabled_filetypes = { "html" } }),
		formatting.nixpkgs_fmt,
		formatting.clang_format.with({
			extra_args = {
				"--style",
				"{AllowShortBlocksOnASingleLine: SBS_Always, AllowShortIfStatementsOnASingleLine: SIS_Always }",
			},
		}),
		-- code_actions.gitsigns,
	},
})
