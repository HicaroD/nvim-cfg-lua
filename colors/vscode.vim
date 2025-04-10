" Vim Code Dark (color scheme)
" https://github.com/tomasiser/vim-code-dark
" Modified by Hicro for simplicity

scriptencoding utf-8

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="codedark"

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)
if &t_Co >= 256
    let g:codedark_term256=1
elseif !exists("g:codedark_term256")
    let g:codedark_term256=0
endif
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . (g:codedark_term256 ? a:fg.cterm256 : a:fg.cterm)
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . (g:codedark_term256 ? a:bg.cterm256 : a:bg.cterm)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
  endif
endfun

" ------------------
" Color definitions:
" ------------------

" Terminal colors (base16):
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "00"
  let s:cterm02 = "08"
  let s:cterm04 = "07"
  let s:cterm06 = "07"
  let s:cterm09 = "06"
  let s:cterm0F = "03"
endif

" General appearance colors:
" (some of them may be unused)

" Transparent background
if !exists("g:codedark_transparent")
    let g:codedark_transparent=0
endif

if !exists("g:codedark_modern")
    let g:codedark_modern=0
endif

let s:cdNone = {'gui': 'NONE', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdFront = {'gui': '#D4D4D4', 'cterm': s:cterm05, 'cterm256': '188'}
let s:cdBack = {'gui': '#1E1E1E', 'cterm': s:cterm00, 'cterm256': '234'}
if g:codedark_modern | let s:cdBack = {'gui': '#1f1f1f', 'cterm': 'NONE', 'cterm256': '234'} | endif
if g:codedark_transparent | let s:cdBack = {'gui': 'NONE', 'cterm': 'NONE', 'cterm256': 'NONE'} | endif

let s:cdTabCurrent = {'gui': '#1E1E1E', 'cterm': s:cterm00, 'cterm256': '234'}
if g:codedark_modern | let s:cdTabCurrent = {'gui': '#1f1f1f', 'cterm': s:cterm00, 'cterm256': '234'} | endif
let s:cdTabOther = {'gui': '#2D2D2D', 'cterm': s:cterm01, 'cterm256': '236'}
if g:codedark_modern | let s:cdTabOther = {'gui': '#181818', 'cterm': s:cterm01, 'cterm256': '236'} | endif
let s:cdTabOutside = {'gui': '#252526', 'cterm': s:cterm01, 'cterm256': '235'}
if g:codedark_modern | let s:cdTabOutside = {'gui': '#181818', 'cterm': s:cterm01, 'cterm256': '236'} | endif

let s:cdLeftDark = {'gui': '#252526', 'cterm': s:cterm01, 'cterm256': '235'}
let s:cdLeftMid = {'gui': '#373737', 'cterm': s:cterm03, 'cterm256': '237'}
if g:codedark_modern | let s:cdLeftMid = {'gui': '#181818', 'cterm': 'NONE', 'cterm256': '237'} | endif
let s:cdLeftLight = {'gui': '#3F3F46', 'cterm': s:cterm03, 'cterm256': '238'}

let s:cdPopupFront = {'gui': '#BBBBBB', 'cterm': s:cterm06, 'cterm256': '250'}
let s:cdPopupBack = {'gui': '#2D2D30', 'cterm': s:cterm01, 'cterm256': '236'}
let s:cdPopupHighlightBlue = {'gui': '#073655', 'cterm': s:cterm0D, 'cterm256': '24'}
let s:cdPopupHighlightGray = {'gui': '#3D3D40', 'cterm': s:cterm03, 'cterm256': '237'}

let s:cdSplitLight = {'gui': '#898989', 'cterm': s:cterm04, 'cterm256': '245'}
let s:cdSplitDark = {'gui': '#444444', 'cterm': s:cterm03, 'cterm256': '238'}
let s:cdSplitThumb = {'gui': '#424242', 'cterm': s:cterm04, 'cterm256': '238'}

let s:cdCursorDarkDark = {'gui': '#222222', 'cterm': s:cterm01, 'cterm256': '235'}
let s:cdCursorDark = {'gui': '#51504F', 'cterm': s:cterm03, 'cterm256': '239'}
let s:cdCursorLight = {'gui': '#AEAFAD', 'cterm': s:cterm04, 'cterm256': '145'}
let s:cdSelection = {'gui': '#264F78', 'cterm': s:cterm03, 'cterm256': '24'}
let s:cdLineNumber = {'gui': '#5A5A5A', 'cterm': s:cterm04, 'cterm256': '240'}

let s:cdDiffRedDark = {'gui': '#4B1818', 'cterm': s:cterm08, 'cterm256': '52'}
if g:codedark_modern | let s:cdDiffRedDark = {'gui': '#da3633', 'cterm': 'NONE', 'cterm256': '52'} | endif
let s:cdDiffRedLight = {'gui': '#6F1313', 'cterm': s:cterm08, 'cterm256': '52'}
let s:cdDiffRedLightLight = {'gui': '#FB0101', 'cterm': s:cterm08, 'cterm256': '09'}
let s:cdDiffGreenDark = {'gui': '#373D29', 'cterm': s:cterm0B, 'cterm256': '237'}
if g:codedark_modern | let s:cdDiffGreenDark = {'gui': '#238636', 'cterm': 'NONE', 'cterm256': '237'} | endif
let s:cdDiffGreenLight = {'gui': '#4B5632', 'cterm': s:cterm09, 'cterm256': '58'}
let s:cdDiffBlueLight = {'gui': '#87d7ff', 'cterm': s:cterm0C, 'cterm256': '117'}
let s:cdDiffBlue = {'gui': '#005f87', 'cterm': s:cterm0D, 'cterm256': '24'}

let s:cdSearchCurrent = {'gui': '#4B5632', 'cterm': s:cterm09, 'cterm256': '58'}
if g:codedark_modern | let s:cdSearchCurrent = {'gui': '#9e6a03', 'cterm': s:cterm09, 'cterm256': '58'} | endif
let s:cdSearch = {'gui': '#773800', 'cterm': s:cterm03, 'cterm256': '94'}

" Syntax colors:

if !exists("g:codedark_conservative")
    let g:codedark_conservative=0
endif

" Italicized comments
if !exists("g:codedark_italics")
    let g:codedark_italics=0
endif

let s:cdGray = {'gui': '#808080', 'cterm': s:cterm04, 'cterm256': '08'}
let s:cdViolet = {'gui': '#646695', 'cterm': s:cterm04, 'cterm256': '60'}
let s:cdBlue = {'gui': '#569CD6', 'cterm': s:cterm0D, 'cterm256': '75'}
let s:cdDarkBlue = {'gui': '#223E55', 'cterm': s:cterm0D, 'cterm256': '73'}
let s:cdLightBlue = {'gui': '#9CDCFE', 'cterm': s:cterm0C, 'cterm256': '117'}
if g:codedark_conservative | let s:cdLightBlue = s:cdFront | endif
let s:cdGreen = {'gui': '#6A9955', 'cterm': s:cterm0B, 'cterm256': '65'}
let s:cdBlueGreen = {'gui': '#4EC9B0', 'cterm': s:cterm0F, 'cterm256': '43'}
let s:cdLightGreen = {'gui': '#B5CEA8', 'cterm': s:cterm09, 'cterm256': '151'}
let s:cdRed = {'gui': '#F44747', 'cterm': s:cterm08, 'cterm256': '203'}
if g:codedark_modern | let s:cdRed = {'gui': '#f85149', 'cterm': s:cterm08, 'cterm256': '203'} | endif
let s:cdOrange = {'gui': '#CE9178', 'cterm': s:cterm0F, 'cterm256': '173'}
let s:cdLightRed = {'gui': '#D16969', 'cterm': s:cterm08, 'cterm256': '167'}
if g:codedark_conservative | let s:cdLightRed = s:cdOrange | endif
let s:cdYellowOrange = {'gui': '#D7BA7D', 'cterm': s:cterm0A, 'cterm256': '179'}
let s:cdYellow = {'gui': '#DCDCAA', 'cterm': s:cterm0A, 'cterm256': '187'}
if g:codedark_conservative | let s:cdYellow = s:cdFront | endif
let s:cdPink = {'gui': '#C586C0', 'cterm': s:cterm0E, 'cterm256': '176'}
if g:codedark_conservative | let s:cdPink = s:cdBlue | endif
let s:cdSilver = {'gui': '#C0C0C0', 'cterm': s:cterm05, 'cterm256': '7'}

" UI (built-in)
"    <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL)
call <sid>hi('Normal', s:cdFront, s:cdBack, 'none', {})
call <sid>hi('ColorColumn', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Cursor', s:cdCursorDark, s:cdCursorLight, 'none', {})
call <sid>hi('CursorLine', {}, s:cdCursorDarkDark, 'none', {})
hi! link CursorColumn CursorLine
call <sid>hi('Directory', s:cdBlue, s:cdNone, 'none', {})
call <sid>hi('DiffAdd', s:cdFront, s:cdDiffGreenLight, 'none', {})
call <sid>hi('DiffChange', s:cdFront, s:cdDiffBlue, 'none', {})
call <sid>hi('DiffDelete', s:cdFront, s:cdDiffRedLight, 'none', {})
call <sid>hi('DiffText', s:cdBack, s:cdDiffBlueLight, 'none', {})
call <sid>hi('EndOfBuffer', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('ErrorMsg', s:cdRed, s:cdBack, 'none', {})
call <sid>hi('VertSplit', s:cdSplitDark, s:cdBack, 'none', {})
call <sid>hi('Folded', s:cdLeftLight, s:cdLeftDark, 'underline', {})
call <sid>hi('FoldColumn', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('SignColumn', {}, s:cdBack, 'none', {})
call <sid>hi('IncSearch', s:cdNone, s:cdSearchCurrent, 'none', {})
call <sid>hi('LineNr', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('CursorLineNr', s:cdPopupFront, s:cdBack, 'none', {})
call <sid>hi('MatchParen', s:cdNone, s:cdCursorDark, 'none', {})
call <sid>hi('ModeMsg', s:cdFront, s:cdLeftDark, 'none', {})
hi! link MoreMsg ModeMsg
call <sid>hi('NonText', s:cdLineNumber, s:cdNone, 'none', {})
call <sid>hi('Pmenu', s:cdPopupFront, s:cdPopupBack, 'none', {})
call <sid>hi('PmenuSel', s:cdPopupFront, s:cdPopupHighlightBlue, 'none', {})
call <sid>hi('PmenuSbar', {}, s:cdPopupHighlightGray, 'none', {})
call <sid>hi('PmenuThumb', {}, s:cdPopupFront, 'none', {})
call <sid>hi('Question', s:cdBlue, s:cdBack, 'none', {})
call <sid>hi('Search', s:cdNone, s:cdSearch, 'none', {})
call <sid>hi('SpecialKey', s:cdLineNumber, s:cdNone, 'none', {})
call <sid>hi('StatusLine', s:cdFront, s:cdLeftMid, 'none', {})
call <sid>hi('StatusLineNC', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('TabLine', s:cdFront, s:cdTabOther, 'none', {})
call <sid>hi('TabLineFill', s:cdFront, s:cdTabOutside, 'none', {})
call <sid>hi('TabLineSel', s:cdFront, s:cdTabCurrent, 'none', {})
call <sid>hi('Title', s:cdNone, s:cdNone, 'bold', {})
call <sid>hi('Visual', s:cdNone, s:cdSelection, 'none', {})
hi! link VisualNOS Visual
call <sid>hi('WarningMsg', s:cdOrange, s:cdBack, 'none', {})
call <sid>hi('WildMenu', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('netrwMarkFile', s:cdFront, s:cdSelection, 'none', {})

" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

if g:codedark_italics | call <sid>hi('Comment', s:cdGreen, {}, 'italic', {}) | else | call <sid>hi('Comment', s:cdGreen, {}, 'none', {}) | endif

" SYNTAX HIGHLIGHT (built-in)
call <sid>hi('Constant', s:cdBlue, {}, 'none', {})
call <sid>hi('String', s:cdOrange, {}, 'none', {})
call <sid>hi('Character', s:cdOrange, {}, 'none', {})
call <sid>hi('Number', s:cdLightGreen, {}, 'none', {})
call <sid>hi('Boolean', s:cdBlue, {}, 'none', {})
hi! link Float Number
call <sid>hi('Identifier', s:cdLightBlue, {}, 'none', {})
call <sid>hi('Function', s:cdYellow, {}, 'none', {})
call <sid>hi('Statement', s:cdPink, {}, 'none', {})
call <sid>hi('Conditional', s:cdPink, {}, 'none', {})
call <sid>hi('Repeat', s:cdPink, {}, 'none', {})
call <sid>hi('Label', s:cdPink, {}, 'none', {})
call <sid>hi('Operator', s:cdFront, {}, 'none', {})
call <sid>hi('Keyword', s:cdPink, {}, 'none', {})
call <sid>hi('Exception', s:cdPink, {}, 'none', {})
call <sid>hi('PreProc', s:cdPink, {}, 'none', {})
call <sid>hi('Include', s:cdPink, {}, 'none', {})
call <sid>hi('Define', s:cdPink, {}, 'none', {})
call <sid>hi('Macro', s:cdPink, {}, 'none', {})
call <sid>hi('PreCondit', s:cdPink, {}, 'none', {})
call <sid>hi('Type', s:cdBlue, {}, 'none', {})
call <sid>hi('StorageClass', s:cdBlue, {}, 'none', {})
call <sid>hi('Structure', s:cdBlue, {}, 'none', {})
call <sid>hi('Typedef', s:cdBlue, {}, 'none', {})
call <sid>hi('Special', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('SpecialChar', s:cdFront, {}, 'none', {})
call <sid>hi('Tag', s:cdFront, {}, 'none', {})
call <sid>hi('Delimiter', s:cdFront, {}, 'none', {})
if g:codedark_italics | call <sid>hi('SpecialComment', s:cdGreen, {}, 'italic', {}) | else | call <sid>hi('SpecialComment', s:cdGreen, {}, 'none', {}) | endif
call <sid>hi('Debug', s:cdFront, {}, 'none', {})
call <sid>hi('Underlined', s:cdNone, {}, 'underline', {})
call <sid>hi("Conceal", s:cdFront, s:cdBack, 'none', {})
call <sid>hi('Ignore', s:cdBack, {}, 'none', {})
call <sid>hi('Error', s:cdRed, s:cdBack, 'undercurl', s:cdRed)
call <sid>hi('Todo', s:cdNone, s:cdLeftMid, 'none', {})
call <sid>hi('SpellBad', s:cdRed, s:cdBack, 'undercurl', s:cdRed)
call <sid>hi('SpellCap', s:cdRed, s:cdBack, 'undercurl', s:cdRed)
call <sid>hi('SpellRare', s:cdRed, s:cdBack, 'undercurl', s:cdRed)
call <sid>hi('SpellLocal', s:cdRed, s:cdBack, 'undercurl', s:cdRed)

" NEOVIM
" Make neovim specific groups load only on Neovim
if has("nvim")
    " hrsh7th/nvim-cmp (github)
    call <sid>hi('CmpItemAbbrDeprecated', s:cdGray, {}, 'none', {})
    call <sid>hi('CmpItemAbbrMatch', s:cdBlue, {}, 'none', {})
    hi! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
    call <sid>hi('CmpItemKindVariable', s:cdLightBlue, {}, 'none', {})
    call <sid>hi('CmpItemKindInterface', s:cdLightBlue, {}, 'none', {})
    call <sid>hi('CmpItemKindText', s:cdLightBlue, {}, 'none', {})
    call <sid>hi('CmpItemKindFunction', s:cdPink, {}, 'none', {})
    call <sid>hi('CmpItemKindMethod ', s:cdPink, {}, 'none', {})
    call <sid>hi('CmpItemKindKeyword', s:cdFront, {}, 'none', {})
    call <sid>hi('CmpItemKindProperty', s:cdFront, {}, 'none', {})
    call <sid>hi('CmpItemKindUnit', s:cdFront, {}, 'none', {})
endif

" MARKDOWN (built-in)
call <sid>hi('markdownH1', s:cdBlue, {}, 'bold', {})
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
call <sid>hi('markdownHeadingDelimiter', s:cdBlue, {}, 'none', {})
call <sid>hi('markdownBold', s:cdBlue, {}, 'bold', {})
call <sid>hi('markdownRule', s:cdBlue, {}, 'bold', {})
call <sid>hi('markdownCode', s:cdOrange, {}, 'none', {})
hi! link markdownCodeDelimiter markdownCode
call <sid>hi('markdownFootnote', s:cdOrange, {}, 'none', {})
hi! link markdownFootnoteDefinition markdownFootnote
call <sid>hi('markdownUrl', s:cdLightBlue, {}, 'underline', {})
call <sid>hi('markdownLinkText', s:cdOrange, {}, 'none', {})
call <sid>hi('markdownEscape', s:cdYellowOrange, {}, 'none', {})

" ASCIIDOC (built-in)
call <sid>hi("asciidocAttributeEntry", s:cdYellowOrange, {}, 'none', {})
call <sid>hi("asciidocAttributeList", s:cdPink, {}, 'none', {})
call <sid>hi("asciidocAttributeRef", s:cdYellowOrange, {}, 'none', {})
call <sid>hi("asciidocHLabel", s:cdBlue, {}, 'bold', {})
call <sid>hi("asciidocListingBlock", s:cdOrange, {}, 'none', {})
call <sid>hi("asciidocMacroAttributes", s:cdYellowOrange, {}, 'none', {})
call <sid>hi("asciidocOneLineTitle", s:cdBlue, {}, 'bold', {})
call <sid>hi("asciidocPassthroughBlock", s:cdBlue, {}, 'none', {})
call <sid>hi("asciidocQuotedMonospaced", s:cdOrange, {}, 'none', {})
call <sid>hi("asciidocTriplePlusPassthrough", s:cdYellow, {}, 'none', {})
call <sid>hi("asciidocMacro", s:cdPink, {}, 'none', {})
call <sid>hi("asciidocAdmonition", s:cdOrange, {}, 'none', {})
call <sid>hi("asciidocQuotedEmphasized", s:cdBlue, {}, 'italic', {})
call <sid>hi("asciidocQuotedEmphasized2", s:cdBlue, {}, 'italic', {})
call <sid>hi("asciidocQuotedEmphasizedItalic", s:cdBlue, {}, 'italic', {})
hi! link asciidocBackslash Keyword
hi! link asciidocQuotedBold markdownBold
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownUrl

" JSON (built-in)
call <sid>hi('jsonKeyword', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsonEscape', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('jsonNull', s:cdBlue, {}, 'none', {})
call <sid>hi('jsonBoolean', s:cdBlue, {}, 'none', {})

" HTML (built-in)
call <sid>hi('htmlTag', s:cdGray, {}, 'none', {})
call <sid>hi('htmlEndTag', s:cdGray, {}, 'none', {})
call <sid>hi('htmlTagName', s:cdBlue, {}, 'none', {})
hi! link htmlSpecialTagName htmlTagName
call <sid>hi('htmlArg', s:cdLightBlue, {}, 'none', {})

" PHP (built-in)
call <sid>hi('phpClass', s:cdBlueGreen, {}, 'none', {})
hi! link phpUseClass phpClass
hi! link phpStaticClasses phpClass
call <sid>hi('phpMethod', s:cdYellow, {}, 'none', {})
call <sid>hi('phpFunction', s:cdYellow, {}, 'none', {})
call <sid>hi('phpInclude', s:cdBlue, {}, 'none', {})
call <sid>hi('phpRegion', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('phpMethodsVar', s:cdLightBlue, {}, 'none', {})

" CSS (built-in)
call <sid>hi('cssBraces', s:cdFront, {}, 'none', {})
call <sid>hi('cssInclude', s:cdPink, {}, 'none', {})
call <sid>hi('cssTagName', s:cdBlue, {}, 'none', {})
call <sid>hi('cssClassName', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssPseudoClass', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssPseudoClassId', s:cdOrange, {}, 'none', {})
call <sid>hi('cssPseudoClassLang', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssIdentifier', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssProp', s:cdLightBlue, {}, 'none', {})
call <sid>hi('cssDefinition', s:cdLightBlue, {}, 'none', {})
call <sid>hi('cssAttr', s:cdOrange, {}, 'none', {})
call <sid>hi('cssAttrRegion', s:cdOrange, {}, 'none', {})
call <sid>hi('cssColor', s:cdOrange, {}, 'none', {})
call <sid>hi('cssFunction', s:cdLightBlue, {}, 'none', {})
call <sid>hi('cssFunctionName', s:cdYellow, {}, 'none', {})
call <sid>hi('cssVendor', s:cdOrange, {}, 'none', {})
call <sid>hi('cssValueNumber', s:cdOrange, {}, 'none', {})
call <sid>hi('cssValueLength', s:cdLightGreen, {}, 'none', {})
call <sid>hi('cssUnitDecorators', s:cdLightGreen, {}, 'none', {})
call <sid>hi('cssStyle', s:cdLightBlue, {}, 'none', {})
call <sid>hi('cssImportant', s:cdBlue, {}, 'none', {})
call <sid>hi('cssSelectorOp', s:cdFront, {}, 'none', {})
call <sid>hi('cssKeyFrameProp2', s:cdLightGreen, {}, 'none', {})

" GIT (built-in)
call <sid>hi('gitcommitHeader', s:cdGray, {}, 'none', {})
call <sid>hi('gitcommitOnBranch', s:cdGray, {}, 'none', {})
call <sid>hi('gitcommitBranch', s:cdPink, {}, 'none', {})
call <sid>hi('gitcommitComment', s:cdGray, {}, 'none', {})
call <sid>hi('gitcommitSelectedType', s:cdGreen, {}, 'none', {})
hi! link gitcommitSelectedFile gitcommitSelectedType
call <sid>hi('gitcommitDiscardedType', s:cdRed, {}, 'none', {})
hi! link gitcommitDiscardedFile gitcommitDiscardedType
hi! link gitcommitOverflow gitcommitDiscardedType
call <sid>hi('gitcommitSummary', s:cdPink, {}, 'none', {})
call <sid>hi('gitcommitBlank', s:cdPink, {}, 'none', {})

call <sid>hi('StructDecl', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('UnionDecl', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('ClassDecl', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('TypeRef', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('TypedefDecl', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('TypeAliasDecl', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('EnumDecl', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('TemplateTypeParameter', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('TypeAliasTemplateDecl', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('ClassTemplate', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('ClassTemplatePartialSpecialization', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('FunctionTemplate', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('TemplateRef', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('TemplateTemplateParameter', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('UsingDeclaration', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('MemberRef', s:cdLightBlue, {}, 'italic', {})
call <sid>hi('MemberRefExpr', s:cdYellow, {}, 'italic', {})
call <sid>hi('Namespace', s:cdSilver, {}, 'none', {})
call <sid>hi('NamespaceRef', s:cdSilver, {}, 'none', {})
call <sid>hi('NamespaceAlias', s:cdSilver, {}, 'none', {})
