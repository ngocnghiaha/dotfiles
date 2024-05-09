-- NOTE: lsp configurations
local fn = vim.fn
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local M = {}

-- local signs = { Error = '', Warn = '', Hint = '󰌵', Info = '' }
local signs = { Error = '', Warn = '', Hint = '󰌶', Info = '' }

local general_others_on_attach = function(_, bufnr)
  vim.bo[bufnr].tabstop = 2
  vim.bo[bufnr].shiftwidth = 2
  vim.bo[bufnr].expandtab = true
end


M.setup = function()
  vim.diagnostic.config({
    float = { border = "rounded" },
    virtual_text = { prefix = '󱓻 ' }
  })

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- LSP settings (for overriding per client)
  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
  }

  lsp.lua_ls.setup {
    handlers = handlers,
    on_attach = general_others_on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
        workspace = {
          library = {
            [fn.expand "$VIMRUNTIME/lua"] = true,
            [fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
        },
      }
    }
  }

  lsp.rust_analyzer.setup {
    handlers = handlers,
    capabilities = capabilities
  }
end

return M
