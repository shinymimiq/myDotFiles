
-- nvim-comment
require('nvim_comment').setup()

-- gitblame
vim.cmd('highlight default link gitblame SpecialComment')
vim.g.gitblame_enabled = 1

-- gitsigns
require('gitsigns').setup()



require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
