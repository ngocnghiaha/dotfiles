local base30 = require("base46").get_theme_tb "base_30"

return {
  ["@lsp.type.formatSpecifier"] = { fg = base30.purple },
  ["@punctuation.special"] = { fg = base30.purple },
  Comment = { fg = base30.grey_fg, italic = true },
  ["@comment"] = { link = "Comment" },
  ["@lsp.type.comment"] = { link = "Comment" },
}
