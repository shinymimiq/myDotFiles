
require'lspconfig'.clangd.setup{
  cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd", "--background-index"},
  filetypes = {"c", "cpp"},
}
