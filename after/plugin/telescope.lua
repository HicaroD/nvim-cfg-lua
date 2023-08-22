local telescope = require("telescope");
local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gst', ":Telescope git_status<CR>", {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- telescope-coc.nvim
vim.keymap.set('n', '<leader>gi', ":Telescope coc implementations<CR>", {})
vim.keymap.set('n', '<leader>gtd', ":Telescope coc type_definitions<CR>", {})
vim.keymap.set('n', '<leader>lad', ":Telescope coc workspace_diagnostics<CR>", {})
vim.keymap.set('n', '<leader>ld', ":Telescope coc diagnostics<CR>", {})
vim.keymap.set('n', '<leader>lca', ":Telescope coc code_actions<CR>", {})
vim.keymap.set('n', '<leader>lr', ":Telescope coc references<CR>", {})

telescope.load_extension("coc");
