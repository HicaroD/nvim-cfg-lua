local utils = require("hicaro.utils")

local ok = utils.prequire("cmp")
if not ok then
  print("Unable to import CMP module")
  return
end

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "ultisnips" },
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),
})
