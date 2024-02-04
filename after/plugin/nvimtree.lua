local utils = require("hicaro.utils")

local ok = utils.prequire("nvim-tree")
if not ok then
  print("Unable to import NvimTree module")
  return
end

local nvimtree = require("nvim-tree")

nvimtree.setup({
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    utils.keyset("n", "<space>", api.node.open.edit, opts("Open"))
  end,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    highlight_opened_files = "name",
    indent_markers = {
      enable = true,
    },
  },
  view = {
    width = 30,
    side = "left",
    float = {
      quit_on_focus_loss = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})
