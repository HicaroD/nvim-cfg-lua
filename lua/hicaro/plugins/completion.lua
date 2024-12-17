return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",

    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    "honza/vim-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local snippy = require("snippy")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    vim.o.completeopt = "menu,menuone,noinsert"

    cmp.setup({
      completion = {
        autocomplete = false,
      },
      snippet = {
        expand = function(args)
          snippy.expand_snippet(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif snippy.can_expand_or_advance() then
            snippy.expand_or_advance()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippy" },
        {
          name = "buffer",
        },
      }),
    })
  end,
}
