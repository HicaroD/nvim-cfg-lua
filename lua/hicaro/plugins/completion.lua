return {
  "echasnovski/mini.completion",
  version = false,
  config = function()
    local utils = require("hicaro.utils")

    local completion = require("mini.completion")
    completion.setup({
      delay = {
        completion = 10^7,
      },
    })

    -- pre-select the first item
    vim.o.completeopt = "menu,menuone,noinsert"

    local keycode = vim.keycode or function(x)
      return vim.api.nvim_replace_termcodes(x, true, true, true)
    end

    local keys = {
      ["cr"] = keycode("<cr>"),
      ["tab"] = keycode("<TAB>"),
      ["ctrl-y"] = keycode("<C-y>"),
      ["ctrl-y_cr"] = keycode("<C-y><CR>"),
    }

    _G.tab_action = function()
      if vim.fn.pumvisible() ~= 0 then
        local item_selected = vim.fn.complete_info()["selected"] ~= -1
        return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
      else
        return keys["cr"]
      end
    end

    vim.keymap.set("i", "<TAB>", "v:lua._G.tab_action()", { expr = true })
  end,
}
