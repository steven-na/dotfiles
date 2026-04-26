vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Disable Space in normal/visual (used as leader)
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Save
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })

-- Better up/down on wrapped lines
map({ "n", "v" }, "j", "gj")
map({ "n", "v" }, "k", "gk")

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>",     { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Splits
map("n", "<leader>sv", "<C-w>v",  { desc = "Split vertical" })
map("n", "<leader>sh", "<C-w>s",  { desc = "Split horizontal" })
map("n", "<leader>se", "<C-w>=",  { desc = "Equal splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Move lines
map("n", "<A-Down>", "<cmd>m .+1<CR>==",  { desc = "Move line down" })
map("n", "<A-Up>",   "<cmd>m .-2<CR>==",  { desc = "Move line up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-Up>",   ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in visual after indent
map("v", "<", "<gv")
map("v", ">", ">gv")
