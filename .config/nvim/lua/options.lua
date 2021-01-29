local opt = require("funcs").opt
local cmd = vim.cmd

--  Global
opt("o", "hidden", true)
opt("o", "fsync", true)
opt("o", "undofile", true)
opt("o", "backup", true)
opt("o", "autoread", true)
opt("o", "exrc", true)
opt("o", "wildmenu", true)
opt("o", "wildmode", "longest:full,full")
opt("o", "pumheight", 5)
opt("o", "ignorecase", true)
opt("o", "smartcase", true)
opt("o", "mouse", "a")
opt("o", "showmode", false)
opt("o", "showtabline", 2)
opt("o", "inccommand", "nosplit")
opt("o", "termguicolors", true)
opt("o", "completeopt", "menuone,noinsert,noselect")

--  Local to window
opt("w", "lbr", true)
opt("w", "foldlevel", 99)
opt("w", "cursorline", true)
opt("w", "nu", true)
opt("w", "signcolumn", "yes")
opt("w", "foldmethod", "expr")
opt("w", "foldexpr", "nvim_treesitter#foldexpr()")

--  Local to buer
opt("b", "tabstop", 4)
opt("b", "softtabstop", 4)
opt("b", "shiftwidth", 4)
opt("b", "expandtab", true)

--  Wierd ones that require commands
cmd("set backupdir-=.")
