function setupVscode()
  local c = require('vscode.colors').get_colors()
  require('vscode').setup({
    disable_nvimtree_bg = true,
    color_overrides = {
      vscBack = "#181818"
    },
  })
  require("vscode").load()
end

function setColorscheme(colorscheme)
  vim.o.termguicolors = true
  local colorscheme_name = colorscheme or "vscode"

  if colorscheme == "vscode" then
    setupVscode()
  end
  vim.cmd("colorscheme " .. colorscheme_name)
end

setColorscheme("vscode")
