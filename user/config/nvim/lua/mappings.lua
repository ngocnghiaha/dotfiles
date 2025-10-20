local api = vim.api
local lsp_buf = vim.lsp.buf
local diagnostic = vim.diagnostic
local map = vim.keymap.set

map({ "n", "v", "s" }, "<C-c>", "\"+y", { desc = "Copy" })
map({ "n", "v", "s" }, "<C-v>", "\"+p", { desc = "Paste" })
--
api.nvim_create_autocmd("LspAttach", {
  group = api.nvim_create_augroup("UserLspMapping", {}),
  callback = function(ev)
    local buf = ev.buf
    map({ "n" }, 'gD', lsp_buf.declaration, { buffer = buf, desc = "Declaration" })
    map({ "n" }, 'gd', lsp_buf.definition, { buffer = buf, desc = "Definition" })
    -- map({ "n" }, 'K', lsp_buf.hover, { buffer = buf, desc = "Hover document" })
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
  end,
})
