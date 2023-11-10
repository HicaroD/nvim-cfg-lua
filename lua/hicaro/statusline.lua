local utils = require("hicaro.utils")

local ok = utils.prequire("lualine")
if not ok then
  print("Unable to import Lualine module")
  return
end

local lualine = require("lualine")
lualine.setup({
  sections = {
    lualine_a = {
      {
        "diagnostics",
        update_in_insert = true,
      },
    },
  },
})
