--[[------------------------------------]]--
--       	  keymaps      		  --
--             Author: HícaroD            --
--[[------------------------------------]]--

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

map("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nvim-tree
map("n", "<C-p>", ":NvimTreeToggle<CR>", {})

-- Telescope
map("n", "<C-f>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", {})

-- Comment lines
map("x", "<C-c>", ":'<,'>CommentToggle<CR>", {}) -- Comment Multiple Lines In Visual Mode

-- Tab navigation
map("n", "<Leader>tn", ":tabnew<cr>", {})
map("n", "<Leader>tc", ":tabclose<cr>", {})
map("n", "<Leader>to", ":tabonly<cr>", {})
map("n", "<C-h>", ":tabprevious<cr>", {})
map("n", "<C-l>", ":tabnext<cr>", {})

-- Built-in auto pairs
vim.cmd([[
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap " ""<left>
inoremap ' ''<left>
]])
