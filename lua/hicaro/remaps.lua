-- Leader key to ','
vim.g.mapleader=","

-- Move lines selected in visual mode with J or K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Take the line below and append to the current line with J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep the cursor in the middle when searching for a term
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader>y can copy to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Use <leader>s for opening a search and replace in the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Use <leader>c for closing current tab buffer
vim.keymap.set("n", "<leader>c", function()
  local tree = require("nvim-tree.view")
  if tree.is_visible() then
    vim.cmd("bwipeout")
  end
  vim.cmd("bwipeout")
end)

-- <leader>e for opening Neotree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between buffers
vim.keymap.set("n", "<C-h>", ":bprevious<CR>")
vim.keymap.set("n", "<C-l>", ":bnext<CR>")

-- Floating terminal
local float_term_command = ":FloatermNew --height=0.35 --wintype=split --position=botright --autoclose=2<CR>"
vim.keymap.set("n", "<leader>nt", float_term_command)

-- <leader>rcf for renaming current file
vim.keymap.set("n", "<leader>rcf", ":CocCommand workspace.renameCurrentFile<CR>")

-- <leader>suc for showing highlight group using Treesitter Playground plugin
vim.keymap.set("n", "<leader>suc", ":TSHighlightCapturesUnderCursor<CR>")
