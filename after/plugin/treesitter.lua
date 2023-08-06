require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "python", "cpp", "lua", "vim", "vimdoc", "sql", "typescript", "rust", "java", "javascript",
    "prisma", "yaml", "dart", "gitcommit", "go" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
