local lsp_buf = vim.lsp.buf
local diagnostic = vim.diagnostic
local telescope_builtin = require("telescope.builtin")
local telescope_extensions = require("telescope").extensions
local map = vim.keymap.set

local M = {}

M.general = function()
  map({ "n" }, "<leader>ff", telescope_builtin.find_files, { desc = "Find file" })
  map({ "n" }, "<leader>fo", telescope_builtin.oldfiles, { desc = "Old file" })
  map({ "n" }, "<leader>fg", telescope_builtin.live_grep, { desc = "Grep file" })
  map({ "n" }, "<leader>fb", telescope_extensions.file_browser.file_browser, { desc = "File browser" })
  map({ "n" }, "<leader>fe", "<CMD>Neotree toggle<CR>", { desc = "File explorer" })

  map({ "n", "v", "s" }, "<C-c>", "\"+y", { desc = "Copy" })
  map({ "n", "v", "s" }, "<C-v>", "\"+p", { desc = "Paste" })
  map({ "n", "v", "s" }, "<F6>", "<CMD>ToggleTerm<CR>", { desc = "Terminal" })
end

M.lsp = function(args)
  local buf = args.buf
  map({ "n" }, 'gD', lsp_buf.declaration, { buffer = buf, desc = "Declaration" })
  map({ "n" }, 'gd', lsp_buf.definition, { buffer = buf, desc = "Definition" })
  map({ "n" }, 'K', lsp_buf.hover, { buffer = buf, desc = "Hover document" })
  map({ "n" }, 'gi', lsp_buf.implementation, { buffer = buf, desc = "Implementation" })
  map({ "n" }, '<C-k>', lsp_buf.signature_help, { buffer = buf, desc = "Signature help" })

  map({ "n" }, '<space>wa', lsp_buf.add_workspace_folder, { buffer = buf, desc = "Add workspace folder" })
  map({ "n" }, '<space>wr', lsp_buf.remove_workspace_folder, { buffer = buf, desc = "Remove workspace folder" })
  map({ "n" }, '<space>wl', function()
    print(vim.inspect(lsp_buf.list_workspace_folders()))
  end, { buffer = buf, desc = "List workspace folder" })

  map({ "n" }, '<space>D', lsp_buf.type_definition, { buffer = buf, desc = "Type definition" })
  map({ "n" }, '<space>rn', lsp_buf.rename, { buffer = buf, desc = "Rename" })
  map({ "n" }, '<space>ca', lsp_buf.code_action, { buffer = buf, desc = "Code action" })
  map({ "n" }, '<space>gr', lsp_buf.references, { buffer = buf, desc = "References" })
  map({ "n" }, '<space>e', diagnostic.open_float, { buffer = buf, desc = "Diagnostic open" })
  map({ "n" }, '<space>f', function()
    lsp_buf.format({ async = true })
  end, { buffer = buf, desc = "Format" })
end

return M
