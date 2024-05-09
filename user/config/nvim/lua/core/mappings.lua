local lsp_buf = vim.lsp.buf
local diagnostic = vim.diagnostic
local telescope_builtin = require("telescope.builtin")
local telescope_extensions = require("telescope").extensions

local M = {}

M.file_actions = {
  mappings = {
    f = {
      name = "File",
      f = { telescope_builtin.find_files, "Find file" },
      o = { telescope_builtin.oldfiles, "Old file" },
      g = { telescope_builtin.live_grep, "Grep file" },
      b = { telescope_extensions.file_browser.file_browser, "File browser" },
      e = { "<CMD>Neotree toggle<CR>", "File explore" },
    },
    p = { '<cmd>%!prettier --stdin-filepath %<cr>', "Prettier formatting" },
  },
  options = {
    mode = 'n',
    prefix = "<leader>",
  }
}

M.utilities = {
  mappings = {
    ["<C-c>"] = { "\"+y", "Copy" },
    ["<C-v>"] = { "\"+p", "Paste" },
    ["<F6>"] = { '<CMD>ToggleTerm<CR>', "Terminal" }
  },
  options = {
    mode = { 'n', 'v', 's' }
  }
}

M.lsp = {
  mappings = {
    gD = { lsp_buf.declaration, "Declaration" },
    gd = { lsp_buf.definition, "Definition" },
    K = { lsp_buf.hover, "Hover document" },
    gi = { lsp_buf.implementation, "Implementation" },
    ["<C-k>"] = { lsp_buf.signature_help, "Signature help" },

    ["<space>"] = {
      w = {
        name = "Workspace",
        a = { lsp_buf.add_workspace_folder, "Add workspace folder" },
        r = { lsp_buf.remove_workspace_folder, "Remove workspace folder" },
        l = {
          function()
            print(vim.inspect(lsp_buf.list_workspace_folders()))
          end,
          "List workspace folder"
        }
      },
      D = { lsp_buf.type_definition, "Type definition" },
      rn = { lsp_buf.rename, "Rename" },
      ca = { lsp_buf.code_action, "Code action" },
      gr = { lsp_buf.references, "References" },
      f = {
        function()
          lsp_buf.format { async = true }
        end,
        "Format"
      },
      e = { diagnostic.open_float, "Diagnostic open" }

    }
  },

  options = {
    mode = { 'n' },
    buffer = nil
  }
}

return M
