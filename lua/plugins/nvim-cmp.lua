-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------
-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmp
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
    return
end

cmp.setup {
    -- Load snippet support
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    -- Completion settings
    completion = {
        -- completeopt = 'menu,menuone,noselect'
        keyword_length = 2
    },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,

        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),

        ["<C-e>"] = cmp.mapping.close(),

        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        })
    },

    -- Load sources, see: https://github.com/topics/nvim-cmp
    sources = {{
        name = 'nvim_lsp'
    }, {
        name = 'luasnip'
    }, {
        name = 'path'
    }, {
        name = 'buffer'
    }}
}

