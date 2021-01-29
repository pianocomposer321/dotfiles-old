local g = vim.g
local map = require("funcs").map

local M = {}

function M.config()
    g["tmux_navigator_no_mappings"] = 1
    map("n", "<A-h>", "<CMD>TmuxNavigateLeft<CR>")
    map("n", "<A-j>", "<CMD>TmuxNavigateDown<CR>")
    map("n", "<A-k>", "<CMD>TmuxNavigateUp<CR>")
    map("n", "<A-l>", "<CMD>TmuxNavigateRight<CR>")
    map("n", "<A-/>", "<CMD>TmuxNavigatePrevious<CR>")
end

return M
