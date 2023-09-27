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
  use("HicaroD/alice.nvim")
  use("nvim-lualine/lualine.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("Mofiqul/vscode.nvim")
  use("nvim-treesitter/nvim-treesitter")

  -- use({ "nvim-tree/nvim-web-devicons" })
  use({
    "akinsho/bufferline.nvim",
    tag = "*",
  })
  use("norcalli/nvim-colorizer.lua")

  -- LSP
  use({ "neoclide/coc.nvim", branch = "release" })
  use("mhartington/formatter.nvim")

  -- Snippets
  use("SirVer/ultisnips")
  use("honza/vim-snippets")

  -- File searching (Tree and fuzzy finder)
  use("junegunn/fzf.vim")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use("fannheyward/telescope-coc.nvim")
  use("nvim-tree/nvim-tree.lua")

  -- Others
  use("tpope/vim-surround")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
