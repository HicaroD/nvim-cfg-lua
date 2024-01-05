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
    layout_config = {
      horizontal = { width = 0.9 }
    },
    preview = false,
    mappings = {
      i = {
        ["<cr>"] = function(bufnr)
          local has_bufferline = utils.prequire("bufferline")
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
utils.keyset("n", "<C-q>", builtin.quickfix, {})
utils.keyset("n", "<leader>ff", builtin.find_files, {})
utils.keyset("n", "<leader>ps", builtin.live_grep, {})
utils.keyset("n", "<leader>lb", builtin.buffers, {})
utils.keyset("n", "<leader>fh", builtin.help_tags, {})
utils.keyset("n", "<leader>ld", builtin.diagnostics, {})
utils.keyset("n", "<leader>gtd", builtin.lsp_type_definitions, {})
utils.keyset("n", "<leader>gi", builtin.lsp_implementations, {})
utils.keyset("n", "<leader>lr", builtin.lsp_references, {})
utils.keyset("n", "gd", builtin.lsp_definitions, {})
