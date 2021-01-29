local lualine = require("lualine")
local get_count = require("funcs").diagnostics.get_count

local M = {}

-- vim.cmd('highlight my_hl_warn guifg=#FABD2F') --guibg=#3C3836')
-- vim.cmd('highlight my_hl_error guifg=#FB4934') --guibg=#3C3836')
vim.cmd('highlight my_hl_warn guifg=Black guibg=#FABD2F')
vim.cmd('highlight my_hl_error guifg=Black guibg=#FB4934')


local function diagnostics(count, chars)
    local errors = count.errors.total
    local warnings = count.warnings.total
    local cur_buf_errors = count.errors.cur_buf
    local cur_buf_warnings = count.warnings.cur_buf

    local chars = chars or {"W", "E"}
    local warning_symbol = chars[1]
    local error_symbol = chars[2]

    if errors ~= 0 or warnings ~= 0 then  -- If there is at least one error or warning
        local to_return = ''
        local error_group = "%#my_hl_error# "..error_symbol.." "..tostring(cur_buf_errors)..":"..tostring(errors).." "
        local warning_group = "%#my_hl_warn# "..warning_symbol.." "..tostring(cur_buf_warnings)..":"..tostring(warnings).." "
        local normal_group = "%#lualine_b_normal#"
        if warnings ~= 0 then
            to_return = to_return..warning_group
        end
        if errors ~= 0 then
            to_return = to_return..error_group
        end
        to_return = to_return..normal_group
        return to_return
    else
        return ''  -- Otherwise return empty string
    end
end

function diag()
    local count = get_count()
    return diagnostics(count, {"", ""})
end

function M.config()
    -- local new_section = vim.list_extend({ function()
    --     local count = get_count()
    --     return diagnostics(count, {"", ""})
    -- end }, lualine.sections.lualine_x)
    -- lualine.sections.lualine_x = new_section
    -- lualine.sections.lualine_z = vim.list_extend(lualine.sections.lualine_z, {
    --     function()
    --         local count = get_count()
    --         return diagnostics(count, {"", ""})
    --     end
    -- })
    lualine.status()
    vim.cmd("autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.set_active_statusline(1)..v:lua.diag()")
end

return M
