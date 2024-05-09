local M = {}

local theme_integration = {
  'blankline',
  'bufferline',
  'cmp',
  'codeactionmenu',
  'dashboard',
  'defaults',
  'devicons',
  'float-window',
  'git',
  'lsp',
  'lspsaga',
  'noice',
  'notify',
  'semantic_tokens',
  'syntax',
  'telescope',
  'todo',
  'treesitter',
  'trouble',
  'vim-illuminate',
  'whichkey',
  'custom'

}

M.get_theme_tb = function(base_color)
  local theme_name = vim.g.theme or "onedark-deep"
  local theme_path = "base46.themes." .. theme_name
  return require(theme_path)[base_color]
end

M.load_theme = function()
  local hl = vim.api.nvim_set_hl

  for _, name in pairs(theme_integration) do
    local highlight = require("base46.integrations." .. name)
    for key, value in pairs(highlight) do
      hl(0, key, value)
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
