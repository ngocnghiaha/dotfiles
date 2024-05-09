-- NOTE: vim options and global variables

local opt = vim.opt

opt.number = true
opt.swapfile = false
opt.backup = false
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'
opt.tabstop = 4
opt.shiftwidth = 4
opt.splitbelow = true
opt.splitright = true
opt.signcolumn = "yes"
opt.laststatus = 3
opt.splitkeep = "screen"
opt.mousemoveevent = true
-- folding
opt.foldenable = false
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.fillchars:append({ eob = " " })
vim.g.indent_blankline_filetype_exclude = { 'dashboard' }
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.confirm = true
