local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal Mode --

-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)            -- Ctrl + h -> Move to left window
keymap("n", "<C-j>", "<C-w>j", opts)            -- Ctrl + j -> Move to lower window
keymap("n", "<C-k>", "<C-w>k", opts)            -- Ctrl + k -> Move to upper window
keymap("n", "<C-l>", "<C-w>l", opts)            -- Ctrl + l -> Move to right window
