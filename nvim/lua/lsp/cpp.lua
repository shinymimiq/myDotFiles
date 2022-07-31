
local clangd_root_path = vim.fn.stdpath('data')..'/lsp_servers/clangd'
local clangd_binary = clangd_root_path.."/clangd/bin/clangd"

require'lspconfig'.clangd.setup{
  cmd = {clangd_binary},
  filetypes = {"c", "cpp","objc", "objcpp","cc"},
}
