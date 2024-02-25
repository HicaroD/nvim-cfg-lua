#!/bin/bash

nvim -c ":CocInstall \
  coc-java \
  coc-html \
  coc-css \
  coc-tsserver \
  coc-flutter-tools \
  coc-go \
  coc-clangd \
  coc-pyright \
  coc-markdownlint \
  coc-sumneko-lua \
  coc-rust-analyzer"

nvim -c ":CocInstall \
  coc-json \
  coc-prisma \
  coc-xml \
  coc-floatinput \
  coc-snippets \
  @yaegassy/coc-tailwindcss3 \
  coc-emmet \
  coc-prettier \
  coc-sh"
