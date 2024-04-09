return {
  "mhartington/formatter.nvim",
  config = function()
    local utils = require("hicaro.utils")
    local formatter = require("formatter")

    formatter.setup({
      logging = false,
      filetype = {
        dart = {
          require("formatter.filetypes.dart").dartformat,
        },
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        c = {
          require("formatter.filetypes.c").clangformat,
        },
        cpp = {
          require("formatter.filetypes.cpp").clangformat,
        },
        go = {
          require("formatter.filetypes.go").gofmt,
        },
        yaml = {
          require("formatter.filetypes.yaml").prettier,
        },
        json = {
          require("formatter.filetypes.json").prettier,
        },
        html = {
          require("formatter.filetypes.html").prettier,
        },
        ejs = {
          require("formatter.filetypes.html").prettier,
        },
        css = {
          require("formatter.filetypes.css").prettier,
        },
        markdown = {
          require("formatter.filetypes.markdown").prettier,
        },
        python = {
          require("formatter.filetypes.python").black,
        },
        rust = {
          require("formatter.filetypes.rust").rustfmt,
        },
        java = {
          require("formatter.filetypes.java").clangformat,
        },
        sh = {
          require("formatter.filetypes.sh").shfmt,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
    utils.keyset("n", "<C-i>", ":FormatWrite<CR>", { silent = true, noremap = true })
  end,
}
