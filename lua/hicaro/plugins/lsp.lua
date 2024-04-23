return {
  "neoclide/coc.nvim",
  branch = "release",
  dependencies = {},
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
  end,
}
