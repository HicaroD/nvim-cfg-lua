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
    use "lifepillar/vim-gruvbox8"
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
    use {'stevearc/dressing.nvim'}

    -- LSP
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
    use { 
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        'nvim-lua/plenary.nvim',
      },
    }

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
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use "tpope/vim-surround"

    -- Performance
    use "lewis6991/impatient.nvim"

    if packer_bootstrap then
        require('packer').sync()
    end
end)
