local utils = require("hicaro.utils")

-- Leader key to ','
vim.g.mapleader = ","

-- J for taking the line below and append to the current line with an
-- additional whitespace
utils.keyset("n", "J", "mzJ`z")

-- <leader>y can copy to the system clipboard
utils.keyset({ "n", "v" }, "<leader>y", [["+y]])
utils.keyset("n", "<leader>Y", [["+Y]])

-- Close current buffer with the plugin "nvim-bufdel"
utils.keyset("n", "<leader>c", ":BufDel<CR>")

utils.keyset("n", "<leader>a", function() end)

-- <leader>e for opening NvimTree
utils.keyset("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between tabs
utils.keyset("n", "<C-h>", ":bp<CR>")
utils.keyset("n", "<C-l>", ":bn<CR>")

-- Move selected lines up with K and down with J
utils.keyset("v", "J", ":m '>+1<CR>gv=gv")
utils.keyset("v", "K", ":m '<-2<CR>gv=gv")
