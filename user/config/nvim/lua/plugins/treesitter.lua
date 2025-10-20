return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "c",
      "go",
      "lua",
      "rust",
      "vimdoc",
      "python"
    },
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
