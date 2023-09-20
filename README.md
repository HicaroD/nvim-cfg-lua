# nvim

My Neovim configuration built from scratch with Lua.

## Tools

1. FZF as fuzzy finder
2. Ripgrep as search in files tool

## Front screen

![front](images/front.png)

### Languages

1. Rust

![rust](images/rust.png)

2. Typescript

![typescript](images/typescript.png)

3. Python

![python](images/python.png)

4. Dart

![dart](images/dart.png)

## Configuration

1. CoC

I use CoC for autocompletion. To install all my extensions, use the following command:

```
:CocInstall coc-pyright coc-xml coc-snippets coc-java coc-tsserver coc-go coc-prisma coc-flutter-tools coc-json coc-clangd coc-markdownlint coc-prettier coc-eslint coc-floatinput coc-html coc-css coc-emmet @yaegassy/coc-tailwindcss3
```

2. Telescope

I use Telescope for fuzzy finder.

Remember to install [ripgrep](https://github.com/BurntSushi/ripgrep) for being faster and automatically ignore files inside `.gitignore`.

## License

This project is licensed under the MIT license. See [LICENSE](./LICENSE).
