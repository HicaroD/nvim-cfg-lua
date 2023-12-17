local utils = require("hicaro.utils")

local ok = utils.prequire("bufferline")
if not ok then
  print("Unable to import bufferline module")
  return
end

local bufferline = require("bufferline")
bufferline.setup({})
