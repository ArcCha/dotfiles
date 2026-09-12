local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "Focus left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right split" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Write file" })
map("n", "<leader>q", "<cmd>confirm quit<CR>", { desc = "Quit" })

vim.cmd("iabbrev amail Hej,<CR><CR>")
