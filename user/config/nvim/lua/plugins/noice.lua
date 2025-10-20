return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- lsp = {
    --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --   override = {
    --     ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
    --     ['vim.lsp.util.stylize_markdown'] = true,
    --     ['cmp.entry.get_documentation'] = true,
    --   },
    -- },
    presets = {
      lsp_doc_border = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  -- config = function(_, opts)
  --   require('noice').setup(opts)
  -- end
}
