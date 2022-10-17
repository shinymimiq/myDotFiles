
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"

-- vim.o.termguicolors = true

vim.wo.number = true -- line number
vim.wo.relativenumber = true -- relative line number
vim.go.tabstop = 2
vim.go.shiftwidth = 2
vim.go.expandtab = true -- convert tab into space
vim.go.smartindent = true
vim.o.showtabline = 2 -- always show tab on top
vim.wo.cursorline = true -- show current line
vim.wo.wrap = true -- wrap line


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
vim.o.hidden = true, -- required to keep multiple buffers and open multiple buffers


vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"

-- for nvim compe
vim.o.completeopt = "menuone,noselect"

-- for whichkey
vim.o.timeoutlen = 100

-- don't auto comment new lines
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=369}
  augroup end
  ]],
	false
)

-- Do not source the default filetype.vim, we have a plugin installed
vim.g.did_load_filetypes = 1

-- filetype:
vim.cmd([[
  autocmd Filetype c setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
  autocmd Filetype cpp setlocal tabstop=4 shiftwidth=4 softtabstop=0 expandtab
]])

-- Enable Packer with Plugins
require('packer-plugins-list')

-- plugin settings
require('plugins')
require('telescope-settings')
require('compe-settings')
require('galaxyline-settings')
require('treesitter-settings')
require('lspInstall-settings')
require('autopair-settings')
require('nvimtree-settings')
-- require('toggleterm-settings')
require('dashboard-settings')
require('session-manager')
require('filetype-settings')

-- Keymap settings (Include Which-key settings)
require('keymappings')

-- lsp
require('lsp/efm')
require('lsp/cpp')
require('lsp/lua')
require('lsp/python')
require('lsp/groovy')
require('lsp/beancount')
require('lsp/bash')

-- Theme
-- require('onedark').setup()
vim.opt.termguicolors = true
vim.g.sonokai_style = "default"
vim.g.sonokai_better_performance = true
vim.cmd("colorscheme sonokai")


