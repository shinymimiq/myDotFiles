
-- set the path to the beancount installation;
local beancount_root_path = vim.fn.stdpath('data')..'/lsp_servers/beancount/bin'
local beancount_binary = beancount_root_path.."/beancount-language-server"

local pwd=vim.fn.getcwd()
local main_file = pwd.."/main.bean"

require'lspconfig'.beancount.setup{
  cmd={beancount_binary, "--stdio"},
  init_options = {
      journal_file = main_file,
  };
}
