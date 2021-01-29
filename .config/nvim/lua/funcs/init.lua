local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function M.opt(scope, key, value)
   scopes[scope][key] = value
   if scope ~= 'o' then scopes['o'][key] = value end
end

M.diagnostics = require("funcs/diagnostics")
M.quickfix = require("funcs/quickfix")

return M
