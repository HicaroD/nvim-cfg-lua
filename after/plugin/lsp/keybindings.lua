local utils = require("hicaro.utils")

utils.keyset("n", "<C-e>", vim.diagnostic.open_float)
utils.keyset("n", "[d", vim.diagnostic.goto_prev)
utils.keyset("n", "]d", vim.diagnostic.goto_next)
utils.keyset("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    utils.keyset("n", "K", vim.lsp.buf.hover, opts)
    utils.keyset("n", "gi", vim.lsp.buf.implementation, opts)
    utils.keyset("n", "<leader>rn", vim.lsp.buf.rename, opts)
    utils.keyset({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)
  end,
})
