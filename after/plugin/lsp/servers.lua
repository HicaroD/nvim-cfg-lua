local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_servers = {
  "pyright", -- Python
  "dartls", -- Dart / Flutter
  "jdtls", -- Java
  "gopls", -- Golang
  "tsserver", -- Typescript
  "hls", -- Haskell
  "clangd", -- Clang (C / C++)
  "html", -- HTML
  "cssls", -- CSS
  "emmet_language_server", -- HTML / CSS
  "rust_analyzer", -- Rust
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})
