vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hidden = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.modifiable = true

-- Swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Style
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 8
vim.opt.updatetime = 300

-- Undo history
vim.cmd([[set undodir=$HOME/.undodir]])
vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.showmode = false

-- Buffers
vim.opt.splitright = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  extends = "»",
}

-- For enabling mouse ("a" - on / "" - off):
vim.opt.mouse = "a"

-- Wild menu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full"

vim.g.python3_host_prog = "/usr/bin/python3.11"
