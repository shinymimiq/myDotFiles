-- Plugin configuration: galaxyline
-- =============================================================================

-- =============================================================================
--                              Helper functions
-- =============================================================================

local cursor_position = function()
  local current_line = vim.fn.line('.')
  local current_col = vim.fn.virtcol('.')
  return current_line .. ':' .. current_col
end

local cursor_position_perc = function()
  local current_line = vim.fn.line('.')
  local num_lines = vim.fn.line('$')

  if current_line == 1 then
    return 'Top'
  elseif current_line == num_lines then
    return 'Bot'
  else
    local perc = math.floor(current_line / num_lines * 100)
    return string.format("%2d",  perc) .. '%'
  end
end

local check_width = function()
  if vim.fn.winwidth(0) > 80 then
    return true
  end
  return false
end

-- =============================================================================
--                          galaxyline configuration
-- =============================================================================

local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

-- Color definition
-- -----------------------------------------------------------------------------
-- built-in theme
local colors = require('galaxyline.theme').default

-- Map that convert mode identification (see `:help modes()`) to a name and
-- color.
local mode_map = {
  ['n']  = {'NORMAL',   colors.blue},
  ['i']  = {'INSERT',   colors.green},
  ['R']  = {'REPLACE',  colors.red},
  ['v']  = {'VISUAL',   colors.magenta},
  ['V']  = {'V-LINE',   colors.magenta},
  [''] = {'V-BLOCK',  colors.violet},
  ['s']  = {'SELECT',   colors.yellow},
  ['S']  = {'S-LINE',   colors.orange},
  [''] = {'S-BLOCK',  colors.dark_yellow},
  ['c']  = {'COMMAND',  colors.orange},
  ['t']  = {'TERMINAL', colors.grey},
  ['Rv'] = {'VIRTUAL',  colors.red},
  ['rm'] = {'--MORE',   colors.cyan},
  -- Fallback mode.
  ['fallback'] = {'UNKNOWN', colors.blue}
}

-- Return the highlight color of the current mode.
local function mode_hl()
  local mode = mode_map[vim.fn.mode()]

  -- Fallback color is a mode is not available in `mode_map`.
  if mode == nil then
    mode = mode_map['n']
    return mode[2]
  end
  return mode[2]
end

-- Return the current mode name.
local function mode_name()
  local mode = mode_map[vim.fn.mode()]

  -- Fallback if a mode is not available in `mode_map`.
  if mode == nil then
    str = mode_map['n'][1]
  else
    str = mode[1]
  end

  -- Make the string size constant.
  local mode_len = string.len(str)
  local delta = math.floor((8 - mode_len)/2)
  local str = string.rep(" ", delta) .. str .. string.rep(" ", 8 - mode_len - delta)
  return str
end

--                                 Left part
-- -----------------------------------------------------------------------------

-- Vim mode
-- --------

table.insert(gls.left, {
  ViMode = {
    provider = function()
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_hl())
      return '' .. mode_name()
    end,
    highlight = {colors.fg, colors.section_bg},
  }
})

-- Macros
-- ------

table.insert(gls.left, {
  Macro = {
    provider = function()
      local reg = vim.fn.reg_recording()

      if (reg == nil) or (reg == '') then
        return ''
      else
        return '   ' .. vim.call('reg_recording')
      end
    end,
    highlight = {colors.red, colors.section_bg},
  }
})

-- File icon
-- ---------

table.insert(gls.left, {
  FileIcon = {
    provider = {
      function() return '  ' end,
      'FileIcon'
    },
    condition = condition.buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon,
      colors.section_bg
    }
  }
})

-- File name
-- ---------

table.insert(gls.left, {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.section_bg}
  },
})

-- Section separator
-- -----------------

table.insert(gls.left, {
  SectionSeparatorMarker = {
    provider = function() return '' end,
    highlight = {colors.section_bg, colors.bg},
  },
})

table.insert(gls.left,{
  SectionSeparator = {
    provider = function() return ' ' end,
    highlight = {colors.fg, colors.bg},
  },
})

--                                 Middle part
-- -----------------------------------------------------------------------------

-- Git status
-- ----------

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return '  '
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.orange, colors.bg},
    separator = ' ',
    separator_highlight = {colors.orange, colors.bg},
  }
})

table.insert(gls.left, {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.fg, colors.bg, 'bold'},
    separator = ' ',
    separator_highlight = {colors.orange, colors.bg},
  }
})

table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    highlight = {colors.green, colors.bg},
    icon = '+',
  }
})

table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    highlight = {colors.orange, colors.bg},
    icon = '~',
  }
})

table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    highlight = {colors.red, colors.bg},
    icon = '-',
  }
})

--                                 Right part
-- -----------------------------------------------------------------------------
table.insert(gls.right, {
    DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.error_red, colors.bg}}
})
table.insert(gls.right, {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.orange, colors.bg}}})

table.insert(gls.right, {
    DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {colors.vivid_blue, colors.bg}}
})

table.insert(gls.right, {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.info_yellow, colors.bg}}})

table.insert(gls.right, {
    TreesitterIcon = {
        provider = function()
            if next(vim.treesitter.highlighter.active) ~= nil then return ' ' end
            return ''
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.green, colors.bg}
    }
})

table.insert(gls.right, {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = '  ',
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
})

table.insert(gls.right, {
    Space = {
        provider = function()
            return ' '
        end,
--        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
})

table.insert(gls.right, {
  FileEncode = {
    provider = {
      'FileEncode',
      function() return ' ' end
    },
    highlight = {colors.fg, colors.bg},
    separator = '|',
    separator_highlight = {colors.fg, colors.bg}
  }
})

table.insert(gls.right, {
  Separator = {
    provider = function() return '' end,
    highlight = {colors.section_bg, colors.bg},
  }
})

table.insert(gls.right, {
  CursorPerc = {
    provider = {
      cursor_position_perc,
      function() return ' ' end
    },
    highlight = {colors.fg, colors.section_bg},
    separator = ' ',
    separator_highlight = {colors.fg, colors.section_bg}
  }
})

--                                 Short line
-- -----------------------------------------------------------------------------

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

-- Separator
-- ---------

gls.short_line_left[1] = {
  ShortLineSeparator = {
    provider = function() return ' ' end,
    highlight = {colors.section_bg, colors.section_bg},
  }
}

-- File type name
-- --------------

gls.short_line_left[2] = {
  ShortLineFileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.section_bg},
    separator = '',
    separator_highlight = {colors.section_bg, colors.bg}
  },
}

-- Buffer icon
-- -----------

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.fg, colors.bg}
  }
}

