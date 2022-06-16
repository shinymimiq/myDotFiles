
-- set the path to the jedi installation;
local jedi_root_path = vim.fn.stdpath('data')..'/lsp_servers/jedi_language_server/venv/bin'
local jedi_binary = jedi_root_path.."/jedi_language_server"


require'lspconfig'.jedi_language_server.setup{
  cmd={jedi_binary},
}
