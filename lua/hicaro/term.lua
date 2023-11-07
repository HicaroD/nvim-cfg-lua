-- Terminal settings
vim.cmd([[
" Splitting terminal at the bottom of the screen
set splitbelow

" Exit buffer when the terminal is closed (using commands like "exit", for example)
autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif

" Go directly to INSERT mode when opening the terminal
autocmd TermOpen * startinsert

" Using <ESC> for going to NORMAL mode in terminal
tnoremap <S-w> <C-\><C-n>
]])
