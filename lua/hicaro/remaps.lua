local utils = require("hicaro.utils")

-- Leader key to ','
vim.g.mapleader = ","

-- J for taking the line below and append to the current line with an
-- additional whitespace
utils.keyset("n", "J", "mzJ`z")

-- <leader>y can copy to the system clipboard
utils.keyset({ "n", "v" }, "<leader>y", [["+y]])
utils.keyset("n", "<leader>Y", [["+Y]])

local has_bufferline = utils.prequire("bufferline")

vim.keymap.set("n", "<leader>c", function()
  local tree = require("nvim-tree.view")
  if tree.is_visible() then
    tree.close()
  end

  if has_bufferline then
    vim.cmd(":bwipeout!")
  else
    vim.cmd(":q")
  end
end)

-- <leader>e for opening Neotree
utils.keyset("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Navigate between tabs
utils.keyset("n", "<C-h>", function()
  if has_bufferline then
    vim.cmd(":bp")
  else
    vim.cmd(":tabp")
  end
end)
utils.keyset("n", "<C-l>", function()
  if has_bufferline then
    vim.cmd(":bn")
  else
    vim.cmd(":tabn")
  end
end)

-- <leader>t for opening the terminal (see terminal settings at lua/hicaro/term.lua)
utils.keyset("n", "<leader>t", ":split<CR>:resize -5<CR>:term<CR>")
