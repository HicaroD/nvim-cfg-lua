-- local keyset = vim.keymap.set
-- -- Autocomplete
-- function _G.check_back_space()
--   local col = vim.fn.col(".") - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
-- end
--
-- local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false, nowait = true }
--
-- keyset("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
-- keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
-- keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
-- keyset("n", "<leader>lca", "<Plug>(coc-codeaction-cursor)", { silent = true })
-- keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
-- keyset("n", "<leader>lr", "<Plug>(coc-references)", { silent = true })
-- keyset("n", "<leader>ld", ":CocList diagnostics<CR>", { silent = true, nowait = true })
--
-- function _G.show_docs()
--   local cw = vim.fn.expand("<cword>")
--   if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
--     vim.api.nvim_command("h " .. cw)
--   elseif vim.api.nvim_eval("coc#rpc#ready()") then
--     vim.fn.CocActionAsync("doHover")
--   else
--     vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
--   end
-- end
--
-- keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })
--
-- -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
-- vim.api.nvim_create_augroup("CocGroup", {})
-- vim.api.nvim_create_autocmd("CursorHold", {
--   group = "CocGroup",
--   command = "silent call CocActionAsync('highlight')",
--   desc = "Highlight symbol under cursor on CursorHold",
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   group = "CocGroup",
--   pattern = "typescript,json",
--   command = "setl formatexpr=CocAction('formatSelected')",
--   desc = "Setup formatexpr specified filetype(s).",
-- })
--
-- -- Update signature help on jump placeholder
-- vim.api.nvim_create_autocmd("User", {
--   group = "CocGroup",
--   pattern = "CocJumpPlaceholder",
--   command = "call CocActionAsync('showSignatureHelp')",
--   desc = "Update signature help on jump placeholder",
-- })
--
-- -- `:OI` command for organizing imports of the current buffer
-- vim.api.nvim_create_user_command("OI", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

local cmp = require("cmp")
local keyset = vim.keymap.set

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "ultisnips" },
  }, {
    { name = "buffer" },
  }),
})

-- Setting up LSP config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_servers = { "pyright", "dartls", "jdtls" }

for _, lsp_server in ipairs(lsp_servers) do
  lspconfig[lsp_server].setup({
    capabilities = capabilities,
  })
end

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})
