vim.g.dashboard_default_executive = "telescope"
vim.cmd 'let g:dashboard_session_directory = "~/.config/nvim/.sessions"'
vim.cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")

local db = require('dashboard')
db.custom_header= {
"⠀⠀⠀⠀⠀⠀⣀⣤⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
"⠀⠀⠀⠀⢀⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
"⠀⠀⠀⣠⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⢸⠛⠉⢹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠄⠠⣀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⡘⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⠉⠀⠀⠀⣾⣿⣦⡀⠀⠀⠀⠀⠀",
"⠀⠀⡇⠀⠀⠀⢡⠄⠀⠀⣀⣀⣀⣠⠊⠀⠀⠀⠀⡠⠞⠛⠛⠛⠛⠀⠀⠀⠀⠀",
"⠀⠀⢃⠀⠀⠀⠀⠗⠚⠉⠉⠀⠈⠁⠀⠀⠀⢀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣄⠲⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠃⠀⠀⢠⣤⡀⠀⠀⠀⠀⣿⣿⣿⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⡆⠀⠀⣿⣿⡇⠀⠀⠀⠀⠈⠛⠉⣴⣆⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⣇⢰⡧⣉⡉⠀⠀⢀⡀⠀⣀⣀⣠⣿⡷⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⢻⠘⠃⠈⠻⢦⠞⠋⠙⠺⠋⠉⠉⠉⢡⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠳⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀",
"⠀⠀⠀⠀⠀⠀⠈⠁⢲⡄⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⣀⣤⣴⣶⣿⣿⣿⣿⡇",
"⠀⠀⠀⠀⠀⠀⠀⡰⠋⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃",
"⠀⠀⠀⠀⠀⢀⡞⠁⠀⠀⣾⠀⠀⣶⠀⠀⠀⢸⣦⣴⣿⣿⣿⠛⠉⠉⠉⠉⠁⠀",
"⠀⠀⢀⣀⡰⠏⠀⠀⠀⠀⠉⠀⠈⠋⠀⠀⠀⠘⣿⣿⣿⠛⠋⠀⠀⠀⠀⠀⠀⠀",
"⠰⣮⣉⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⡋⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠈⠉⠻⠥⠤⢤⣶⢄⠀⢀⣠⣄⠀⠀⢠⣶⣤⣄⠈⠑⡄⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠈⠋⠁⠠⠁⠀⠈⠁⠀⠀⠀⠀⠀     ⠀",
}

db.custom_center = {
  { icon = '  ', desc = 'Recently Opened Files     ', action = 'Telescope oldfiles theme=dropdown', shortcut = ''},
  { icon = '  ', desc = 'Find File                 ', action = 'Telescope find_files theme=dropdown', shortcut = ''},
  { icon = '  ', desc = 'Find Word                 ', action = 'Telescope live_grep theme=dropdown', shortcut = ''},
  -- { icon = '  ', desc = 'Open Neovim Configuration ', action = ':e ~/.config/nvim/init.lua'},
  { icon = '  ', desc = 'Open MyDotFiles           ', action = ':cd ~/Developer/myDotFiles |:e ~/Developer/myDotFiles/nvim/init.lua | :NvimTreeToggle'},
  { icon = '  ', desc = 'Load last Session         ', action = 'SessionManager load_last_session'},
}

db.session_directory ="~/.config/nvim/.sessions" 
db.hide_statusline = true
