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

local function setupGruvbox()
  vim.cmd("let g:gruvbox_material_disable_italic_comment = 1")
  vim.cmd("let g:gruvbox_material_background = 'hard'")
  vim.cmd("colorscheme gruvbox-material")
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
  elseif colorscheme == "gruvbox" then
    setupGruvbox()
  else
    print("No colorscheme were set")
    return
  end

  if dark == "true" then
    vim.cmd("set background=dark")
  end
end

setColorscheme({ name = "vscode", transparent = false, dark = "true" })
