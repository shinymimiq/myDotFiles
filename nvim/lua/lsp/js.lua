DATA_PATH = vim.fn.stdpath('data')

require'lspconfig'.tsserver.setup {
    cmd = {DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server", "--stdio"},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    -- on_attach = require'lsp'.tsserver_on_attach,
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- on_attach = require'lsp'.common_on_attach,
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    settings = {documentFormatting = false},
    on_attach = function(client)
      -- disable tsserver formatting
      client.resolved_capabilities.document_formatting = false
      -- format on save
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)")
    end,
    handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            -- virtual_text = O.tsserver.diagnostics.virtual_text,
            -- signs = O.tsserver.diagnostics.signs,
            -- underline = O.tsserver.diagnostics.underline,
            -- update_in_insert = true
        })
    }
}

