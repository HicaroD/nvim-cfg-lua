local utils = require("hicaro.utils")

  local ok = utils.prequire("bufdel")
  if not ok then
    print("Unable to import bufdel module")
    return
  end

  local bufdel = require("bufdel")
  bufdel.setup({
    quit = false,
  })
