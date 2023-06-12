local notify = require("notify")

notify.setup({
    background_color="#00A6EB",
    stages="slide",
    fps=60,
    timeout=2500,
})

vim.notify = notify
