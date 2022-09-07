DATA_PATH = vim.fn.stdpath('data')
local bashls_root_path = vim.fn.stdpath('data')..'/lsp_servers/bashls/node_modules/bash-language-server/bin'
local bashls_binary = bashls_root_path.."/main.js"

require'lspconfig'.bashls.setup{
  cmd = { "node", bashls_binary, "start" }
}

