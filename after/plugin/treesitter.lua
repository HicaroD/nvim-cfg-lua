local utils = require("hicaro.utils")

local ok = utils.prequire("nvim-treesitter.configs")
if not ok then
  print("Unable to import Treesitter")
  return
end

local tsconfig = require("nvim-treesitter.configs")

tsconfig.setup({
  ensure_installed = {
    "c",
    "python",
    "cpp",
    "lua",
    "vim",
    "vimdoc",
    "sql",
    "typescript",
    "rust",
    "java",
    "javascript",
    "prisma",
    "yaml",
    "dart",
    "gitcommit",
    "go",
    "tsx",
    "markdown",
  },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

