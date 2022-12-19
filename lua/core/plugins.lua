--[[--------------------------------------]]--
--     plugins + packer - configuration     --
--     	       Author: HícaroD              --
--[[--------------------------------------]]--

local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use {
	'lewis6991/gitsigns.nvim',
	 event = { "CursorMoved", "CursorMovedI" },
	 config = function()
		require("gitsigns")
	 end
    }
    use "wbthomason/packer.nvim"
    use 'Mofiqul/vscode.nvim'
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-lualine/lualine.nvim"
    use "terrortylor/nvim-comment"
    use "norcalli/nvim-colorizer.lua"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "lewis6991/impatient.nvim"
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'folke/lsp-trouble.nvim'
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
