local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

lsp.preset("recommended")

lsp.ensure_installed({
  -- Typescript
  "tsserver",
  "eslint",

  -- Golang
  "gopls",

  -- Rust
  "rust_analyzer",

  -- Markdown
  "marksman",

  -- C and C++
  "clangd",

  -- Python
  "pyright",
})

lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I"
  }
})

-- Global LSP keymaps
local opts = {buffer = bufnr, remap = false}
vim.keymap.set("n", "<leader>d", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
vim.keymap.set("n", "<C-i>", function() vim.lsp.buf.format() end, opts)

-- Format on save configuration
lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["tsserver"] = {"typescript"},
    ["rust_analyzer"] = {"rust"},
    ["black"] = {"python"},
    ["gopls"] = {"go"},
    ["dartls"] = {"dart"},
  }
})

lsp.setup()

null_ls.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.spectral
  }
})

vim.diagnostic.config({
    virtual_text = true
})

lspconfig.dartls.setup {}
