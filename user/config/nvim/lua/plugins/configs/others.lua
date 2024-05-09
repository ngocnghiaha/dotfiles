-- NOTE: others plugins

require("noice").setup()
require("todo-comments").setup {}
require("trouble").setup {}
require('gitsigns').setup()
require('Comment').setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
})
require("edgy").setup()
require("toggleterm").setup()
require 'ultimate-autopair'.setup()
require("ibl").setup {
  indent = {
    char = '┊'
  },
  exclude = {
    filetypes = { "dashboard" }
  },
  scope = {
    enabled = true,
    include = {
      node_type = {
        ["*"] = { "*" }
      },
    },
    show_start = false,
    show_end = false,
  }
}

require("bufferline").setup {
  options = {
    right_mouse_command = false,
    indicator = {
      style = 'none'
    },
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        separator = true
      }
    },
    separator_style = { '', '' },
    hover = {
      enabled = true,
      delay = 100,
      reveal = { 'close' }
    },
  }
}
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "vimdoc",
    "rust",
    "python",
    "nix"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
require 'colorizer'.setup()
require("lspsaga").setup {}
require('illuminate').configure({
  providers = {
    'lsp',
    'treesitter',
  },
})
require('telescope').load_extension("neoclip")
require('neoclip').setup()
