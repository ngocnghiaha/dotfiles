local M = {}

local colors = require('base46').get_theme_tb("base_30")

local lualine_theme = {
  inactive = {
    a = { fg = colors.grey_fg, bg = colors.black, gui = 'bold' },
    b = { fg = colors.grey_fg, bg = colors.black },
    c = { fg = colors.grey_fg, bg = colors.black },
  },
  normal = {
    a = { fg = colors.black, bg = colors.green, gui = 'bold' },
    b = { fg = colors.green, bg = colors.grey },
    c = { fg = colors.white, bg = colors.one_bg },
  },
  visual = {
    a = { fg = colors.black, bg = colors.purple, gui = 'bold' },
    b = { fg = colors.purple, bg = colors.grey }
  },
  replace = {
    a = { fg = colors.black, bg = colors.red, gui = 'bold' },
    b = { fg = colors.red, bg = colors.grey }
  },
  insert = {
    a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.blue, bg = colors.grey }
  },
  command = {
    a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.yellow, bg = colors.grey }
  },
  terminal = {
    a = { fg = colors.black, bg = colors.cyan, gui = 'bold' },
    b = { fg = colors.cyan, bg = colors.grey }
  },
}

M.setup = function()
  require('lualine').setup {
    options = {
      theme = lualine_theme,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' }
    },
  }
end

return M
