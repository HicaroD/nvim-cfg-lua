return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      color = { suggestion_color = "#5C6370", cterm = 59 },
      disable_inline_completion = false,
      disable_keymaps = true,
    })

    local suggestion = require("supermaven-nvim.completion_preview")

    local function alt_x(fallback)
      if suggestion.has_suggestion() then
        vim.schedule(function()
          suggestion.on_accept_suggestion()
        end)
        return ""
      end

      if fallback then
        return fallback()
      end
    end

    vim.keymap.set("i", "<M-x>", alt_x, {
      silent = true,
      expr = true,
      desc = "Supermaven: accept suggestion or fallback",
    })
  end,
}
