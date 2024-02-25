# nvim

My Neovim (`0.9.4`) configuration built from scratch with Lua.

## Setup

```bash
./install_packer.sh # for bootstrapping the Packer plugin manager and installing all plugins
./install_lsp_servers.sh # for installing all LSP servers with CoC
```

## Tools

1. Telescope as fuzzy finder
2. Ripgrep for recursively searches directories for a regex pattern efficiently
   while respecting my `.gitignore`.
3. LSP support with `coc.nvim`
4. Treesitter for nice text highlighting.

## License

This project is licensed under the MIT license. See [LICENSE](./LICENSE).
