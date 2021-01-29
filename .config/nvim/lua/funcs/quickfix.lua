local M = {}

function M.populate()
    local diagnostics = vim.lsp.diagnostic.get(0)
    for _, v in ipairs(diagnostics) do
        v.bufnr = vim.fn['bufnr']()
        v.lnum = v.range.start.line + 1
        v.col = v.range.start.character + 1
        v.text = v.message
    end
    vim.lsp.util.set_qflist(diagnostics)
end

function M.populate_all(open)
    local buffers = vim.fn['getbufinfo']()
    local d_list = {}
    for _, buffer in ipairs(buffers) do
        if buffer['listed'] == 1 then
            local diagnostics = vim.lsp.diagnostic.get(buffer['bufnr'])
            for _, err in ipairs(diagnostics) do
                err.bufnr = buffer.bufnr
                err.lnum = err.range.start.line + 1
                err.col = err.range.start.character + 1
                err.text = err.message
                table.insert(d_list, err)
            end
        end
    end
    vim.lsp.util.set_qflist(d_list)
    if open then
        vim.cmd('copen')
    end
end

-- function! QFixToggle(forced)
--   if exists("g:qfix_win") && a:forced == 0
--     cclose
--     unlet g:qfix_win
--   else
--     copen 10
--     let g:qfix_win = bufnr("$")
--   endif
-- endfunction

local function get_quickfix_open()
    local buffers = vim.fn.getbufinfo()
    for _, buffer in ipairs(buffers) do
        local buf_name = buffer.name
        local is_quickfix = vim.regex([[\vquickfix-\d+]])
        if is_quickfix:match_str(buf_name) then
            print([[found it]])
            return true
        end
    end
    print([[no quickfix here]])
    return false
end

function M.toggle()
    if get_quickfix_open() then
        vim.cmd([[cclose]])
    else
        M.populate_all(true)
    end
end

return M
