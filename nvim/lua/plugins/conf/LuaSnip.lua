local M = {}

function M.conf()
    require("luasnip.loaders.from_vscode").lazy_load()
end

return M

