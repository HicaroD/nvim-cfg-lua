return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local utils = require("hicaro.utils")

    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9 },
        },
        preview = false,
        file_ignore_patterns = {
          "^.git/",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    -- Built-in configurations
    local builtin = require("telescope.builtin")
    utils.keyset("n", "<C-q>", builtin.quickfix, {})
    utils.keyset("n", "<leader>ff", builtin.find_files, {})
    utils.keyset("n", "<leader>ps", builtin.live_grep, {})
    utils.keyset("n", "<leader>pcs", builtin.current_buffer_fuzzy_find, {})
    utils.keyset("n", "<leader>lb", builtin.buffers, {})
    utils.keyset("n", "<leader>lr", builtin.lsp_references, {})
    utils.keyset("n", "<leader>li", builtin.lsp_implementations, {})
    utils.keyset("n", "<leader>lti", builtin.lsp_type_definitions, {})
    utils.keyset("n", "<leader>ld", builtin.diagnostics, {})
    utils.keyset("n", "<leader>ls", builtin.lsp_document_symbols, {})
    utils.keyset("n", "<leader>lws", function()
      local target_symbol = vim.fn.input("Work. Sym.: ")
      return builtin.lsp_workspace_symbols({ query = target_symbol })
    end, {})
  end,
}
