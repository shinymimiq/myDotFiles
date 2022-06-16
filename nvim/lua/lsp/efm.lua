DATA_PATH = vim.fn.stdpath('data')

local jsts_args = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
  lintCommand = "./node_modules/.bin/eslint.js -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
}

require "lspconfig".efm.setup {
  -- cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver", '-logfile', '/Users/shinymimiq/tmp/efm.log', '-loglevel', '5'},
  cmd = {DATA_PATH .. "/lsp_servers/efm/efm-langserver"},
  init_options = {documentFormatting = true},
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "lua"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
          {formatCommand = "lua-format -i", formatStdin = true},
      },
      javascript = {jsts_args},
      javascriptreact = {jsts_args},
      typescript = {jsts_args},
      typescriptreact = {jsts_args},
    }
  }
}
