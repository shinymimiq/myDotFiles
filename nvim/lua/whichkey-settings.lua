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
    j = {"<cmd>Gitsigns next_hunk<CR>", "Next Hunk"},
    k = {"<cmd>Gitsigns prev_hunk<CR>", "Previous Hunk"},
    p = {"<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk"},
    r = {"<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk"},
    R = {"<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer"},
    l = {"<cmd>Gitsigns blame_line<CR>", "Blame Current Line"},
    s = {"<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk"},
    S = {"<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer"},
    u = {"<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk"},
    o = {"<cmd>Telescope git_status theme=get_dropdown<CR>", "Changed Files List"},
    b = {"<cmd>Telescope git_branches theme=get_dropdown<CR>", "Checkout branch"},
    c = {"<cmd>Telescope git_commits theme=get_dropdown<CR>", "Checkout commits"},
    C = {"<cmd>Telescope git_bcommits theme=get_dropdown<CR>", "Checkout commits on current file"},
  }
}

local wk = require("which-key")
wk.register(keymap, opts)
