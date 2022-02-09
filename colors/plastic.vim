" Name:     plastic vim colorscheme
" Author:   Tuan Pham
" License:  MIT
" Version:  0.0.1

" Global setup ==============================={{{

if exists("*<SID>X")
  delf <SID>X
endif

set background=dark
hi clear
syntax reset

if exists('g:colors_name')
  unlet g:colors_name
endif
let g:colors_name = 'plastic'

if !exists('g:plastic_allow_italics')
  let g:plastic_allow_italics = 0
endif

let s:italic = ''
if g:plastic_allow_italics == 1
  let s:italic = 'italic'
endif

if has('gui_running') || has('termguicolors') || &t_Co == 88 || &t_Co == 256
  fun! <SID>X(group, fg, bg, attr, ...)
    let l:attrsp = get(a:, 1, '')
    " fg, bg, attr, attrsp
    if !empty(a:fg)
      exec 'hi ' . a:group . ' guifg=' . a:fg[0]
      exec 'hi ' . a:group . ' ctermfg=' . a:fg[1]
    endif

    if !empty(a:bg)
      exec "hi " . a:group . " guibg=" .  a:bg[0]
      exec "hi " . a:group . " ctermbg=" . a:bg[1]
    endif

    if a:attr != ""
      exec "hi " . a:group . " gui=" .   a:attr
      exec "hi " . a:group . " cterm=" . a:attr
    endif

    if !empty(l:attrsp)
      exec "hi " . a:group . " guisp=" . l:attrsp[0]
    endif
  endfun

  " Color definition -------------------------{{{
  let s:red = ['#e06c75', '167']
  let s:gray = ['#5f6672', '59']
  let s:green = ['#98c379', '113']
  let s:yellow = ['#e5c07b', '184']
  let s:blue = ['#61afef', '81']
  let s:magenta = ['#b57edc', '177']
  let s:cyan = ['#56b6c2', '44']
  let s:white = ['#d4d7d9', '248']
  let s:mono_1 = ['#828997', '102']
  let s:mono_2 = ['#5c6370', '59']
  let s:mono_3 = ['#4b5263', '59']

  let s:keywords = s:red
  let s:constants = s:cyan
  let s:storage = s:blue
  let s:strings = s:green
  let s:tags = s:yellow
  let s:functions = s:red
  let s:comments = s:gray
  let s:text = s:white
  let s:attributes = ['#d19a66', '215']
  let s:variables = ['#c6ccd7', '251']
  let s:background = ['#21252B', '234']
  let s:cursor = ['#2c323c', '16']
  let s:error = ['#d74e42', '166']
  let s:warning = ['#e9d16c', '166']
  let s:pmenu = ['#333841', '16']
  let s:special_grey = ['#3b4048', '16']
  let s:visual_grey = ['#3e4452', '17']

  " }}}

  " Vim editor color -------------------------{{{
  call <sid>X('Normal', s:text, s:background, '')
  call <sid>X('bold', '', '', 'bold')
  call <sid>X('ColorColumn', '', s:cursor, '')
  call <sid>X('Conceal', s:mono_3, s:background, '')
  call <sid>X('Cursor', '', s:storage, '')
  call <sid>X('CursorIM', '', '', '')
  call <sid>X('CursorColumn', '', s:cursor, '')
  call <sid>X('CursorLine', '', s:cursor, 'none')
  call <sid>X('Directory', s:storage, '', '')
  call <sid>X('ErrorMsg', s:error, s:background, 'none')
  call <sid>X('VertSplit', s:cursor, s:cursor, 'none')
  call <sid>X('Folded', s:text, s:text, 'none')
  call <sid>X('FoldColumn', s:mono_2, s:cursor, '')
  call <sid>X('IncSearch', s:warning, '', '')
  call <sid>X('LineNr', s:mono_3, '', '')
  call <sid>X('CursorLineNr', s:text, s:cursor, 'none')
  call <sid>X('MatchParen', s:attributes, s:cursor, 'underline,bold')
  call <sid>X('Italic', '', '', s:italic)
  call <sid>X('ModeMsg', s:text, '', '')
  call <sid>X('MoreMsg', s:text, '', '')
  call <sid>X('NonText', s:mono_2, '', 'none')
  call <sid>X('PMenu', '', s:pmenu, '')
  call <sid>X('PMenuSel', '', s:mono_3, '')
  call <sid>X('PMenuSbar', '', s:background, '')
  call <sid>X('PMenuThumb', '', s:text, '')
  call <sid>X('Question', s:storage, '', '')
  call <sid>X('Search', s:background, s:tags, '')
  call <sid>X('SpecialKey', s:special_grey, '', 'none')
  call <sid>X('Whitespace', s:special_grey, '', 'none')
  call <sid>X('StatusLine', s:text, s:cursor, 'none')
  call <sid>X('StatusLineNC', s:mono_2, '', '')
  call <sid>X('TabLine', s:mono_1, s:visual_grey, 'none')
  call <sid>X('TabLineFill', s:mono_2, s:visual_grey, 'none')
  call <sid>X('TabLineSel', s:background, s:storage, '')
  call <sid>X('Title', s:text, '', 'bold')
  call <sid>X('Visual', '', s:visual_grey, '')
  call <sid>X('VisualNOS', '', s:visual_grey, '')
  call <sid>X('WarningMsg', s:warning, '', '')
  call <sid>X('TooLong', s:warning, '', '')
  call <sid>X('WildMenu', s:text, s:mono_2, '')
  call <sid>X('SignColumn', '', s:background, '')
  " }}}

  " Vim Help highlighting ---------------------------------------------------{{{
  call <sid>X('helpCommand', s:tags, '', '')
  call <sid>X('helpExample', s:tags, '', '')
  call <sid>X('helpHeader', s:text, '', 'bold')
  call <sid>X('helpSectionDelim', s:mono_2, '', '')
  " }}}

  " Standard syntax highlighting --------------------------------------------{{{
  call <sid>X('Comment', s:comments, '', s:italic)
  call <sid>X('Constant', s:constants, '', '')
  call <sid>X('String', s:strings, '', '')
  call <sid>X('Character', s:variables, '', '')
  call <sid>X('Number', s:constants, '', '')
  call <sid>X('Boolean', s:constants, '', '')
  call <sid>X('Float', s:constants, '', '')
  call <sid>X('Identifier', s:attributes, '', 'none')
  call <sid>X('Function', s:attributes, '', '')
  call <sid>X('Statement', s:tags, '', 'none')
  call <sid>X('Conditional', s:keywords, '', '')
  call <sid>X('Repeat', s:keywords, '', '')
  call <sid>X('Label', s:keywords, '', '')
  call <sid>X('Operator', s:keywords, '', 'none')
  call <sid>X('Keyword', s:keywords, '', '')
  call <sid>X('Exception', s:keywords, '', '')
  call <sid>X('PreProc', s:tags, '', '')
  call <sid>X('Include', s:keywords, '', '')
  call <sid>X('Define', s:keywords, '', 'none')
  call <sid>X('Macro', s:keywords, '', '')
  call <sid>X('PreCondit', s:tags, '', '')
  call <sid>X('Type', s:attributes, '', 'none')
  call <sid>X('StorageClass', s:storage, '', '')
  call <sid>X('Structure', s:keywords, '', '')
  call <sid>X('Typedef', s:keywords, '', '')
  call <sid>X('Special', s:tags, '', '')
  call <sid>X('SpecialChar', '', '', '')
  call <sid>X('Tag', '', '', '')
  call <sid>X('Delimiter', '', '', '')
  call <sid>X('SpecialComment', '', '', '')
  call <sid>X('Debug', '', '', '')
  call <sid>X('Underlined', '', '', 'underline')
  call <sid>X('Ignore', '', '', '')
  call <sid>X('Error', s:error, s:background, 'bold')
  call <sid>X('Todo', s:attributes, s:background, '')
  " }}}

  " Diff highlighting -------------------------------------------------------{{{
  call <sid>X('DiffAdd', s:strings, s:visual_grey, '')
  call <sid>X('DiffChange', s:attributes, s:visual_grey, '')
  call <sid>X('DiffDelete', s:keywords, s:visual_grey, '')
  call <sid>X('DiffText', s:constants, s:visual_grey, '')
  call <sid>X('DiffAdded', s:strings, s:visual_grey, '')
  call <sid>X('DiffFile', s:keywords, s:visual_grey, '')
  call <sid>X('DiffNewFile', s:strings, s:visual_grey, '')
  call <sid>X('DiffLine', s:constants, s:visual_grey, '')
  call <sid>X('DiffRemoved', s:keywords, s:visual_grey, '')
  " }}}

  " Asciidoc highlighting ---------------------------------------------------{{{
  call <sid>X('asciidocListingBlock', s:mono_1, '', '')
  " }}}

  " CSS/Sass highlighting ---------------------------------------------------{{{
  call <sid>X('cssAtKeyword', s:keywords, '', '')
  call <sid>X('cssAttrComma',         s:text,  '', '')
  call <sid>X('cssAttributeSelector', s:attributes,  '', '')
  call <sid>X('cssBraces',            s:text, '', '')
  call <sid>X('cssFunctionName',      s:attributes,  '', '')
  call <sid>X('cssFunction',          s:storage,  '', '')
  call <sid>X('cssIdentifier',        s:storage,  '', '')
  call <sid>X('cssImportant',         s:keywords,  '', '')
  call <sid>X('cssInclude',           s:text, '', '')
  call <sid>X('cssIncludeKeyword',    s:keywords,  '', '')
  call <sid>X('cssProp',              s:text,  '', '')
  call <sid>X('cssCustomProp', s:tags, '', '')
  call <sid>X('cssTagName',           s:attributes, '', '')
  call <sid>X('cssAttr',              s:storage,  '', '')
  " }}}

  " JavaScript highlighting -------------------------------------------------{{{
  call <sid>X('jsGlobalObjects', s:storage, '', '')
  call <sid>X('jsExportDefault', s:keywords, '', '')
  call <sid>X('jsVariableDef', s:variables, '', '')
  " }}}

  " Liquid highlighting -------------------------------------------------{{{
  call <sid>X('liquidKeyword', s:tags, '', '')
  call <sid>X('liquidConditional', s:tags, '', '')
  call <sid>X('liquidRepeat', s:tags, '', '')
  call <sid>X('jsReturn', s:keywords, '', '')
  " }}}

  " Json highlighting -------------------------------------------------{{{
  call <sid>X('jsonKeyword', s:text, '', '')
  call <sid>X('jsonBraces', s:attributes, '', '')
  call <sid>X('jsonQuote', s:text, '', '')
  " }}}

  " Startify highlighting -------------------------------------------------{{{
  call <sid>X('StartifyNumber', s:strings, '', '')
  call <sid>X('StartifyFile', s:keywords, '', '')
  call <sid>X('StartifySlash', s:attributes, '', '')
  call <sid>X('StartifyPath', s:attributes, '', '')
  call <sid>X('StartifyBracket', s:storage, '', '')
  " }}}
endif
" }}}
