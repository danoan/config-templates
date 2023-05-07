local M = {}

function M.config()
    require('nvim-tree').setup({
        view = {
            width = 40,
        },
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true
        },
        git = {
            enable = true,
            ignore = false
        }
    })
end

return M

