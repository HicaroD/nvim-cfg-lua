return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    local utils = require("hicaro.utils")

    function _G.show_docs()
      local cw = vim.fn.expand("<cword>")
      if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command("h " .. cw)
      elseif vim.api.nvim_eval("coc#rpc#ready()") then
        vim.fn.CocActionAsync("doHover")
      else
        vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
      end
    end
    utils.keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

    utils.keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
    utils.keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })

    utils.keyset("n", "gd", ":vsp<CR> <Plug>(coc-definition)", { silent = true })
    utils.keyset("n", "<leader>d", "<Plug>(coc-definition)", { silent = true })
    utils.keyset("n", "<leader>r", "<Plug>(coc-rename)", { silent = true })

    function _G.check_back_space()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
    end
    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
    utils.keyset(
      "i",
      "<c-n>",
      'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
      opts
    )
    utils.keyset("i", "<c-p>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

    utils.keyset(
      "i",
      "<TAB>",
      [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
      opts
    )
  end,
}
