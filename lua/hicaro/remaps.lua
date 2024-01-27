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
  utils.close_tree_if_open()
  vim.cmd(":bwipeout!")
end)

-- <leader>e for opening Neotree
utils.keyset("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between tabs
utils.keyset("n", "<C-h>", ":bp<CR>")
utils.keyset("n", "<C-l>", ":bn<CR>")

-- <leader>t for opening the terminal (see terminal settings at lua/hicaro/term.lua)
utils.keyset("n", "<leader>t", ":split<CR>:resize -5<CR>:term<CR>")

-- Move selected lines up with K and down with J
utils.keyset("v", "J", ":m '>+1<CR>gv=gv")
utils.keyset("v", "K", ":m '<-2<CR>gv=gv")
