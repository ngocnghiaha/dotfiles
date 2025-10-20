-- Credits to original https://github.com/one-dark
-- This is modified version of it

local M = {}


M.base_16 = {
  base00 = "#1a1b26",
  base01 = "#27293a",
  base02 = "#34364c",
  base03 = "#40435e",
  base04 = "#4c4f70",
  base05 = "#b0b2c9",
  base06 = "#c2c4d6",
  base07 = "#d5d6e2",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
  base0F = "#be5046",
}

M.base_30 = {
  white = M.base_16.base05,
  darker_black = "#171821",
  black = M.base_16.base00, --  nvim bg
  black2 = "#1f202e",
  one_bg = "#232434", -- real bg of onedark
  one_bg2 = M.base_16.base01,
  one_bg3 = "#2d2f43",
  grey = "#3a3c55",
  grey_fg = M.base_16.base04,
  grey_fg2 = "#515476",
  light_grey = "#515476",
  red = "#e06c75",
  baby_pink = "#DE8C92",
  pink = "#ff75a0",
  line = "#252737", -- for lines like vertsplit
  green = "#98c379",
  vibrant_green = "#7eca9c",
  nord_blue = "#81A1C1",
  blue = "#61afef",
  yellow = "#e7c787",
  sun = "#EBCB8B",
  purple = "#de98fd",
  dark_purple = "#c882e7",
  teal = "#519ABA",
  orange = "#fca2aa",
  cyan = "#a3b8ef",
  statusline_bg = "#1d1e2a",
  lightbg = "#212231",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
}



M.type = "dark"

return M
