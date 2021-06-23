
-- nvim-comment
require('nvim_comment').setup()

-- gitblame
vim.cmd('highlight default link gitblame SpecialComment')
vim.g.gitblame_enabled = 1

-- gitsigns
require('gitsigns').setup()



require('lsp/efm')
require('lsp/js')

