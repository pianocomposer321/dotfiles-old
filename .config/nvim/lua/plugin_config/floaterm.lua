local M = {}

local map = require('funcs').map
function M.config()
    map('n', [[<C-\>]], '<CMD>FloatermToggle yabs-runner<CR>')
    map('i', [[<C-\>]], '<CMD>FloatermToggle yabs-runner<CR>')
    map('t', [[<C-\>]], '<CMD>FloatermToggle yabs-runner<CR>')

    vim.g.floaterm_width = 0.97
    vim.g.floaterm_height = 12
    vim.g.floaterm_position = 'bottom'
end

return M
