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
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif ls.expand_or_locally_jumpable() then
                ls.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif ls.jumpable(-1) then
                ls.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),

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

