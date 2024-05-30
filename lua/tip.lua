local M = {}

---@class Tip.config
---@field prefix string
---@field url string
---@type Tip.config
M.config = {
    prefix = 'Tip: ',
    url = 'https://vtip.43z.one',
}

M._res = nil

---@param params Tip.config
M.setup = function(params)
    M.config = vim.tbl_deep_extend('force', {}, M.config, params or {})
    vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
            local job = require("plenary.job")
            job:new({
                command = 'curl',
                args = { '-L', M.config.url },
                on_exit = function(j, exit_code)
                    M._res = table.concat(j:result())
                    if exit_code ~= 0 then
                        M._res = 'Error fetching tip: ' .. M._res
                    end
                    vim.schedule(function() vim.notify(M.config.prefix .. M._res) end)
                end,
            }):start()
        end,
    })
end

vim.api.nvim_create_user_command("Tip", function ()
    vim.schedule(function() vim.notify(M.config.prefix .. M._res) end)
end, {})

return M
