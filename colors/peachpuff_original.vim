" Vim color file
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2003-04-23
" URL: http://trific.ath.cx/Ftp/vim/colors/peachpuff.vim

" This color scheme uses a peachpuff background (what you've expected when it's
" called peachpuff?).
"
" Note: Only GUI colors differ from default, on terminal it's just `light'.

" First remove all existing highlighting.
set background=dark
set notermguicolors

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "peachpuff_original"

hi Normal guibg=PeachPuff guifg=Black

hi SpecialKey term=NONE ctermfg=4 guifg=Blue
hi NonText term=NONE cterm=NONE ctermfg=4 gui=NONE guifg=Blue
hi Directory term=NONE ctermfg=4 guifg=Blue
hi ErrorMsg term=standout cterm=NONE ctermfg=7 ctermbg=1 gui=NONE guifg=White guibg=Red
hi IncSearch term=reverse cterm=reverse gui=reverse
hi Search term=reverse ctermbg=3 guibg=Gold2
hi MoreMsg term=NONE ctermfg=2 gui=NONE guifg=SeaGreen
hi ModeMsg term=NONE cterm=NONE gui=NONE
hi LineNr term=underline ctermfg=3 guifg=Red3
hi Question term=standout ctermfg=2 gui=NONE guifg=SeaGreen
hi StatusLine term=NONE,reverse cterm=NONE,reverse gui=NONE guifg=White guibg=Black
hi StatusLineNC term=reverse cterm=reverse gui=NONE guifg=PeachPuff guibg=Gray45
hi VertSplit term=reverse cterm=reverse gui=NONE guifg=White guibg=Gray45
hi Title term=NONE ctermfg=5 gui=NONE guifg=DeepPink3
hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey80 guibg=fg
hi VisualNOS term=NONE,underline cterm=NONE,underline gui=NONE,underline
hi WarningMsg term=standout ctermfg=1 gui=NONE guifg=Red
hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
hi Folded term=standout ctermfg=4 ctermbg=7 guifg=Black guibg=#e3c1a5
hi FoldColumn term=standout ctermfg=4 ctermbg=7 guifg=DarkBlue guibg=Gray80
hi DiffAdd term=NONE ctermbg=4 guibg=White
hi DiffChange term=NONE ctermbg=5 guibg=#edb5cd
hi DiffDelete term=NONE cterm=NONE ctermfg=4 ctermbg=6 gui=NONE guifg=LightBlue guibg=#f6e8d0
hi DiffText term=reverse cterm=NONE ctermbg=1 gui=NONE guibg=#ff8060
hi Cursor guifg=bg guibg=fg
hi lCursor guifg=bg guibg=fg

" Colors for syntax highlighting
hi Comment term=NONE ctermfg=4 guifg=#406090
hi Constant term=underline ctermfg=1 guifg=#c00058
hi Special term=NONE ctermfg=5 guifg=SlateBlue
hi Identifier term=underline ctermfg=6 guifg=DarkCyan
hi Statement term=NONE ctermfg=3 gui=NONE guifg=Brown
hi PreProc term=underline ctermfg=5 guifg=Magenta3
hi Type term=underline ctermfg=2 gui=NONE guifg=SeaGreen
hi Ignore cterm=NONE ctermfg=7 guifg=bg
hi Error term=reverse cterm=NONE ctermfg=7 ctermbg=1 gui=NONE guifg=White guibg=Red
hi Todo term=standout ctermfg=0 ctermbg=3 guifg=Blue guibg=Yellow


