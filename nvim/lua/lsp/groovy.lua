
-- set the path to the groovy installation;
local groovy_root_path = vim.fn.stdpath('data')..'/lsp_servers/groovyls/libs'
local groovy_binary = groovy_root_path.."/groovyls-all.jar"


require'lspconfig'.groovyls.setup{
  cmd={"java", "-jar", groovy_root_path}
}
