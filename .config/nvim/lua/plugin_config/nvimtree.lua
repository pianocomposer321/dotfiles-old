local g = vim.g
local map = require("funcs").map

local M = {}

function M.config()
    g["nvim_tree_side"] = 'right'
    map("n", "<C-n>", "<CMD>NvimTreeToggle<CR>")
end

return M
