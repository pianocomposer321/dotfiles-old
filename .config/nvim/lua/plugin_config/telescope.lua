local M = {}
map = require('funcs').map
local telescope = require("telescope")
builtin = require("telescope.builtin")

function M.config()
    map("n", "<LEADER>f", "<CMD>lua builtin.find_files()<CR>")
    map("n", "<LEADER>b", "<CMD>lua builtin.buffers()<CR>")
end

return M
