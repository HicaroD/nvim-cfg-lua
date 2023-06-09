require("notify").setup({
    background_color="#00A6EB"
})

local notify = require("notify")

-- Setting notify as default notification system for others plugins
vim.notify = notify

notify("Welcome, Hícaro!")
