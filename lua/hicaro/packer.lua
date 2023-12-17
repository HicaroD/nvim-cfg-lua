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

return require("packer").startup(function(use)
  -- Package manager
  use("wbthomason/packer.nvim")

  -- Style
  use("Mofiqul/vscode.nvim")
  use("nvim-tree/nvim-web-devicons")
  use({
    "nvim-lualine/lualine.nvim",
  })
  -- use({
  --   "nvim-treesitter/nvim-treesitter",
  --   run = ":TSUpdate",
  -- })

  -- LSP (WHY SO MANY PLUGINS FOR HAVING A NICE NATIVE LSP SETUP??)
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("quangnguyen30192/cmp-nvim-ultisnips")

  -- Snippet engine (I don't actually feel it is necessary, but nvim-cmp
  -- requires one) Soon I'll be switching over to the native snippet engine
  -- that was added to Neovim
  use("SirVer/ultisnips")
  use("honza/vim-snippets")

  -- File searching (Tree and fuzzy finder) and code navigation
  use("nvim-tree/nvim-tree.lua")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "master",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({ "akinsho/bufferline.nvim", tag = "*" })

  -- Others
  use("tpope/vim-surround")
  use("mhartington/formatter.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
