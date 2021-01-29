local cmd = vim.cmd
local f = require("funcs")

cmd("let mapleader = ' '")

f.map("i", "jk", "<ESC>")

f.map("n", "Y", "y$")
f.map("n", "j", "gj")
f.map("n", "k", "gk")

f.map("n", "<LEADER>rc", "<CMD>Vimrc<CR>")

f.map("n", "<LEADER>q", "<CMD>lua require'funcs'.quickfix.toggle()<CR>")

f.map("n", "<LEADER>v", "<CMD>vs<CR>")
f.map("n", "<LEADER>s", "<CMD>sp<CR>")
f.map("n", "<LEADER>t", "<CMD>tabnew<CR>")

f.map("n", "<LEADER>n", "<CMD>bn<CR>")
f.map("n", "<LEADER>p", "<CMD>bp<CR>")

f.map("n", "<C-D>", "5<C-E>")
f.map("n", "<C-U>", "5<C-Y>")

f.map("t", "jk", [[<C-\><C-n>]])
