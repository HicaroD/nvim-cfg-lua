return {
  "Mofiqul/vscode.nvim",
  config = function()
    vim.o.termguicolors = true

    local vscode = require("vscode")
    vscode.setup({
      disable_nvimtree_bg = true,
      transparent = false,
      color_overrides = {
        vscBack = "#181818",
      },
    })
    vscode.load()
    vim.cmd.colorscheme("vscode")
  end,
}
