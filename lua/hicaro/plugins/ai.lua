return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
       disable_keymaps = true,
       disable_inline_completion = true, -- to work with nvim-cmp
    })
  end,
}
