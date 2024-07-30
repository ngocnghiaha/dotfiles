-- NOTE: key mapping

local api = vim.api
local wk = require("which-key")
local mappings = require("core.mappings")

local M = {}

M.setup = function()
  mappings.general()
  api.nvim_create_autocmd("LspAttach", {
    group = api.nvim_create_augroup("UserLspMapping", {}),
    callback = function(ev)
      mappings.lsp(ev)
    end,
  })
end

return M
