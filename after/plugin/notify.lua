local notify = require("notify")

notify.setup({
    background_color="#00A6EB",
    render="compact",
    stages="slide",
    fps=60,
    timeout=2500,
})

-- Setting notify as default notification system for others plugins
vim.notify = notify
notify("Welcome, Hícaro!")
