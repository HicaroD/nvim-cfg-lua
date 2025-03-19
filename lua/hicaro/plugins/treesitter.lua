return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "andymass/vim-matchup",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensure_installed = {
        "vimdoc",
        "c",
        "cpp",
        "python",
        "javascript",
        "typescript",
        "rust",
        "java",
        "prisma",
        "yaml",
        "html",
        "css",
        "dart",
        "gitcommit",
        "go",
        "tsx",
        "markdown",
        "lua",
        "odin",
        "svelte",
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = false,
        additional_vim_regex_highlighting = false,
      },
      matchup = {
        enable = true,
      },
    })
  end,
}
