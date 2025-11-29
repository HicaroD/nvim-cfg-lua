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
        "odin",
        "svelte",
        "templ",
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        disable = function(lang, bufnr)
          local line_count_threshold = 1000
          local current_file_line_count = vim.api.nvim_buf_line_count(bufnr)
          return current_file_line_count > line_count_threshold
        end,
        additional_vim_regex_highlighting = false,
      },
      matchup = {
        enable = true, -- make sure vim-matchup is installed
      },
    })
  end,
}
