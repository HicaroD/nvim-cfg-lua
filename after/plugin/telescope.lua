local keyset = vim.keymap.set

-- General configuration
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

-- Built-in configurations
local builtin = require("telescope.builtin")
keyset("n", "<leader>ff", builtin.find_files, {})
keyset("n", "<leader>ps", builtin.live_grep, {})
keyset("n", "<leader>lb", builtin.buffers, {})
keyset("n", "<leader>fh", builtin.help_tags, {})
keyset("n", "<leader>ld", builtin.diagnostics, {})
keyset("n", "<leader>gtd", function()
  return builtin.lsp_type_definitions({ jump_type = "tab drop" })
end, {})
keyset("n", "<leader>gi", function()
  return builtin.lsp_implementations({ jump_type = "tab drop" })
end, {})
keyset("n", "<leader>lr", function()
  return builtin.lsp_references({ jump_type = "tab drop" })
end, {})
keyset("n", "gd", function()
  return builtin.lsp_definitions({ jump_type = "tab drop" })
end, {})
