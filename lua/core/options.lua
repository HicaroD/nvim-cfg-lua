--[[------------------------------------]]--
--       	   options                --
--             Author: HícaroD            --
--[[------------------------------------]]--


--[[------------------------------------]]--
--             General settings           --
--[[------------------------------------]]--

-- TODO: refactor set commands with functions, loops and lists
local set = vim.opt
set.swapfile = false
set.number = true
set.updatetime = 0
set.encoding="utf-8"
set.fileencoding="utf-8"
set.smartindent = true
set.shell = "/bin/zsh" -- Requires zsh
vim.cmd [[set nobackup]]
vim.cmd [[set nowritebackup]]
vim.cmd [[set formatoptions-=cro]]
vim.cmd [[set complete+=kspell]]
vim.cmd [[set completeopt=menuone,longest]]
vim.cmd [[set nocompatible]]

--[[------------------------------------]]--
--               Interface                --
--[[------------------------------------]]--
set.ruler = true
set.title = true
set.ignorecase = true
set.background = "dark"
set.termguicolors = true
vim.cmd [[setlocal conceallevel=2]]
vim.cmd [[set noshowmode]]
vim.cmd [[syntax enable]]
vim.cmd [[set t_Co=256]]

--[[------------------------------------]]--
--               Performance              --
--[[------------------------------------]]--
set.hidden = true
set.timeoutlen = 500
set.lazyredraw = true
set.synmaxcol = 240
set.updatetime = 700

