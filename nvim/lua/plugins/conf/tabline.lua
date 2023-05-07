local M = {}

function M.setup()
    require('tabline').setup({
        enable = false, -- Set up by lualine
        options = {
            component_separators = {"", ""},
            section_separators = {"", ""},
        }
    })
end

M.setup()

return M

