-- Accent
-- return {
--   "https://github.com/fxn/vim-monochrome",
--   config = function()
--     vim.cmd("colorscheme monochrome")
--   end
-- }

-- VSCode
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
    vim.cmd("colorscheme vscode")
  end,
}

-- Gruvbox
-- return {
--   "ellisonleao/gruvbox.nvim",
--   config = function()
--     vim.cmd("set termguicolors")
--     local gruvbox = require("gruvbox")
--     gruvbox.setup({
--       bold = false,
--       italic = {
--         strings = false,
--         emphasis = false,
--         comments = false,
--         operators = false,
--         folds = false,
--       },
--       contrast = "medium",
--     })
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }
