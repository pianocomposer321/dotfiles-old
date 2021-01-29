local lsp = require("lspconfig")
local compl = require("completion")
local map = require('funcs').map

local M = {}

function M.config()
    lsp.pyls.setup{on_attach = compl.on_attach}
    lsp.rust_analyzer.setup{on_attach = compl.on_attach}
    -- lsp.sumneko_lua.setup{on_attach = compl.on_attach}
    -- lsp.lua_lsp.setup{on_attach = compl.on_attach}
    -- require('lua-lsp').setup()

    map('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
    map('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>')
    map('n', '<LEADER>rn', '<CMD>lua vim.lsp.buf.rename()<CR>')
    map('n', '[g', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', ']g', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n', 'K', "<CMD>lua vim.lsp.buf.hover()<CR>")

    vim.cmd("set updatetime=300")
    vim.cmd("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()")

    map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
    map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})


end

return M
