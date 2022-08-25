local c = require("lsp.custom")

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup(c.default({
    root_dir = c.custom_cwd,
    settings = {
        tsserver = {
            useBatchedBufferSync = true
        },
        javascript = {
            autoClosingTags = true,
            suggest = {
                autoImports = true
            },
            updateImportsOnFileMove = {
                enable = true
            },
            suggestionActions = {
                enabled = false
            }
        }
    }
}))

lspconfig.gopls.setup(c.default({
    cmd = {"gopls", "serve"},
    root_dir = c.custom_cwd,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true
            },
            staticcheck = true,
            usePlaceholders = false
        }
    }
}))

lspconfig.sumneko_lua.setup(c.default({
    cmd = {"lua-language-server", string.format("--logpath=%s/.cache/nvim/sumneko_lua", vim.loop.os_homedir())},
    root_dir = c.custom_cwd,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            telemetry = {
                enable = false
            },
            diagnostics = {
                enable = true,
                globals = {"vim", "awesome", "use", "client", "root", "s", "screen"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    ["/usr/share/awesome/lib"] = true,
                    ["/usr/share/lua/5.1"] = true,
                    ["/usr/share/lua/5.3"] = true,
                    ["/usr/share/lua/5.4"] = true
                }
            }
        }
    }
}))

lspconfig.cssls.setup(c.default({
    cmd = {"css-languageserver", "--stdio"},
    root_dir = c.custom_cwd
}))

lspconfig.jsonls.setup(c.default({
    cmd = {"vscode-json-languageserver", "--stdio"},
    root_dir = c.custom_cwd
}))

lspconfig.yamlls.setup(c.default({
    settings = {
        yaml = {
            format = {
                enable = true,
                singleQuote = true,
                bracketSpacing = true
            },
            editor = {
                tabSize = 2
            },
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "ci.yml",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml"
            }
        }
    }
}))

local servers = {"dockerls", "vimls"}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(c.default())
end
