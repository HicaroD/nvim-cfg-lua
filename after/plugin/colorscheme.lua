function setColorscheme(colorscheme)
  vim.o.termguicolors = true
  local colorscheme_name = colorscheme or "vscode"
  vim.cmd("colorscheme " .. colorscheme_name)
end

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    disable_nvimtree_bg = true,
    color_overrides = {
      vscBack = "#181818"
    },

})
require('vscode').load()
setColorscheme("vscode")
