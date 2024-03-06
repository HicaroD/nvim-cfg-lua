return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
      globalstatus = true,
        component_separators = "│",
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
            sources = { "nvim_workspace_diagnostic" },
            update_in_insert = false,
          },
        },
      },
    })
  end,
}
