return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")
    local servers = {
      "clangd", -- C / C++
      "rust_analyzer", -- Rust
      "ts_ls", -- Typescript / Javascript
      "eslint", -- Typescript / Javascript (Linter)
      "html", -- HTML,
      "cssls", -- CSS,
      "jsonls", -- JSON,
      "emmet_ls", -- Emmet
      "jdtls", -- Java
      "golangci_lint_ls", -- Golang
      "gopls", -- Golang
      "pyright", -- Python
      "dartls", -- Dart / Flutter
      "tailwindcss", -- TailwindCSS
    }
    for _, server in pairs(servers) do
      lspconfig[server].setup({})
    end

    local utils = require("hicaro.utils")

    utils.keyset("n", "<C-e>", vim.diagnostic.open_float)
    utils.keyset("n", "[d", vim.diagnostic.goto_prev)
    utils.keyset("n", "]d", vim.diagnostic.goto_next)

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }
        utils.keyset("n", "gd", ":vsp<cr> :lua vim.lsp.buf.definition()<CR>", opts)
        utils.keyset("n", "<leader>d", vim.lsp.buf.definition, opts)
        utils.keyset("n", "K", vim.lsp.buf.hover, opts)
        utils.keyset("n", "<leader>r", vim.lsp.buf.rename, opts)
        utils.keyset({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)
      end,
    })
  end,
}
