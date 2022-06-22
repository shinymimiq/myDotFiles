
-- set the path to the docker installation;
local docker_root_path = vim.fn.stdpath('data')..'/dockerls/node_modules/dockerfile-language-server-nodejs/bin'
local docker_binary = docker_root_path.."/docker-langserver"

require'lspconfig'.dockerls.setup{
  cmd={docker_binary, "--stdio"}
}
