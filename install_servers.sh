#!/bin/bash

declare -a servers=(
  "coc-clangd"        # C / C++ / Objective-C
  "coc-rust-analyzer" # Rust
  "coc-tsserver"      # Javascript / Typescript
  "coc-java"          # Java
  "coc-go"            # Golang
  "coc-pyright"       # Python
  "coc-markdownlint"  # Markdown
  "coc-html"          # HTML
  "coc-css"           # CSS
  "coc-emmet"         # Emmet
  "coc-flutter"       # Flutter
)

for i in "${servers[@]}"
do
   echo "Installing language server: $i"
   COMMAND=""
   nvim --headless +"CocInstall -sync $i" +"qall"
done

echo "Done."
