local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local disable_table = {
	"toggleterm",
	"DiffviewFileHistory",
	"diff",
	"neo-tree",
	"DiffviewFiles",
	"lazy",
	"mason",
	"Trouble",
	"Outline",
	"fugitive",
	"git",
	"TelescopPrompt",
	"help",
	"man",
	"terminal",
	"qf",
	"nowrite",
	"norg",
	"trouble",
	"leetcode.nvim",
}

--Disable mini on some filetype
augroup("Disable_Plugins", { clear = true })
autocmd({ "FileType" }, {
	pattern = disable_table,
	group = "Disable_Plugins",
	callback = function()
		vim.b.miniindentscope_disable = true
		vim.b.minicursorword_disable = true
		vim.b.minijump_disable = true
	end,
})

autocmd("FileType", {
	pattern = { "Outline", "neo-tree", "trouble" },
	callback = function()
		vim.opt.foldenable = false
		vim.wo.foldcolumn = "0"
	end,
})

-- @note: This is when we want to do something before closing a buffer
local save_fold = augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd("mkview")
	end,
	group = save_fold,
})

-- Make alpha popup when no buffers remain
-- @note: Find a way to make this work without BDeletePost
augroup("alpha_on_empty", { clear = true })
autocmd("User", {
	pattern = "BDeletePost*",
	group = "alpha_on_empty",
	callback = function(event)
		local fallback_name = vim.api.nvim_buf_get_name(event.buf)
		local fallback_ft = vim.bo.filetype

		local fallback_on_empty = fallback_name == "" and fallback_ft == ""
		if fallback_on_empty then
			vim.cmd("lua MiniStarter.open()")
			vim.cmd(event.buf .. "bwipeout")
		end
	end,
})

-- @note: This is when we want to do something after opening a buffer
autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd("silent! loadview")
	end,
	group = save_fold,
})

-- Persistent Cursor
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
