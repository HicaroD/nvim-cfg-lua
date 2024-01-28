local utils = require("hicaro.utils")

local ok = utils.prequire("nvim-treesitter.configs")
if not ok then
  print("Unable to import Treesitter")
  return
end

local treesitter_config = require("nvim-treesitter.configs")

treesitter_config.setup({
  ensure_installed = {
    "c",
    "cpp",
    "python",
    "javascript",
    "typescript",
    "rust",
    "java",
    "prisma",
    "yaml",
    "dart",
    "gitcommit",
    "go",
    "tsx",
    "markdown",
    "lua",
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
