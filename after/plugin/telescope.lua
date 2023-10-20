local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<cr>"] = function(bufnr)
          require("telescope.actions.set").edit(bufnr, "tab drop")
        end,
      },
    },
  },
})

local builtin = require("telescope.builtin")
local keyset = vim.keymap.set

keyset("n", "<leader>ff", builtin.find_files, {})
keyset("n", "<leader>ps", builtin.live_grep, {})
keyset("n", "<leader>lb", builtin.buffers, {})
keyset("n", "<leader>fh", builtin.help_tags, {})
keyset("n", "<leader>ld", builtin.diagnostics, {})
keyset("n", "<leader>lr", builtin.lsp_references, {})
