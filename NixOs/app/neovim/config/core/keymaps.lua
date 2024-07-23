-- Shorten function name
local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap({ "i", "n" }, "<C-LeftMouse>", "<Nop>", opts)
keymap({ "n", "i", "v" }, "<A-i>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Redo
keymap("n", "U", "<C-r>", opts)

-- Insert Mode
keymap("i", "jk", "<ESC>", opts)
keymap("n", "x", '"_x', opts)

keymap("t", "<C-h>", "<C-\\><C-n><C-h>", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-j>", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-k>", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-l>", opts)

-- Windows
keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Only" })
keymap("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close" })
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
keymap("n", "<leader>wx", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Buffers
keymap("n", "<leader>bf", "<cmd>Telescope buffers<cr>", { desc = "Find" })
keymap("n", "<leader>c", "<cmd>silent! bd<cr>", { desc = "Close Buffer" })
keymap("n", "<leader>bc", "<cmd>silent! %bd<cr>", { desc = "Close All Buffers" })
keymap("n", "<leader>bh", "<cmd>silent! .+,$bd<cr>", { desc = "Close Buffers to Right" })
keymap("n", "<leader>bg", "<cmd>silent! 1,.-bd<cr>", { desc = "Close Buffers to Left" })

-- Clear search highlight
keymap("n", "<leader>h", "<cmd>silent! nohlsearch<cr><cmd>silent! lua MiniNotify.clear()<cr>", { desc = "Remove Highlight" })
