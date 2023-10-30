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

local function setupGruvboxMaterial()
  vim.api.nvim_exec([[
    let g:gruvbox_material_background = "medium"
    let g:gruvbox_material_disable_italic_comment = 1
  ]], false)
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
  elseif colorscheme == "gruvbox-material" then
    setupGruvboxMaterial()
  end

  if dark == "true" then
    vim.cmd("set background=dark")
  end

  vim.cmd("colorscheme " .. colorscheme)
end

setColorscheme({ name = "gruvbox-material", transparent = false, dark = "true" })
