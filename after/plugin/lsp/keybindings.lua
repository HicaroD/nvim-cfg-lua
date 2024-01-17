local utils = require("hicaro.utils")

-- General keybindings
utils.keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
utils.keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
utils.keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
utils.keyset("i", "<TAB>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Renomear
function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

utils.keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Show documentation
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
