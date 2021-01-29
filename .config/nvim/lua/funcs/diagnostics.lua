local M = {}

function M.get_count()
    local errors = 0
    local warnings = 0

    local cur_buf_errors = 0
    local cur_buf_warnings = 0
    for _, buffer in ipairs(vim.fn['getbufinfo']()) do  -- Loop through buffers
        if buffer.listed == 1 and buffer.name ~= '' then  -- If the buffer is listed and it is not a no-name buffer
            local bufnr = buffer.bufnr
            local buf_errors = vim.lsp.diagnostic.get_count(bufnr, [[Error]])
            local buf_warnings = vim.lsp.diagnostic.get_count(bufnr, [[Warning]])
            errors = errors + buf_errors  -- Add this buffer's errors to the total errors
            warnings = warnings + buf_warnings  -- Same with warnings
            if bufnr == vim.fn.bufnr() then  -- If this buffer is the currently open buffer
                cur_buf_errors = buf_errors
                cur_buf_warnings = buf_warnings
            end
        end
    end

    local to_return = {}
    local error_table = {}
    error_table.cur_buf = cur_buf_errors
    error_table.total = errors
    local warning_table = {}
    warning_table.cur_buf = cur_buf_warnings
    warning_table.total = warnings
    to_return.errors = error_table
    to_return.warnings = warning_table
    return to_return
end

return M
