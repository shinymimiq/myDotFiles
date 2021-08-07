vim.g.dashboard_default_executive = "telescope"
vim.cmd 'let g:dashboard_session_directory = "~/.config/nvim/.sessions"'
vim.cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")
vim.api.nvim_exec([[
    let g:dashboard_custom_footer = ['LuaJIT loaded '..packages..' packages']
]], false)
vim.g.dashboard_custom_section = {
    -- a = {description = {'  Reload Last Session      '}, command = 'SessionLoad'},
    b = {description = {'  Recently Opened Files    '}, command = 'Telescope oldfiles'},
    -- c = {description = {'  Open Project             '}, command = 'Telescope marks'},
    -- d = {description = {'  Jump to Bookmark         '}, command = 'Telescope project'},
    e = {description = {'  Find File                '}, command = 'Telescope find_files'},
    f = {description = {'  Find Word                '}, command = 'Telescope live_grep'},
    g = {description = {'  Open Neovim Configuration'}, command = ':e ~/.config/nvim/init.lua'},
}

vim.g.dashboard_custom_header = {
    "          ▀████▀▄▄              ▄█ ",
    "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
    "    ▄        █          ▀▀▀▀▄  ▄▀  ",
    "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
    "  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
    "  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
    "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
    "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
    "   █   █  █      ▄▄           ▄▀   ",
}
