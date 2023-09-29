local telescope = require("telescope")

telescope.setup({
  extensions = {
    coc = {
      prefer_locations = true,
    },
  },
})
telescope.load_extension("coc")

vim.keymap.set("n", "<leader>ld", ":Telescope coc workspace_diagnostics<CR>", {})
vim.keymap.set("n", "<leader>lr", ":Telescope coc references<CR>", {})
vim.keymap.set("n", "<leader>gtd", "Telescope coc type-definitions<CR>", {})
