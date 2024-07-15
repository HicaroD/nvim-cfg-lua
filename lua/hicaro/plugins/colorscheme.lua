return {
  "Mofiqul/vscode.nvim",
  config = function()
    vim.o.termguicolors = true
    vim.o.dark = true

    local vscode = require("vscode")
    vscode.load()
  end,
}
