" ############################################################################
" Name:       Phoenix color scheme
" Maintainer: Danu Widatama <widatama@gmail.com>
" License:    MIT
" ############################################################################




set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'phoenix'

if exists("g:phoenix_acc")
  let s:accent = g:phoenix_acc
else
  let s:accent = ""
endif

if exists("g:phoenix_bg")
  let s:background = g:phoenix_bg
else
  let s:background = ""
endif

" ============================================================================
" Colors
" ----------------------------------------------------------------------------

" Background                  #191919
" Background (Eighties)       #2D2D2D
" Foreground                  #CCCCCC
" Invisibles                  #6A6A6A
" Comments                    #555555
" CursorLine                  #292929
" CursorLine (Eighties)       #111111
" Selection                   #515151
" Variables                   #787878
" Operator                    #AAAAAA
" Function                    #EFEFEF
" Class                       #DDDDDD


" Blue Prime                  #40BDFF
" Blue Secondary              #5697B8
" Blue Tertiary               #64B2DB


" Red Prime                   #FF3D23
" Red Secondary               #C04B43
" Red Tertiary                #C5282F


" Yellow Prime                #DEDD5A
" Yellow Secondary            #91812B
" Yellow Tertiary             #C3BA4D


" Green Prime                 #87BF19
" Green Secondary             #9FB785
" Green Tertiary              #65910F


" Orange Prime                #C88623
" Orange Secondary            #B58913
" Orange Tertiary             #FBBE1C


" Purple Prime                #B294BB
" Purple Secondary            #A582A3
" Purple Tertiary             #D1AFDD






" ============================================================================
" Text Markup
" ----------------------------------------------------------------------------

hi Normal                     guifg=#CCCCCC guibg=#191919 gui=NONE      ctermfg=250
hi NonText                    guifg=#6A6A6A guibg=NONE    gui=NONE      ctermfg=008
hi Comment                    guifg=#555555 guibg=NONE    gui=NONE      ctermfg=243
hi Constant                   guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Directory                  guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Identifier                 guifg=#787878 guibg=NONE    gui=NONE      ctermfg=246
hi PreProc                    guifg=#787878 guibg=NONE    gui=NONE      ctermfg=246
hi Special                    guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255
hi Statement                  guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi Title                      guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi Type                       guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi SpecialKey                 guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Conditional                guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Operator                   guifg=#AAAAAA guibg=NONE    gui=NONE      ctermfg=246
hi Exception                  guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Label                      guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Repeat                     guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Keyword                    guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi String                     guifg=#5697B8 guibg=NONE    gui=NONE      ctermfg=039
hi Character                  guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Boolean                    guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Number                     guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Function                   guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255
hi Underlined                 guifg=#CCCCCC guibg=NONE    gui=underline ctermfg=250
hi MatchParen                 guifg=#C6C6C6 guibg=NONE    gui=underline ctermfg=250

" ============================================================================
" Highlighting
" ----------------------------------------------------------------------------

hi Cursor                     guifg=#6A6A6A guibg=#EFEFEF gui=NONE      ctermfg=008   ctermbg=255
hi CursorIM                   guifg=#191919 guibg=#CCCCCC gui=NONE      ctermfg=008   ctermbg=255
hi CursorColumn               guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi CursorLine                 guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi Visual                     guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi VisualNOS                  guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi IncSearch                  guifg=#EFEFEF guibg=#64B2DB gui=NONE      ctermfg=255   ctermbg=039
hi Search                     guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi Error                      guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE
hi Todo                       guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226   ctermbg=NONE

" ============================================================================
" Messages
" ----------------------------------------------------------------------------

hi Question                   guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039   ctermbg=NONE
hi ErrorMsg                   guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE    cterm=bold
hi MoreMsg                    guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002   ctermbg=NONE
hi WarningMsg                 guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226   ctermbg=NONE

" ============================================================================
" UI
" ----------------------------------------------------------------------------

