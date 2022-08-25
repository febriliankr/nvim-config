autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = true })
