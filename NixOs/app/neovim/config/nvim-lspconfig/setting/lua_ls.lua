	require("lspconfig").lua_ls.setup({
		on_attach = function(c, b)
			Handlers.lsp_keymaps(b)
		end,
		capabilities = Handlers.capabilities,
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		log_level = 2,
		single_file_support = true,
		settings = {
			Lua = {
				hint = { enable = true },
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim", "lvim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
			},
		},
	})
