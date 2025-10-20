local M = {}

M.get_theme_tb = function(base_color)
  local theme_path = "base46.themes." .. vim.g.theme
  return require(theme_path)[base_color]
end

M.load_theme = function()
  local hl = vim.api.nvim_set_hl
  local theme = require("base46.themes." .. vim.g.theme)
  local handle = vim.uv.fs_scandir(vim.fn.stdpath('config') .. '/lua/base46/integrations')
  local name, type
  local module_name

  if not handle then return end

  while true do
    name, type = vim.uv.fs_scandir_next(handle)
    if not name then break end
    if type == 'file' and name:match('%.lua$') then
      module_name = 'base46.integrations.' .. vim.fn.fnamemodify(name, ":t:r")
      local ok, result = pcall(require, module_name)
      if ok then
        for key, value in pairs(result) do
          hl(0, key, value)
        end
      end
    end
  end

  if theme.polish_hl then
    for _, highlight in pairs(theme.polish_hl) do
      for key, value in pairs(highlight) do
        hl(0, key, value)
      end
    end
  end
end

M.setup = function()
  vim.g.theme = vim.g.theme or "onedark-deep"
  vim.cmd('hi clear')

  vim.o.background = 'dark'
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  M.load_theme()
end

return M
