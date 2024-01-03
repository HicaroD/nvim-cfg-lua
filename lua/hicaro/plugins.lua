return {
  -- Package manager
  "wbthomason/packer.nvim",

  -- Style
  "Mofiqul/vscode.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSP (WHY SO MANY PLUGINS FOR HAVING A NICE NATIVE LSP SETUP??)
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "quangnguyen30192/cmp-nvim-ultisnips",

  -- Snippet engine (I don't actually feel it is necessary, but nvim-cmp
  -- requires one) Soon I'll be switching over to the native snippet engine
  -- that was added to Neovim
  "SirVer/ultisnips",
  "honza/vim-snippets",

  -- File searching (Tree and fuzzy finder) and code navigation
  "nvim-tree/nvim-tree.lua",
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "akinsho/bufferline.nvim", version = "*" },

  -- Others
  "tpope/vim-surround",
  "mhartington/formatter.nvim",
}
