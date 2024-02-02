local utils = require("hicaro.utils")

-- Leader key to ','
vim.g.mapleader = ","

-- J for taking the line below and append to the current line with an
-- additional whitespace
utils.keyset("n", "J", "mzJ`z")

-- <leader>y can copy to the system clipboard
utils.keyset({ "n", "v" }, "<leader>y", [["+y]])
utils.keyset("n", "<leader>Y", [["+Y]])

-- :tabc closes the current tab including the tree if open
-- And it does not close the last tab
utils.keyset("n", "<leader>c", function()
  vim.cmd(":tabc")
end)

-- <leader>e for opening NvimTree
utils.keyset("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between tabs
utils.keyset("n", "<C-h>", function()
  utils.close_tree_if_open()
  vim.cmd(":tabp")
end)
utils.keyset("n", "<C-l>", function()
  utils.close_tree_if_open()
  vim.cmd(":tabn")
end)

-- Move selected lines up with K and down with J
utils.keyset("v", "J", ":m '>+1<CR>gv=gv")
utils.keyset("v", "K", ":m '<-2<CR>gv=gv")
