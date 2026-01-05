return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        dart = { "dart_format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        java = { "clang-format" },
        go = { "gofmt", "golines" },
        javascript = { "prettier", "prettierd", stop_after_first = true },
        svelte = { "prettier", "prettierd", stop_after_first = true },
        typescript = { "prettier", "prettierd", stop_after_first = true },
        typescriptreact = { "prettier", "prettierd", stop_after_first = true },
        yaml = { "prettier", "prettierd", stop_after_first = true },
        json = { "prettier", "prettierd", stop_after_first = true },
        html = { "prettier", "prettierd", stop_after_first = true },
        ejs = { "prettier", "prettierd", stop_after_first = true },
        css = { "prettier", "prettierd", stop_after_first = true },
        markdown = { "prettier", "prettierd", stop_after_first = true },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        templ = { "templ" },
      },
    })

    local utils = require("hicaro.utils")
    utils.keyset("n", "<C-i>", conform.format, {})
  end,
}
