-- NOTE: key mapping

local api = vim.api
local wk = require("which-key")

local M = {}

M.setup = function()
  local mappings = require("core.mappings")
  wk.register(mappings.file_actions.mappings, mappings.file_actions.options)
  wk.register(mappings.utilities.mappings, mappings.utilities.options)

  api.nvim_create_autocmd("LspAttach", {
    group = api.nvim_create_augroup("UserLspMapping", {}),
    callback = function(ev)
      mappings.lsp.options.buffer = ev.buf
      wk.register(mappings.lsp.mappings, mappings.lsp.options)
    end,
  })
end

return M
