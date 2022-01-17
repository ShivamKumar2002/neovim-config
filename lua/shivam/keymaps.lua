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

-- Buffer navigation with bufferline
-- Leader b N -> Go to buffer N
keymap('n', '<Leader>b1', ':BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<Leader>b2', ':BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<Leader>b3', ':BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<Leader>b4', ':BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<Leader>b5', ':BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<Leader>b6', ':BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<Leader>b7', ':BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<Leader>b8', ':BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<Leader>b9', ':BufferLineGoToBuffer 9<CR>', opts)

keymap('n', '<Leader>b?', ':BufferLinePick<CR>', opts)  -- Leader b ? -> Enter buffer-picking mode

keymap('n', '<Leader><Right>', ':BufferLineCycleNext<CR>', opts)  -- Leader Right -> Go to next buffer
keymap('n', '<Leader>bn', ':BufferLineCycleNext<CR>', opts)  -- Leader b n -> Go to next buffer
keymap('n', '<Leader><Left>', ':BufferLineCycleNext<CR>', opts)  -- Leader Left -> Go to previous buffer
keymap('n', '<Leader>bp', ':BufferLineCyclePrev<CR>', opts)  -- Leader b p -> Go to previous buffer

keymap('n', '<Leader>b<Right>', ':BufferLineMoveNext<CR>', opts)  -- Leader b Right -> Re-order to next
keymap('n', '<Leader>b<Left>', ':BufferLineMovePrev<CR>', opts)  -- Leader b Left -> Re-order to previous

-- Telescope --
keymap("n", "<leader>fl", "<cmd>Telescope find_files<cr>", opts)  -- Leader f f -> Find files
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts)  -- Leader f t -> Find text


-- Visual Mode --

-- Stay in indent mode while indenting
keymap("v", "<", "<gv", opts)           -- "<" -> Un-indent selected text
keymap("v", ">", ">gv", opts)           -- ">" -> Indent selected text

-- Move text up and down
keymap("v", "<A-Down>", ":m .+1<CR>", opts)           -- Alt + Down -> Move text down
keymap("v", "<A-Up>", ":m .-2<CR>", opts)           -- Alt + Up -> Move text up


-- Visual Block Mode --

-- Move selected text up and down
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)            -- Alt + Down -> Move selected text down
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)              -- Alt + Up -> Move selected text up


-- Nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>fe", ":NvimTreeToggle<cr>", opts)

