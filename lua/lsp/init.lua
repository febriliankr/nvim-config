local M = {}

function M.config()
    require("lsp.langserver")
    require("lsp.diagnostic")
    require("lsp.nulls")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
