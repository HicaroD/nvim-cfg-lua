local utils = require("hicaro.utils")

local ok = utils.prequire("telescope")
if not ok then
  print("Unable to import Telescope module")
  return
end

-- General configuration
local telescope = require("telescope")
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<cr>"] = function(bufnr)
          local has_bufferline = utils.prequire("bufferline")

          local tree = require("nvim-tree.view")
          if tree.is_visible() then
            tree.close()
          end

          local jump_type = "tab drop"
          if has_bufferline then
            jump_type = "e"
          end
          require("telescope.actions.set").edit(bufnr, jump_type)
        end,
      },
    },
  },
})

-- Built-in configurations
local builtin = require("telescope.builtin")
utils.keyset("n", "<leader>ff", builtin.find_files, {})
utils.keyset("n", "<leader>ps", builtin.live_grep, {})
utils.keyset("n", "<leader>lb", builtin.buffers, {})
utils.keyset("n", "<leader>fh", builtin.help_tags, {})
utils.keyset("n", "<leader>ld", builtin.diagnostics, {})
utils.keyset("n", "<leader>gtd", function()
  return builtin.lsp_type_definitions({ jump_type = "tab drop" })
end, {})
utils.keyset("n", "<leader>gi", function()
  return builtin.lsp_implementations({ jump_type = "tab drop" })
end, {})
utils.keyset("n", "<leader>lr", function()
  return builtin.lsp_references({ jump_type = "tab drop" })
end, {})
utils.keyset("n", "gd", function()
  return builtin.lsp_definitions({ jump_type = "tab drop" })
end, {})
