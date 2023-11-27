local utils = require("hicaro.utils")

-- Leader key to ','
vim.g.mapleader = ","

-- J for taking the line below and append to the current line with an
-- additional whitespace
utils.keyset("n", "J", "mzJ`z")

-- <leader>y can copy to the system clipboard
utils.keyset({ "n", "v" }, "<leader>y", [["+y]])
utils.keyset("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>c", function()
  local tree = require("nvim-tree.view")

  if tree.is_visible() then
    vim.cmd(":NvimTreeToggle")
  end
  vim.cmd(":q")
end)

-- <leader>e for opening Neotree
utils.keyset("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between tabs
utils.keyset("n", "<C-h>", ":tabp<CR>")
utils.keyset("n", "<C-l>", ":tabn<CR>")

-- <leader>t for opening the terminal (see terminal settings at lua/hicaro/term.lua)
utils.keyset("n", "<leader>t", ":split<CR>:resize -5<CR>:term<CR>")
