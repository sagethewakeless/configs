local map = vim.keymap.set

-- Set "Space" as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Quick save and quit
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Move between splits with "Ctrl+hjkl" instead of "Ctrl+W" then "hjkl"
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to split below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to split above" })

-- Stay in indent mode (so you can keep pressing > or < in visual mode)
map("v", "<", "<gv", { desc = "Dedent and reselect" })
map("v", ">", ">gv", { desc = "Indent and reselect" })

-- Clear search highlights with Escape
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>s", '"+y', { desc = "Copy to system clipboard" })

-- Paste over selection without overwriting the unnamed register
map("v", "p", '"_dP', { desc = "Paste without yanking replaced text" })
