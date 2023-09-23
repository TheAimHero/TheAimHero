local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("n", "<C-LeftMouse>", "<Nop>", opts)
keymap("i", "<C-LeftMouse>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Redo
keymap("n", "U", "<C-r>", opts)

-- Insert Mode
keymap("i", "jk", "<ESC>", opts)
keymap("n", "x", '"_x', opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-h>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-j>", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-k>", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-l>", opts)
