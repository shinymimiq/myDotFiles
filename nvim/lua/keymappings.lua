
-- ======================
--   General
-- ======================
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '
-- Remap for esc
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- Toggle search highlight
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})


-- Window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Move oneline up/down
-- macOS version
vim.cmd("nnoremap ∆ :m .+1<CR>==")
vim.cmd("nnoremap ˚ :m .-2<CR>==")
vim.cmd("inoremap ∆ <Esc>:m .+1CR>==gi")
vim.cmd("inoremap ˚ <Esc>:m .-2<CR>==gi")
vim.cmd("vnoremap ∆ :m '>+1CR>gv=gv")
vim.cmd("vnoremap ˚ :m '>-2<CR>gv=gv")
-- Linux
vim.cmd("nnoremap <A-j> :m .+1<CR>==")
vim.cmd("nnoremap <A-k> :m .-2<CR>==")
vim.cmd("inoremap <A-j> <Esc>:m .+1CR>==gi")
vim.cmd("inoremap <A-k> <Esc>:m .-2<CR>==gi")
vim.cmd("vnoremap <A-j> :m '>+1CR>gv=gv")
vim.cmd("vnoremap <A-k> :m '>-2<CR>gv=gv")

-- Barbar
-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>c', ':BufferClose<CR>', {noremap = true, silent = true})

-- Navigation for code completion
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')


vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files theme=dropdown<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>r', ':Telescope live_grep theme=dropdown<CR>', {noremap = true, silent = true})


-- nvim-compe
vim.cmd('inoremap <silent><expr> <C-Space> compe#complete()')
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")

-- nvim-compe (s-)Tab to navigate omnicomplete menu,
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})



-- LSP
vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> K :Lspsaga hover_doc<CR>")
-- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>")
-- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')


-- FTerm
-- vim.api.nvim_set_keymap("n", '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>', {noremap = true, silent= true})
-- vim.api.nvim_set_keymap("t", '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', {noremap = true, silent= true})


-- =====================
--   Which-key menu
-- =====================
require("which-key").setup{
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
  },
  presets = {
    operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
    motions = true, -- adds help for motions
    text_objects = true, -- help for text objects triggered after entering an operator
    windows = true, -- default bindings on <c-w>
    nav = true, -- misc bindings to work with windows
    z = true, -- bindings for folds, spelling and others prefixed with z
    g = true, -- bindings for prefixed with g
  },
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local keymap = {
  ["/"] = "Comment",
  ["e"] = "Tree View",
  ["f"] = "Find File",
  ["r"] = "Live Grep",
  g = {
    name = "Git command",
    g = {"<cmd>LazyGit<CR>", "LazyGit"},
    j = {"<cmd>Gitsigns next_hunk<CR>", "Next Hunk"},
    k = {"<cmd>Gitsigns prev_hunk<CR>", "Previous Hunk"},
    p = {"<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk"},
    r = {"<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk"},
    R = {"<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer"},
    l = {"<cmd>Gitsigns blame_line<CR>", "Blame Current Line"},
    s = {"<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk"},
    S = {"<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer"},
    u = {"<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},
    o = {"<cmd>Telescope git_status theme=dropdown<CR>", "Changed Files List"},
    b = {"<cmd>Telescope git_branches theme=dropdown<CR>", "Checkout branch"},
    c = {"<cmd>Telescope git_commits theme=dropdown<CR>", "Checkout commits"},
    C = {"<cmd>Telescope git_bcommits theme=dropdown<CR>", "Checkout commits on current file"},
  },
  l = {
    name = 'LSP',
    a = {"<cmd>Lspsaga code_action<CR>", "Code Actions"},
    A = {"<cmd>Lspsaga range_code_action<CR>", "Selected Actions"},
    -- d = {"<cmd>Telescope lsp_document_diagnostics theme=dropdown<cr>", "Document Diagnostics"},
    d = {"<cmd>Telescope diagnostics theme=dropdown<cr>", "Workspace Diagnostics"},
    s = {"<cmd>Telescope lsp_document_symbols theme=dropdown<cr>", "Document Symbols"},
    S = {"<cmd>Telescope lsp_workspace_symbols theme=dropdown<cr>", "Workspace Symbols"},
    q = {"<cmd>Telescope quickfix theme=dropdown<cr>", "Quickfix"},
    x = {"<cmd>cclose<cr>", "Close Quickfix"},
    r = {"<cmd>Lspsaga rename<cr>", "Rename symbol"},
    p = {"<cmd>Lspsaga preview_definition<cr>", "Preview definition"},
    -- TODO: Fix the type definition and formatting call
    -- t = {"<cmd>lua vim.lsp.buf.type_definition<cr>", "Type definition"},
    f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
    i = {"<cmd>Lspsaga lsp_finder", "Lsp Finder"},
    -- L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line diagnostic"},
  }
}

local wk = require("which-key")
wk.register(keymap, opts)
