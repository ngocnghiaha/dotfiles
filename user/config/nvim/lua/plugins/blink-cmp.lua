return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = { preset = "enter" },
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      }
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true
        }
      },
      documentation = {
        window = { border = "rounded" },
        auto_show = true
      },
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "label",     gap = 10 },
            { "kind_icon", gap = 1 },
            { "kind" }
          },
          gap = 1,
          treesitter = { "lsp" }
        }
      }
    }
  }
}
