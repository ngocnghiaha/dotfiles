-- NOTE: setup nvim cmp with key mapping & customizing
local cmp = require('cmp')
local luasnip = require("luasnip")

local M = {}


local kind_icons = {
  Text = "",
  Method = "",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

-- local function border(hl_name)
--   return {
--     { "╭", hl_name },
--     { "─", hl_name },
--     { "╮", hl_name },
--     { "│", hl_name },
--     { "╯", hl_name },
--     { "─", hl_name },
--     { "╰", hl_name },
--     { "│", hl_name },
--   }
-- end

local function format(_, vim_item)
  vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
  return vim_item
end

local function autopairs_on_confirm(event)
  local itemKind = cmp.lsp.CompletionItemKind

  local function ls_name_from_event(ls_event)
    return ls_event.entry.source.source.client.config.name
  end

  local ok, ls_name = pcall(ls_name_from_event, event)
  if ok and vim.tbl_contains({ 'rust_analyzer' }, ls_name) then
    return
  end

  local completion_kind = event.entry:get_completion_item().kind
  if vim.tbl_contains({ itemKind.Function, itemKind.Method }, completion_kind) then
    local left = vim.api.nvim_replace_termcodes('<Left>', true, true, true)
    vim.api.nvim_feedkeys('()' .. left, 'n', false)
  end
end


local options = {
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered {
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
      scrollbar = false,
    },
    documentation = cmp.config.window.bordered {
    },
  },


  formatting = {
    format = format
  },

  mapping = {
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-Space>"] = cmp.mapping.complete(),

    ["<CR>"] = cmp.mapping.confirm(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 30, group_index = 1 },
    { name = 'luasnip',  max_item_count = 30, group_index = 2 },
    { name = 'buffer',   max_item_count = 30, group_index = 2 }
  })
}

M.setup = function()
  cmp.setup(options)

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
  })

  require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
      os.getenv("HOME") .. "/.config/nvim/neovim-snippets"
    }
  })
  cmp.event:on('confirm_done', autopairs_on_confirm)
end


return M
