local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "   ▄█    █▄     ▄█   ▄████████    ▄████████    ▄████████  ▄██████▄  ",
  "  ███    ███   ███  ███    ███   ███    ███   ███    ███ ███    ███ ",
  "  ███    ███   ███▌ ███    █▀    ███    ███   ███    ███ ███    ███ ",
  " ▄███▄▄▄▄███▄▄ ███▌ ███          ███    ███  ▄███▄▄▄▄██▀ ███    ███ ",
  "▀▀███▀▀▀▀███▀  ███▌ ███        ▀███████████ ▀▀███▀▀▀▀▀   ███    ███ ",
  "  ███    ███   ███  ███    █▄    ███    ███ ▀███████████ ███    ███ ",
  "  ███    ███   ███  ███    ███   ███    ███   ███    ███ ███    ███ ",
  "  ███    █▀    █▀   ████████▀    ███    █▀    ███    ███  ▀██████▀  ",
  "                                              ███    ███            ",
  "                                                                     ",
  "There is no reasonable excuse for doing anything less than your best.",
  "                          Robert C. Martin                            ",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
