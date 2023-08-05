local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

pcall(require, "impatient")

return require('packer').startup(function(use)
    -- Package manager
    use "wbthomason/packer.nvim"
    use "tjdevries/colorbuddy.nvim"

    -- Style
    use "Mofiqul/vscode.nvim"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use { "nvim-treesitter/playground" }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "goolord/alpha-nvim",
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use { "nvim-tree/nvim-web-devicons" }
    use { "loctvl842/breadcrumb.nvim", requires = { "nvim-tree/nvim-web-devicons" } }
    use { "stevearc/dressing.nvim" }
    use { "akinsho/bufferline.nvim", tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use { "norcalli/nvim-colorizer.lua" }

    -- LSP
    use { "neoclide/coc.nvim", branch = "release" }
    use { "mhartington/formatter.nvim" }
    use { "SirVer/ultisnips" }
    use { "honza/vim-snippets" }

    -- File searching (Tree and fuzzy finder)
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.1',
        requires = { {"nvim-lua/plenary.nvim"}  }
    }
    use "fannheyward/telescope-coc.nvim"
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons",
      }
    }

    -- Others
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "tpope/vim-surround"
    use 'voldikss/vim-floaterm'

    -- Performance
    use "lewis6991/impatient.nvim"

    if packer_bootstrap then
        require('packer').sync()
    end
end)
