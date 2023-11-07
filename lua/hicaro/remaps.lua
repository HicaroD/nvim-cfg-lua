-- Leader key to ','
vim.g.mapleader = ","

-- J for taking the line below and append to the current line with an
-- additional whitespace
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

-- <leader>t for opening the terminal
vim.cmd("autocmd TermOpen * startinsert")
vim.cmd([[
tnoremap <Esc> <C-\><C-n>
]])
vim.cmd("set splitbelow")
vim.keymap.set("n", "<leader>t", ":split<CR>:resize -5<CR>:term<CR>")

-- @@@ TODO: keybindings for moving tabs to left and right
