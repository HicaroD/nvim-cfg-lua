return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "ms-jpq/coq_nvim", branch = "coq" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local coq = require("coq")

    local servers = {
      "clangd", -- C / C++
      "rust_analyzer", -- Rust
      "tsserver", -- Typescript / Javascript
      "jdtls", -- Java
      "eslint", -- Typescript / Javascript (Linter)
      "golangci_lint_ls", -- Golang
      "gopls", -- Golang
      "pyright", -- Python
      -- "lua_ls", -- Lua
      "emmet_ls", -- Emmet
      "cssls", -- CSS,
      "dartls", -- Dart / Flutter
    }

    for _, server in pairs(servers) do
      lspconfig[server].setup(coq.lsp_ensure_capabilities({}))
    end

    vim.g.coq_settings = {
      auto_start = true,
      completion = {
        always = true,
      },
      keymap = {
        recommended = false,
        pre_select = true,
      },
    }

    vim.api.nvim_set_keymap(
      "i",
      "<tab>",
      [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
      { expr = true, silent = true }
    )

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
    vim.cmd([[COQnow -s]])
  end,
}
