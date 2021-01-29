local g = vim.g

local M = {}

function M.config()
    -- g.bufferline = {}
    -- g.bufferline.animation = false
    -- g.bufferline.closeable = false
    -- g.bufferline.clickable = false
    vim.cmd("let g:bufferline = {}")
    vim.cmd("let bufferline.animation = v:false")
    vim.cmd("let bufferline.closeable = v:false")
    vim.cmd("let bufferline.clickable = v:false")
    vim.cmd("let bufferline.icon_close_tab = ''")
end

return M
