
-- Keymappings
-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- esc
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})
-- resize with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files theme=get_dropdown<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>r', ':Telescope live_grep theme=get_dropdown<CR>', {noremap = true, silent = true})

-- search highlight
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- nvim-compe
vim.cmd('inoremap <silent><expr> <C-Space> compe#complete()')
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")

-- nvim-compe (s-)Tab to navigate omnicomplete menu, 
-- defined in compe-settings/init.lua
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
