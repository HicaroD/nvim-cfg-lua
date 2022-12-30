--[[---------------------------------------]]--
--       	  colorscheme       	     --
--              Author: HícaroD              --
--[[---------------------------------------]]--

local colorscheme = "gruvbox"

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

local status_ok, gruvbox = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
