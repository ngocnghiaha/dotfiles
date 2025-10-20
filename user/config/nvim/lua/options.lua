-- NOTE: vim options and global variables

local opt = vim.opt
local g = vim.g
local diagnostic = vim.diagnostic

opt.number = true
opt.swapfile = false
opt.backup = false
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
-- opt.mouse = 'a'
-- opt.tabstop = 4
-- opt.shiftwidth = 4
-- opt.splitbelow = true
-- opt.splitright = true
-- opt.signcolumn = "yes"
-- opt.laststatus = 3
-- opt.splitkeep = "screen"
-- opt.mousemoveevent = true
opt.confirm = true
-- folding
opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.fillchars:append({ eob = " " })
-- g.loaded_netrwPlugin = 1
-- g.loaded_netrw = 1
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
diagnostic.config({
  virtual_text = { prefix = '󱓻 ' },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = "󰋼 ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  }
})

vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "gopls"
})

