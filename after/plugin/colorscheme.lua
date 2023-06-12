function configureGruvbox()
  local gruvbox = require("gruvbox")
  gruvbox.setup({
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
    transparent_mode = true,
  })
end

function setColorscheme(colorscheme)
  local colorscheme_name = colorscheme or "vscode"

  if colorscheme_name == "gruvbox" then
    configureGruvbox()
  end

  vim.cmd("colorscheme " .. colorscheme_name)
end

setColorscheme()
