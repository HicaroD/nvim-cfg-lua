local formatter = require("formatter")

---@diagnostic disable-next-line: undefined-global
local vim = vim

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
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    cpp = {
      function()
        local version = vim.fn.input(
          "Which clang-format version?\n(1) 9.0.0\n\n(2 or else): Any version available in my OS\n\nChoice: "
        )

        local clang_format_executable_path = ""

        if version == "1" then
          clang_format_executable_path = "/home/hicaro/Documentos/Development/clang_llvm_9.0.0/bin/clang-format"

          local clang_format_file = io.open(clang_format_executable_path, "r")

          if clang_format_file == nil then
            print(clang_format_executable_path .. " is an invalid path for an executable")
            return
          end

          io.close(clang_format_file)
        else
          -- TODO: identify the version avaiable in the OS
          -- TODO: check for errors, such as cases where "clang-format" is not available
          clang_format_executable_path = "clang-format"
        end

        print("Formatting...")
        return {
          exe = clang_format_executable_path,
          stdin = true,
        }
      end,
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
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})

-- TODO: add formatter for XML
-- I found a Vim command for formatting it: :%!xmllint --format %

local keyset = vim.keymap.set
keyset("n", "<C-S-i>", ":FormatWrite<CR>", { silent = true, noremap = true })
