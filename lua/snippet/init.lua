local ls = require("luasnip")
local types = require("luasnip.util.types")

local M = {}

function M.config()
    ls.config.setup({
        history = true,
        update_events = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged",
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = {{"❰ Choice Node", "Comment"}}
                }
            }
        }
    })

    vim.keymap.set("i", "<A-]>", function()
        if ls.choice_active() then
            return ls.change_choice(1)
        end
    end, {
        buffer = true
    })

    vim.keymap.set("i", "<A-[>", function()
        if ls.choice_active() then
            return ls.change_choice(-1)
        end
    end, {
        buffer = true
    })

    vim.keymap.set("i", "<A-space>", function()
        if ls.choice_active() then
            return require("luasnip.extras.select_choice")()
        end
    end, {
        buffer = true
    })

    M.snippets()
end

function M.snippets()
    -- some shorthands...
    local snip = ls.snippet
    local node = ls.snippet_node
    local text = ls.text_node
    local insert = ls.insert_node
    local func = ls.function_node
    local choice = ls.choice_node
    local dynamicn = ls.dynamic_node

    -- Date Snippet
    local date = function()
        return {os.date('%Y-%m-%d')}
    end
    ls.add_snippets(nil, {
        all = {snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD"
        }, {func(date, {})})}
    })
    -- Load from VSCode
    require("luasnip.loaders.from_vscode").lazy_load()
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end
})
