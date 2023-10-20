local function setupVscode(transparent)
  require("vscode").setup({
    disable_nvimtree_bg = true,
    transparent = transparent,
    color_overrides = {
      vscBack = "#181818",
    },
  })
  require("vscode").load()
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
  end

  if dark == "true" then
    vim.cmd("set background=dark")
  end

  vim.cmd("colorscheme " .. colorscheme)
end

setColorscheme({ name = "vscode", transparent = false, dark = "true" })
