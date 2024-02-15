local utils = require("hicaro.utils")

local ok = utils.prequire("bufferline")
if not ok then
  print("Unable to import bufferline module")
  return
end

local bufferline = require("bufferline")
bufferline.setup({
  options = {
    theme = "vscode",
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "Directory",
        text_align = "center",
        separator = true,
      },
    },
  },
  highlights = {
    buffer_selected = { italic = false, bold = true },
  },
})
