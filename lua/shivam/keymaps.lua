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

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)               -- Ctrl + Up -> Resize to up
keymap("n", "<C-Down>", ":resize +2<CR>", opts)             -- Ctrl + Down -> Resize to down
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)    -- Ctrl + Left -> Resize to left
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)   -- Ctrl + Right -> Resize to right

-- Move text up and down
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>", opts)           -- Alt + Down -> Move text down
keymap("n", "<A-Up>", "<Esc>:m .-2<CR>", opts)           -- Alt + Up -> Move text up


-- Visual Mode --

-- Stay in indent mode while indenting
keymap("v", "<", "<gv", opts)           -- "<" -> Un-indent selected text
keymap("v", ">", ">gv", opts)           -- ">" -> Indent selected text
