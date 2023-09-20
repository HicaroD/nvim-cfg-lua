local telescope = require("telescope")

telescope.setup({
  extensions = {
    coc = {
      prefer_locations = true,
    },
  },
})
telescope.load_extension("coc")

vim.keymap.set("n", "<leader>lad", ":Telescope coc diagnostics<CR>", {})
vim.keymap.set("n", "<leader>ld", ":Telescope coc references<CR>", {})
vim.keymap.set("n", "<leader>gtd", "Telescope coc type-definitions<CR>", {})
