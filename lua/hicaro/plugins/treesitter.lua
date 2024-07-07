return {
  "nvim-treesitter/nvim-treesitter",
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
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
