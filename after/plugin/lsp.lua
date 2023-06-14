vim.api.nvim_exec([[
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
]], false)

vim.cmd([[nmap <silent> [d <Plug>(coc-diagnostic-next)]])
vim.cmd([[nmap <silent> ]d <Plug>(coc-diagnostic-previous)]])
vim.cmd([[nmap <silent> gd <Plug>(coc-definition)]])
vim.cmd([[nmap <leader>rn <Plug>(coc-rename)]])
vim.cmd([[nmap <leader>lr <Plug>(coc-references)]])
