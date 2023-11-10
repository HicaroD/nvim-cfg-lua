-- TODO: build a lsp folder and separate this config in files
local cmp = require("cmp")
local keyset = vim.keymap.set

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  -- completion = {
  --   autocomplete = false,
  -- },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "ultisnips" },
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),
})

-- Setting up LSP config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_servers = {
  "pyright",
  "dartls",
  "jdtls",
  "gopls",
  "tsserver",
  "hls",
  "clangd",
  "html",
  "cssls",
  "emmet_language_server",
  "rust_analyzer",
}

-- Standard LSP servers
for _, lsp_server in ipairs(lsp_servers) do
  if lsp_server == "html" or lsp_server == "cssls" then
    capabilities.textDocument.completion.completionItem.snippetSupport = true
  end

  lspconfig[lsp_server].setup({
    capabilities = capabilities,
  })
end

keyset("n", "<C-e>", vim.diagnostic.open_float)
keyset("n", "[d", vim.diagnostic.goto_prev)
keyset("n", "]d", vim.diagnostic.goto_next)
keyset("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    keyset("n", "K", vim.lsp.buf.hover, opts)
    keyset("n", "gi", vim.lsp.buf.implementation, opts)
    keyset("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keyset({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)
  end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})
