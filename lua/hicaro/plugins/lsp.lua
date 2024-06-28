return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "ms-jpq/coq_nvim", branch = "coq" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    "honza/vim-snippets",
  },
  init = function()
    vim.g.coq_settings = {
      clients = {
        tree_sitter = {
          enabled = false,
        },
      },
      auto_start = "shut-up",
      completion = {
        always = false,
        skip_after = { "{", "}", "[", "]", " " },
        smart = true,
      },
      keymap = {
        recommended = false,
        pre_select = true,
        eval_snips = "<leader>s",
      },
      limits = {
        completion_auto_timeout = 0,
      },
    }
  end,
  config = function()
    local servers = {
      "clangd", -- C / C++
      "rust_analyzer", -- Rust
      "tsserver", -- Typescript / Javascript
      "jdtls", -- Java
      "eslint", -- Typescript / Javascript (Linter)
      "golangci_lint_ls", -- Golang
      "gopls", -- Golang
      "pyright", -- Python
      "emmet_ls", -- Emmet
      "cssls", -- CSS,
      "dartls", -- Dart / Flutter
    }

    local lspconfig = require("lspconfig")
    local coq = require("coq")

    for _, server in pairs(servers) do
      lspconfig[server].setup(coq.lsp_ensure_capabilities({}))
    end

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
  end,
}
