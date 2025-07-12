return {
  "andymass/vim-matchup",
  init = function()
    local matchup = require("match-up")
    matchup.setup({
      treesitter = {
        stopline = 500,
      },
    })
  end,
}
