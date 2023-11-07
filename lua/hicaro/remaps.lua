-- Leader key to ','
vim.g.mapleader = ","

-- Take the line below and append to the current line with J
vim.keymap.set("n", "J", "mzJ`z")

-- <leader>y can copy to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Use <leader>c for closing current tab buffer
vim.keymap.set("n", "<leader>c", ":q<CR>")

-- <leader>e for opening Neotree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between tabs
vim.keymap.set("n", "<C-h>", ":tabp<CR>")
vim.keymap.set("n", "<C-l>", ":tabn<CR>")

-- @@@ TODO: keybindings for moving tabs to left and right
