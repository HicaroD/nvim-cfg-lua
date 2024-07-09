return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    local utils = require("hicaro.utils")

    local completion = require("mini.completion")
    completion.setup()
  end,
}
