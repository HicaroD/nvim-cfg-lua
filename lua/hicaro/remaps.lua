local utils = require("hicaro.utils")

-- Leader key to ','
vim.g.mapleader = ","

-- J for taking the line below and append to the current line with an
-- additional whitespace
utils.keyset("n", "J", "mzJ`z")

-- <leader>y can copy to the system clipboard
utils.keyset({ "n", "v" }, "<leader>y", [["+y]])
utils.keyset("n", "<leader>Y", [["+Y]])

-- Use <leader>c for closing current tab buffer
utils.keyset("n", "<leader>c", ":q<CR>")

-- <leader>e for opening Neotree
utils.keyset("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between tabs
utils.keyset("n", "<C-h>", ":tabp<CR>")
utils.keyset("n", "<C-l>", ":tabn<CR>")

-- <leader>t for opening the terminal (see terminal settings at lua/hicaro/term.lua)
utils.keyset("n", "<leader>t", ":split<CR>:resize -5<CR>:term<CR>")

-- @@@ TODO: keybindings for moving tabs to left and right
