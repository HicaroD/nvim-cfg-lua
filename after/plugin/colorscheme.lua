local utils = require("hicaro.utils")

local function setupVscode(transparent)
  local ok = utils.prequire("vscode")
  if not ok then
    print("Unable to import VSCode colorscheme")
    return
  end
  local vscode = require("vscode")

  vscode.setup({
    disable_nvimtree_bg = true,
    transparent = transparent,
    color_overrides = {
      vscBack = "#181818",
    },
  })
  vscode.load()
end

local function setColorscheme(args)
  vim.o.termguicolors = true

  local colorscheme = args.name
  local transparent = args.transparent
  local dark = args.dark

  if colorscheme == "nocolors" then
    return
  end

  if colorscheme == "vscode" then
    setupVscode(transparent)
  else
    print("No colorscheme were set")
    return
  end

  if dark == "true" then
    vim.cmd("set background=dark")
  end
end

setColorscheme({ name = "vscode", transparent = false, dark = "true" })
