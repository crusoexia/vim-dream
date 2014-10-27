" Maintainer: Crusoe Xia (crusoexia)
" URL:        https://github.com/crusoexia/vim-dream
" License:    MIT

" Description:"{{{
" ----------------------------------------------------------------------------
" The RGB colour palette from colourlovers:
" http://www.colourlovers.com/
"
" The original code are from hybrid.vim:
" https://github.com/w0ng/vim-hybrid

"}}}

" Initialisation:"{{{
" ----------------------------------------------------------------------------
if !has("gui_running") && &t_Co < 256
  finish
endif

if !exists("g:dream_use_Xresources")
  let g:dream_use_Xresources = 0
endif

if !exists("g:dream_use_iTerm_colors")
  let g:dream_use_iTerm_colors = 0
endif

set background=light
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "dream-light"

"}}}
" GUI And Cterm Palettes:"{{{
" ----------------------------------------------------------------------------
if has("gui_running")
  let s:vmode      = "gui"
  let s:background = "#ffffff"
  let s:foreground = "#334664"
  let s:selection  = "#c3c3c3"
  let s:line       = "#f3f3f3"
  let s:comment    = "#808890"
  let s:red        = "#bd1550"
  let s:orange     = "#033649"
  let s:yellow     = "#fcfcc4"
  let s:darkyellow = "#f8ca00"
  let s:green      = "#8a9b0f"
  let s:aqua       = "#008c9e"
  let s:blue       = "#6bb6c9"
  let s:purple     = "#7b238d"
  let s:pink       = "#bd1550"
  let s:window     = "#e3e3e3"
  let s:darkcolumn = "#f3f3f3"
  let s:addbg      = "#d7ffaf"
  let s:addfg      = "#5f875f"
  let s:changebg   = "#d7d7ff"
  let s:changefg   = "#5f5f87"
  let s:darkblue   = "#00005f"
  let s:darkcyan   = "#005f5f"
  let s:darkred    = "#6f0000"
  let s:darkpurple = "#5f005f"
else
  let s:vmode      = "cterm"
  let s:background = "255"
  let s:window     = "250"
  let s:darkcolumn = "234"
  let s:addbg      = "65"
  let s:addfg      = "193"
  let s:changebg   = "60"
  let s:changefg   = "189"
  let s:darkblue   = "17"
  let s:darkcyan   = "24"
  let s:darkred    = "52"
  let s:darkpurple = "53"
  if g:dream_use_Xresources == 1
    let s:foreground = "15"   " White
    let s:selection  = "8"    " DarkGrey
    let s:line       = "0"    " Black
    let s:comment    = "7"    " LightGrey
    let s:red        = "9"    " LightRed
    let s:orange     = "3"    " DarkYellow
    let s:yellow     = "11"   " LightYellow
    let s:darkyellow = "11"   " DarkYellow
    let s:green      = "10"   " LightGreen
    let s:aqua       = "14"   " LightCyan
    let s:blue       = "12"   " LightBlue
    let s:purple     = "13"   " LightMagenta
    let s:pink       = "13"   " LightPink
  elseif g:dream_use_iTerm_colors == 1
    let s:background = "NONE"
    let s:foreground = "7"
    let s:selection  = "0"
    let s:line       = "0"
    let s:comment    = "15"
    let s:red        = "1"
    let s:orange     = "11"
    let s:yellow     = "3"
    let s:darkyellow = "3"   
    let s:green      = "2"
    let s:aqua       = "6"
    let s:blue       = "4"
    let s:purple     = "5"
    let s:pink       = "5"
  else
    let s:foreground = "236"
    let s:selection  = "249"
    let s:line       = "253"
    let s:comment    = "243"
    let s:red        = "124"
    let s:orange     = "233"
    let s:yellow     = "186"
    let s:darkyellow = "228"   
    let s:green      = "64"
    let s:aqua       = "30"
    let s:blue       = "38"
    let s:purple     = "90"
    let s:pink       = "13"
  endif
endif

"}}}
" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"}}}
" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
exe "let s:bg_none       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_foreground = ' ".s:vmode."bg=".s:foreground."'"
exe "let s:bg_background = ' ".s:vmode."bg=".s:background."'"
exe "let s:bg_selection  = ' ".s:vmode."bg=".s:selection ."'"
exe "let s:bg_line       = ' ".s:vmode."bg=".s:line      ."'"
exe "let s:bg_comment    = ' ".s:vmode."bg=".s:comment   ."'"
exe "let s:bg_red        = ' ".s:vmode."bg=".s:red       ."'"
exe "let s:bg_orange     = ' ".s:vmode."bg=".s:orange    ."'"
exe "let s:bg_yellow     = ' ".s:vmode."bg=".s:yellow    ."'"
exe "let s:bg_darkyellow = ' ".s:vmode."bg=".s:darkyellow."'"
exe "let s:bg_green      = ' ".s:vmode."bg=".s:green     ."'"
exe "let s:bg_aqua       = ' ".s:vmode."bg=".s:aqua      ."'"
exe "let s:bg_blue       = ' ".s:vmode."bg=".s:blue      ."'"
exe "let s:bg_purple     = ' ".s:vmode."bg=".s:purple    ."'"
exe "let s:bg_pink       = ' ".s:vmode."bg=".s:pink      ."'"
exe "let s:bg_window     = ' ".s:vmode."bg=".s:window    ."'"
exe "let s:bg_darkcolumn = ' ".s:vmode."bg=".s:darkcolumn."'"
exe "let s:bg_addbg      = ' ".s:vmode."bg=".s:addbg     ."'"
exe "let s:bg_addfg      = ' ".s:vmode."bg=".s:addfg     ."'"
exe "let s:bg_changebg   = ' ".s:vmode."bg=".s:changebg  ."'"
exe "let s:bg_changefg   = ' ".s:vmode."bg=".s:changefg  ."'"
exe "let s:bg_darkblue   = ' ".s:vmode."bg=".s:darkblue  ."'"
exe "let s:bg_darkcyan   = ' ".s:vmode."bg=".s:darkcyan  ."'"
exe "let s:bg_darkred    = ' ".s:vmode."bg=".s:darkred   ."'"
exe "let s:bg_darkpurple = ' ".s:vmode."bg=".s:darkpurple."'"

exe "let s:fg_none       = ' ".s:vmode."fg=".s:none      ."'"
exe "let s:fg_foreground = ' ".s:vmode."fg=".s:foreground."'"
exe "let s:fg_background = ' ".s:vmode."fg=".s:background."'"
exe "let s:fg_selection  = ' ".s:vmode."fg=".s:selection ."'"
exe "let s:fg_line       = ' ".s:vmode."fg=".s:line      ."'"
exe "let s:fg_comment    = ' ".s:vmode."fg=".s:comment   ."'"
exe "let s:fg_red        = ' ".s:vmode."fg=".s:red       ."'"
exe "let s:fg_orange     = ' ".s:vmode."fg=".s:orange    ."'"
exe "let s:fg_yellow     = ' ".s:vmode."fg=".s:yellow    ."'"
exe "let s:fg_darkyellow = ' ".s:vmode."fg=".s:darkyellow."'"
exe "let s:fg_green      = ' ".s:vmode."fg=".s:green     ."'"
exe "let s:fg_aqua       = ' ".s:vmode."fg=".s:aqua      ."'"
exe "let s:fg_blue       = ' ".s:vmode."fg=".s:blue      ."'"
exe "let s:fg_purple     = ' ".s:vmode."fg=".s:purple    ."'"
exe "let s:fg_pink       = ' ".s:vmode."fg=".s:pink      ."'"
exe "let s:fg_window     = ' ".s:vmode."fg=".s:window    ."'"
exe "let s:fg_darkcolumn = ' ".s:vmode."fg=".s:darkcolumn."'"
exe "let s:fg_addbg      = ' ".s:vmode."fg=".s:addbg     ."'"
exe "let s:fg_addfg      = ' ".s:vmode."fg=".s:addfg     ."'"
exe "let s:fg_changebg   = ' ".s:vmode."fg=".s:changebg  ."'"
exe "let s:fg_changefg   = ' ".s:vmode."fg=".s:changefg  ."'"
exe "let s:fg_darkblue   = ' ".s:vmode."fg=".s:darkblue  ."'"
exe "let s:fg_darkcyan   = ' ".s:vmode."fg=".s:darkcyan  ."'"
exe "let s:fg_darkred    = ' ".s:vmode."fg=".s:darkred   ."'"
exe "let s:fg_darkpurple = ' ".s:vmode."fg=".s:darkpurple."'"

exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

if has("gui_running")
  exe "let s:sp_none       = ' guisp=".s:none      ."'"
  exe "let s:sp_foreground = ' guisp=".s:foreground."'"
  exe "let s:sp_background = ' guisp=".s:background."'"
  exe "let s:sp_selection  = ' guisp=".s:selection ."'"
  exe "let s:sp_line       = ' guisp=".s:line      ."'"
  exe "let s:sp_comment    = ' guisp=".s:comment   ."'"
  exe "let s:sp_red        = ' guisp=".s:red       ."'"
  exe "let s:sp_orange     = ' guisp=".s:orange    ."'"
  exe "let s:sp_yellow     = ' guisp=".s:yellow    ."'"
  exe "let s:sp_darkyellow = ' guisp=".s:darkyellow."'"
  exe "let s:sp_green      = ' guisp=".s:green     ."'"
  exe "let s:sp_aqua       = ' guisp=".s:aqua      ."'"
  exe "let s:sp_blue       = ' guisp=".s:blue      ."'"
  exe "let s:sp_purple     = ' guisp=".s:purple    ."'"
  exe "let s:sp_pink       = ' guisp=".s:pink      ."'"
  exe "let s:sp_window     = ' guisp=".s:window    ."'"
  exe "let s:sp_addbg      = ' guisp=".s:addbg     ."'"
  exe "let s:sp_addfg      = ' guisp=".s:addfg     ."'"
  exe "let s:sp_changebg   = ' guisp=".s:changebg  ."'"
  exe "let s:sp_changefg   = ' guisp=".s:changefg  ."'"
  exe "let s:sp_darkblue   = ' guisp=".s:darkblue  ."'"
  exe "let s:sp_darkcyan   = ' guisp=".s:darkcyan  ."'"
  exe "let s:sp_darkred    = ' guisp=".s:darkred   ."'"
  exe "let s:sp_darkpurple = ' guisp=".s:darkpurple."'"
else
  let s:sp_none       = ""
  let s:sp_foreground = ""
  let s:sp_background = ""
  let s:sp_selection  = ""
  let s:sp_line       = ""
  let s:sp_comment    = ""
  let s:sp_red        = ""
  let s:sp_orange     = ""
  let s:sp_yellow     = ""
  let s:sp_green      = ""
  let s:sp_aqua       = ""
  let s:sp_blue       = ""
  let s:sp_purple     = ""
  let s:sp_purple     = ""
  let s:sp_window     = ""
  let s:sp_addbg      = ""
  let s:sp_addfg      = ""
  let s:sp_changebg   = ""
  let s:sp_changefg   = ""
  let s:sp_darkblue   = ""
  let s:sp_darkcyan   = ""
  let s:sp_darkred    = ""
  let s:sp_darkpurple = ""
endif

"}}}
" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
"		Conceal"
"		Cursor"
"		CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_red         .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_purple      .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_window      .s:fmt_none
exe "hi! Folded"        .s:fg_comment     .s:bg_window      .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_window      .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_line        .s:fmt_none
"		Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_purple      .s:bg_line        .s:fmt_bold
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"		PmenuSbar"
"		PmenuThumb"
exe "hi! Question"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_red         .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_aqua        .s:bg_red         .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan    .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple  .s:fmt_undr
exe "hi! StatusLine"    .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
"		TabLineFill"
"		TabLineSel"
exe "hi! Title"         .s:fg_aqua        .s:bg_none        .s:fmt_bold
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"		VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
"		WildMenu"

" Use Xresources for background colour
if has('gui_running') || (g:dream_use_Xresources != 1 && g:dream_use_iTerm_colors != 1)
  exe "hi! Normal"        .s:fg_foreground  .s:bg_background  .s:fmt_none
else
  exe "hi! Normal"        .s:fg_foreground  .s:bg_none        .s:fmt_none
endif

"}}}
" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none
exe "hi! Constant"        .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Identifier"      .s:fg_orange      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Type"            .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Special"         .s:fg_aqua        .s:bg_none        .s:fmt_bold
exe "hi! Statement"       .s:fg_orange      .s:bg_none        .s:fmt_bold
exe "hi! PreProc"         .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Operator"        .s:fg_orange      .s:bg_none        .s:fmt_none
exe "hi! Underlined"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! Error"           .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}
" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------
" Diff
"		diffOldFile
"		diffNewFile
"		diffFile
"		diffOnly
"		diffIdentical
"		diffDiffer
"		diffBDiffer
"		diffIsA
"		diffNoEOL
"		diffCommon
hi! link diffRemoved Constant
"		diffChanged
hi! link diffAdded Special
"		diffLine
"		diffSubname
"		diffComment

" Html:"{{{
exe "hi! htmlTag"         .s:fg_orange           .s:bg_none        .s:fmt_none
exe "hi! htmlEndTag"      .s:fg_orange           .s:bg_none        .s:fmt_none
exe "hi! htmlTagName"     .s:fg_purple           .s:bg_none        .s:fmt_none
exe "hi! htmlArg"         .s:fg_aqua             .s:bg_none        .s:fmt_bold
exe "hi! htmlSpecialChar" .s:fg_red              .s:bg_none        .s:fmt_none

" }}}

"}}}
" Legal:"{{{
" ----------------------------------------------------------------------------
" Copyright (c) 2011 Ethan Schoonover
" Copyright (c) 2009-2012 NanoTech
" Copyright (c) 2012 w0ng
" Copyright (c) 2014 Crusoe Xia
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation files (the “Software”), to deal in the Soft‐
" ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software, and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice and this permission notice
" shall be included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

" }}}
