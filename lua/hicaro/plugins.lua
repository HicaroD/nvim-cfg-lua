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

  -- Style
  use("Mofiqul/vscode.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- LSP
  use({
    "neoclide/coc.nvim",
    branch = "release",
  })
  use("SirVer/ultisnips")
  use("honza/vim-snippets")

  -- File navigation
  use("nvim-tree/nvim-tree.lua")
  use({
    "nvim-telescope/telescope.nvim",
    branch = "master",
    requires = { "nvim-lua/plenary.nvim", "fannheyward/telescope-coc.nvim" },
  })
  use({
    "akinsho/bufferline.nvim",
    tag = "*",
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({})
    end,
  })
  use("nvim-treesitter/nvim-treesitter-context")

  -- Others
  use("mhartington/formatter.nvim")

  if packer_bootstrap then
    packer.sync()
  end
end)
