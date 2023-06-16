require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "sql", "typescript", "rust", "java", "javascript", "prisma", "yaml" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    disable = { "dart" }, -- For performance reasons
    additional_vim_regex_highlighting = false,
  },
}
