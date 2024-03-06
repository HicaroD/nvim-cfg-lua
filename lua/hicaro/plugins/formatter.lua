return {
  "nvimtools/none-ls.nvim",
  lazy = false,
  opts = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,       -- Lua
        null_ls.builtins.formatting.black,        -- Python
        null_ls.builtins.formatting.clang_format, -- C / CPP and more
        null_ls.builtins.formatting.gofmt,        -- Go
        null_ls.builtins.formatting.markdownlint, -- Markdown
        null_ls.builtins.formatting.prettierd,    -- Prettier Daemon
        null_ls.builtins.formatting.shfmt,        -- Shell
      },
    })
  end,
}
