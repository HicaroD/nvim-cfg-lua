return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "fannheyward/telescope-coc.nvim",
  },
  config = function()
    local utils = require("hicaro.utils")
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9 },
        },
        preview = true,
        file_ignore_patterns = {
          "^.git/",
        },
        mappings = {
          i = {
            ["<c-t>"] = function(bufnr)
              local action_set = require("telescope.actions.set")
              action_set.edit(bufnr, "tab drop")
            end,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    telescope.load_extension("coc")

    -- Built-in configurations
    local builtin = require("telescope.builtin")
    utils.keyset("n", "<C-q>", builtin.quickfix, {})
    utils.keyset("n", "<leader>lb", builtin.buffers, {})
    utils.keyset("n", "<leader>ff", builtin.find_files, {})
    utils.keyset("n", "<leader>ps", builtin.live_grep, {})
    utils.keyset("n", "<leader>pcs", builtin.current_buffer_fuzzy_find, {})
    utils.keyset("n", "<leader>lr", ":Telescope coc references<CR>", {})
    utils.keyset("n", "<leader>gi", ":Telescope coc implementations<CR>", {})
    utils.keyset("n", "<leader>ld", ":Telescope coc diagnostics<CR>", {})
    utils.keyset("n", "<leader>ls", ":Telescope coc document_symbols<CR>", {})
    utils.keyset("n", "<leader>lca", ":Telescope coc code_actions<CR>", {})
  end,
}
