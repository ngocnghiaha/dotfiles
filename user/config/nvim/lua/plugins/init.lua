-- NOTE: load neovim plugins

local M = {}

local plugins = {
  -- plugin manager
  'folke/lazy.nvim',
  -- theme + UI
  'folke/tokyonight.nvim',
  'rcarriga/nvim-notify',
  'MunifTanjim/nui.nvim',
  'folke/noice.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'stevearc/dressing.nvim',
  'folke/edgy.nvim',
  'akinsho/bufferline.nvim',
  -- autopairs
  'windwp/nvim-autopairs',
  {
    'altermo/ultimate-autopair.nvim',
    branch = 'v0.6',
  },
  -- auto-complete
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  -- lsp
  'neovim/nvim-lspconfig',
  'folke/trouble.nvim',
  'glepnir/lspsaga.nvim',
  -- indent-blankline
  'lukas-reineke/indent-blankline.nvim',
  -- file browser
  "nvim-neo-tree/neo-tree.nvim",
  'nvim-tree/nvim-tree.lua',
  -- find file
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  -- tree-sitter
  'nvim-treesitter/nvim-treesitter',
  'RRethy/vim-illuminate',
  -- terminal
  'akinsho/toggleterm.nvim',
  -- commment and commment visualization
  'numToStr/Comment.nvim',
  'folke/todo-comments.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  -- dashboard
  'glepnir/dashboard-nvim',
  -- 'goolord/alpha-nvim',
  -- git
  'lewis6991/gitsigns.nvim',
  -- key bindings support
  'folke/which-key.nvim',
  -- color for css
  'NvChad/nvim-colorizer.lua',
  -- clipboard manager
  'AckslD/nvim-neoclip.lua',
}

local plugin_configs = {
  "which-key",
  "lsp",
  "lualine",
  "cmp",
  "dashboard",
  -- "others"
}

M.load_configs = function()
  local config_path = "plugins.configs"

  for _, value in pairs(plugin_configs) do
    require(config_path .. '.' .. value).setup()
  end
  require(config_path .. '.' .. "others")
end

M.setup = function()
  -- setup plugin path
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- load plugins
  require("lazy").setup(plugins)
  require("nvim-tree").setup()

  -- load theme
  vim.g.theme = "onedark-deep"
  -- load configs
  M.load_configs()
end

return M
