return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
      "clangd", -- C / C++
      "rust_analyzer", -- Rust
      "ts_ls", -- Typescript / Javascript
      "html", -- HTML,
      "cssls", -- CSS,
      "jsonls", -- JSON,
      "emmet_ls", -- Emmet
      "gopls", -- Golang
      "pyright", -- Python
      "dartls", -- Dart / Flutter
      "tailwindcss", -- TailwindCSS
      "svelte", -- Svelte
      "templ", -- Templ
    }

    for _, server in pairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
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
        utils.keyset(
          "n",
          "<leader>oi",
          ':lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>',
          opts
        )
      end,
    })
  end,
}
