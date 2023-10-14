return {
	"williamboman/mason-lspconfig.nvim",
	enabled = true,
	cmd = { "LspInstall", "LspUninstall" },
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = false,
		})
		--settings for auto setup of servers
		require("plugins.nvim-lspconfig.handlers").setup()
		require("mason-lspconfig").setup_handlers({

			function(server_name)
				require("lspconfig")[server_name].setup({
					---@diagnostic disable-next-line: unused-local
					on_attach = function(c, b)
						require("plugins.nvim-lspconfig.handlers").lsp_keymaps(b)
					end,
					capabilities = require("plugins.nvim-lspconfig.handlers").capabilities,
				})
			end,

			["tailwindcss"] = require("plugins.nvim-lspconfig.setting.tailwindcss"),
			["html"] = require("plugins.nvim-lspconfig.setting.html"),
			["lua_ls"] = require("plugins.nvim-lspconfig.setting.lua_ls"),
			["pyright"] = require("plugins.nvim-lspconfig.setting.pyright"),
			["clangd"] = require("plugins.nvim-lspconfig.setting.clangd"),
			["jsonls"] = require("plugins.nvim-lspconfig.setting.jsonls"),
		})
	end,
}
