return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        dart = { "dart_format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        java = { "clang-format" },
        go = { "gofmt", "golines" },
        yaml = { { "prettier", "prettier" } },
        json = { { "prettier", "prettier" } },
        html = { { "prettier", "prettier" } },
        ejs = { { "prettier", "prettier" } },
        css = { { "prettier", "prettier" } },
        markdown = { { "prettier", "prettier" } },
        rust = { "rustfmt" },
        sh = { "shfmt" },
      },
    })

    local utils = require("hicaro.utils")
    utils.keyset("n", "<C-i>", conform.format, {})
  end,
}
