local utils = require("hicaro.utils")

local ok = utils.prequire("colorizer")
if not ok then
  print("Unable to import colorizer module")
  return
end

local colorizer = require("colorizer")

colorizer.setup({
  "css",
  "javascript",
  html = {
    mode = "foreground",
  },
})
