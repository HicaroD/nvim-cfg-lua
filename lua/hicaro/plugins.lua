local plugins = {
  -- Style
  "Mofiqul/vscode.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
  },

  -- File searching (Tree and fuzzy finder) and code navigation
  "nvim-tree/nvim-tree.lua",
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim", "fannheyward/telescope-coc.nvim" },
    lazy = false,
  },
  "akinsho/bufferline.nvim",

  -- Others
  "tpope/vim-surround",
  "mhartington/formatter.nvim",
}

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require("packer")
return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("Mofiqul/vscode.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({
    "neoclide/coc.nvim",
    branch = "release",
  })
  use("nvim-tree/nvim-tree.lua")
  use({
    "nvim-telescope/telescope.nvim",
    branch = "master",
    requires = { "nvim-lua/plenary.nvim", "fannheyward/telescope-coc.nvim" },
  })
  use("akinsho/bufferline.nvim")
  use("tpope/vim-surround")
  use("mhartington/formatter.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- Lazy
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "--single-branch",
--     "https://github.com/folke/lazy.nvim.git",
--     lazypath,
--   })
-- end
-- vim.opt.runtimepath:prepend(lazypath)
--
-- local lazy = require("lazy")
-- lazy.setup(plugins, {
--   performance = {
--     cache = { enabled = true },
--   },
-- })
