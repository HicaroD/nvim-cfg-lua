return {
  "stevearc/conform.nvim",
  opts = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        python = { "black" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "gofmt" },
        lua = { "stylua" },
        dart = { "dart_format" },
        javascript = { { "prettierd", "prettier" }, "eslint_d" },
        typescript = { { "prettierd", "prettier" }, "eslint_d" },
        markdown = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
      },
      format_on_save = {
        lsp_fallback = false,
      },
      format_after_save = {
        lsp_fallback = false,
      },
    })
  end,
}
