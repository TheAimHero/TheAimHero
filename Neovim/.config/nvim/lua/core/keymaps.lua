local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap({ "i", "n" }, "<C-LeftMouse>", "<Nop>", opts)
keymap({ "n", "i", "v" }, "<A-i>", "<Nop>", opts)
vim.g.maplocalleader = ","
vim.g.mapleader = " "

-- Redo
keymap("n", "U", "<C-r>", opts)

-- Window manipulation

keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only", noremap = true })
keymap("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close", noremap = true })
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical Split", noremap = true })
keymap("n", "<leader>wx", "<cmd>split<cr>", { desc = "Horizontal Split", noremap = true })

-- Insert Mode
keymap("i", "jk", "<ESC>", opts)
keymap("n", "x", '"_x', opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-h>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-j>", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-k>", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-l>", opts)