hi ColorColumn                guifg=#CCCCCC guibg=#292929 gui=bold      ctermfg=250   ctermbg=008
hi Pmenu                      guifg=#EFEFEF guibg=#191919 gui=NONE      ctermfg=255   ctermbg=000
hi PmenuSel                   guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi PmenuThumb                 guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi StatusLine                 guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=000   ctermbg=250
hi StatusLineNC               guifg=#555555 guibg=NONE    gui=NONE      ctermfg=000   ctermbg=246
hi CursorLineNr               guifg=#DDDDDD guibg=#191919 gui=bold      ctermfg=255   ctermbg=NONE    cterm=bold
hi TabLine                    guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi TabLineFill                guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi FoldColumn                 guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi Folded                     guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi LineNr                     guifg=#6A6A6A guibg=#191919 gui=NONE      ctermfg=245   ctermbg=NONE
hi SignColumn                 guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255   ctermbg=NONE
hi VertSplit                  guifg=#555555 guibg=NONE    gui=NONE      ctermfg=000   ctermbg=246
hi WildMenu                   guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi OverLength                 guifg=NONE    guibg=#20272F gui=NONE      ctermfg=NONE  ctermbg=018


" ============================================================================
" Diff
" ----------------------------------------------------------------------------

hi DiffAdd                    guifg=#87BF19 guibg=NONE    gui=bold      ctermfg=002
hi DiffChange                 guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226
hi DiffDelete                 guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009
hi DiffText                   guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi GitGutterAddDefault        guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
hi GitGutterChangeDefault     guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
hi GitGutterDeleteDefault     guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=009

" ============================================================================
" Spelling
" ----------------------------------------------------------------------------

hi SpellBad                   guisp=#FF3D23 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=009   cterm=underline
hi SpellCap                   guisp=#87BF19 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=002   cterm=underline
hi SpellLocal                 guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline
hi SpellRare                  guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline

" ============================================================================
" Others
" ----------------------------------------------------------------------------

hi helpSpecial                guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi helpHyperTextJump          guifg=#40BDFF guibg=NONE    gui=underline ctermfg=039
hi helpNote                   guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250

" ============================================================================
" Specific Language Syntax
" ----------------------------------------------------------------------------

" Markdown
" ----------------------------------------------------------------------------

hi link                       markdownLinkText            PreProc
hi link                       markdownHeadingDelimiter    Number
hi link                       markdownHeader              Number
hi link                       markdownInlineCode          PreProc
hi link                       markdownFencedCodeBlock     PreProc
hi link                       markdownCodeBlock           PreProc


let g:phoenix_acc = ""
let g:phoenix_bg = ""

function! SetPhoenix(background, accent)
  let g:phoenix_bg = a:background
  let g:phoenix_acc = a:accent
endfunction

command! PhoenixBlue call SetPhoenix("normal", "blue")
            \ | colorscheme phoenix
command! PhoenixRed call SetPhoenix("normal", "red")
            \ | colorscheme phoenix
command! PhoenixGreen call SetPhoenix("normal", "green")
            \ | colorscheme phoenix
command! PhoenixYellow call SetPhoenix("normal", "yellow")
            \ | colorscheme phoenix
command! PhoenixOrange call SetPhoenix("normal", "orange")
            \ | colorscheme phoenix
command! PhoenixPurple call SetPhoenix("normal", "purple")
            \ | colorscheme phoenix

command! PhoenixBlueEighties call SetPhoenix("eighties", "blue")
            \ | colorscheme phoenix
command! PhoenixRedEighties call SetPhoenix("eighties", "red")
            \ | colorscheme phoenix
command! PhoenixGreenEighties call SetPhoenix("eighties", "green")
            \ | colorscheme phoenix
command! PhoenixYellowEighties call SetPhoenix("eighties", "yellow")
            \ | colorscheme phoenix
command! PhoenixOrangeEighties call SetPhoenix("eighties", "orange")
            \ | colorscheme phoenix
command! PhoenixPurpleEighties call SetPhoenix("eighties", "purple")
            \ | colorscheme phoenix

