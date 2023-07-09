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


function setupGithub(transparent)
  require('github-theme').setup({
    options = {
      transparent = transparent,
    },
  })
  vim.cmd("colorscheme " .. "github_dark_dimmed")
end

function setColorscheme(args)
  vim.o.termguicolors = true

  local colorscheme = args.name
  local transparent = args.transparent

  if colorscheme == "vscode" then
    setupVscode(transparent)
  elseif colorscheme == "github" then
    setupGithub(transparent)
  else
    vim.cmd("colorscheme " .. colorscheme_name)
  end
end

setColorscheme { name="github", transparent=false }
