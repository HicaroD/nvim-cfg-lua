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

-- Built-in configurations
local builtin = require("telescope.builtin")
utils.keyset("n", "<C-q>", builtin.quickfix, {})
utils.keyset("n", "<leader>lb", builtin.buffers, {})
utils.keyset("n", "<leader>ff", builtin.find_files, {})
utils.keyset("n", "<leader>ps", builtin.live_grep, {})

-- Related to telescope-coc.nvim extension
telescope.load_extension("coc")
utils.keyset("n", "gi", ":Telescope coc implementations<CR>")
utils.keyset("n", "<leader>lr", ":Telescope coc references<CR>")
utils.keyset("n", "<leader>gi", ":Telescope coc implementations<CR>", {})
utils.keyset("n", "<leader>ld", ":Telescope coc workspace_diagnostics<CR>", {})
utils.keyset("n", "<leader>ls", ":Telescope coc document_symbols<CR>", {})
