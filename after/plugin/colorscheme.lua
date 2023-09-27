local function setColorscheme(colorscheme)
  vim.o.termguicolors = true
  vim.cmd("colorscheme " .. colorscheme)
end

setColorscheme("vscode")
