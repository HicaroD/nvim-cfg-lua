--[[------------------------------------]]--
--       	  keymaps      		  --
--             Author: HícaroD            --
--[[------------------------------------]]--

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

map("n", "<C-p>", ":NvimTreeToggle<CR>", {})

map("n", "<C-f>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", {})

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
