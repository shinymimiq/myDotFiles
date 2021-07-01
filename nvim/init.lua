
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"

vim.o.termguicolors = true

vim.wo.number = true -- line number
vim.wo.relativenumber = true -- relative line number
vim.bo.tabstop = 2
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.o.showtabline = 2 -- always show tab on top
vim.wo.cursorline = true -- show current line
vim.wo.wrap = true -- wrap line


vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.o.mouse = "a" -- Enable mouse
vim.o.splitbelow = true  -- Horizontal splits to below
vim.o.splitright = true  -- Vertical splits to right
vim.o.clipboard = 'unnamedplus' -- system clipboard
vim.o.showmode = false -- No need for -- INSERT --

vim.o.pumheight = 10 -- popup menu smaller
vim.o.fileencoding = 'utf-8' -- file encoding
vim.o.cmdheight = 2 -- more space for displaying message

vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"

-- for nvim compe
vim.o.completeopt = "menuone,noselect"

-- for whichkey
vim.o.timeoutlen = 100


-- Enable Packer with Plugins
require('packer-plugins-list')

-- plugin settings
require('plugins')
require('telescope-settings')
require('compe-settings')
require('galaxyline-settings')
require('treesitter-settings')
-- require('lsp-install-settings')
-- require('lspInstall-settings')
require('autopair-settings')
require('nvimtree-settings')

-- Keymap settings (Include Which-key settings)
require('keymappings')

-- lsp
require('lsp/efm')
require('lsp/js')
require('lsp/lua')

-- Theme
require('onedark').setup()



