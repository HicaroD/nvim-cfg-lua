function setupVscode(transparent)
  local c = require('vscode.colors').get_colors()
  require('vscode').setup({
    disable_nvimtree_bg = true,
    transparent = transparent,
    color_overrides = {
      vscBack = "#181818"
    },
  })
  require("vscode").load()
end

function setColorscheme(args)
  vim.o.termguicolors = true

  local colorscheme = args.name
  local transparent = args.transparent

  if colorscheme == "vscode" then
    setupVscode(transparent)
  else
    vim.cmd("colorscheme " .. colorscheme)
  end
end

setColorscheme { name="vscode", transparent=false }
