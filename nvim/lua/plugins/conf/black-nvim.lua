local M = {}

function M.setup()
    vim.cmd[[let g:black#settings = { 'line_length': 100 }]]
end

M.setup()

return M

