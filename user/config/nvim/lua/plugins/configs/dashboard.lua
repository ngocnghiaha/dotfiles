local M = {}

--[[
require('dashboard').setup ({
	theme = 'hyper',
	config = {
		week_header = {
			enable = true,
		},

		shortcut = {
			{
				desc = ' New',
				group = 'Identifier',
				action = 'bd',
				key = 'N',
			},
			{
				desc = ' Files',
				group = 'Question',
				action = 'Telescope find_files',
				key = 'F',
			},
			{
				desc = ' Grep',
				group = 'PreProc',
				action = 'Telescope live_grep',
				key = 'G',
			},
			{
				desc = ' Oldfiles',
				group = 'DiagnosticInfo',
				action = 'Telescope oldfiles',
				key = 'O',
			},
			{
				desc = ' Lazy',
				group = 'DiagnosticHint',
				action = 'Lazy',
				key = 'L',
			},
			{
				desc = ' Config',
				group = 'DiagnosticWarn',
				action = 'NvimTreeToggle ~/.config/nvim',
				key = 'C',
			},
			{
				desc = ' Quit',
				group = 'DiagnosticError',
				action = 'qa',
				key = 'Q',
			},
		},
		project = { limit = 3},
		mru = { limit = 5},
	},
})
--]]

local lazy_footer = function()
  local stats = require("lazy").stats()
  local ms = math.floor(stats.startuptime)
  local footer = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
  return footer
end

local options = {
  theme = 'doom',
  config = {
    week_header = {
      enable = true,
    },
    center = {
      {
        icon = '  ',
        desc = 'New file                                      ',
        key = 'n',
        action = 'bd'
      },
      {
        icon = '  ',
        desc = 'Find file                                     ',
        key = 'f',
        action = 'Telescope find_files'
      },
      {
        icon = '  ',
        desc = 'Find word (grep)                              ',
        key = 'g',
        action = 'Telescope live_grep'
      },
      {
        icon = '  ',
        desc = 'File browser                                  ',
        key = 'b',
        action = 'Telescope file_browser'
      },
      {
        icon = '  ',
        desc = 'Lazy (plugin manager)                         ',
        key = 'l',
        action = 'Lazy'
      },
      {
        icon = '  ',
        desc = 'Neovim configuration                          ',
        key = 'c',
        action = 'NvimTreeToggle ~/.config/nvim'
      },
      {
        icon = '  ',
        desc = 'Quit                                          ',
        key = 'q',
        action = 'qa'
      },
    },
    footer = {},
  }
}

M.setup = function()
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      options.config.footer = { lazy_footer() }
      require("dashboard").setup(options)
    end
  })
end

return M
