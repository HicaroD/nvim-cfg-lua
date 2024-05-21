return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- nvim-cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
  },
  config = function()
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

    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local default_setup = function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end
    lsp_capabilities.textDocument.completion.completionItem.snippetSupport = false

    lspconfig.dartls.setup({
      cmd = { "dart", "language-server", "--protocol=lsp" },
      filetypes = { "dart" },
      init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true,
      },
      -- root_dir = root_pattern("pubspec.yaml"),
      settings = {
        dart = {
          completeFunctionCalls = true,
          showTodos = true,
        },
      },
      on_attach = function(client, bufnr) end,
    })

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup({})
    mason_lspconfig.setup({
      -- Servers
      ensure_installed = {
        "clangd", -- C / C++
        "rust_analyzer", -- Rust
        "tsserver", -- Typescript / Javascript
        "jdtls", -- Java
        "eslint", -- Typescript / Javascript (Linter)
        "golangci_lint_ls", -- Golang
        "gopls", -- Golang
        "pyright", -- Python
        "lua_ls", -- Lua
        "emmet_ls", -- Emmet
        "cssls", -- CSS,
        -- "dartls", -- Dart / Flutter
      },
      handlers = { default_setup },
    })

    -- CMP configuration
    local cmp = require("cmp")

    cmp.setup({
      sources = {
        { name = "nvim_lsp", priority = 30 },
        { name = "buffer", priority = 20 },
        { name = "path", priority = 10 },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      }),
      snippet = false,
    })
  end,
}
