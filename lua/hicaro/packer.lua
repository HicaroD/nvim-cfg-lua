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

    -- Style
    use "Mofiqul/vscode.nvim"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
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

    -- LSP
    use { "neoclide/coc.nvim", branch = "release" }
    use { "fannheyward/telescope-coc.nvim" }


    -- File searching (Tree and fuzzy finder)
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.1',
        requires = { {"nvim-lua/plenary.nvim"}  }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- Others
    use "rcarriga/nvim-notify"
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "tpope/vim-surround"
    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
        require("which-key").setup({})
      end
    }

    -- Performance
    use "lewis6991/impatient.nvim"

    if packer_bootstrap then
        require('packer').sync()
    end
end)
