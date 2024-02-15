local utils = require("hicaro.utils")

local ok = utils.prequire("lualine")
if not ok then
  print("Unable to import lualine module")
  return
end

local lualine = require("lualine")
lualine.setup({
  options = {
    component_separators = "┃",
    section_separators = "",
  },
  sections = {
    lualine_a = {
      {
        "filename",
        file_status = true,
        path = 1,
      },
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_workspace_diagnostic", "coc" },
        update_in_insert = false,
      },
    },
  },
})
