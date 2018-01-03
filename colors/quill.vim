" ==============================================================================
"
"   Name:       Quill
"   Author:     Hristo Vladev <hr.vladev@gmail.com>
"   URL:        https://github.com/hrvladev/quill
"   License:    The MIT License (MIT)
"
"   Some kind of port of Atom One dark syntax theme.
"
" ==============================================================================


" ------------------------------------------------------------------------------
" Useful stuff for developing colorschemes
" ------------------------------------------------------------------------------
"
" :source $VIMRUNTIME/syntax/hitest.vim
" :help group-name
" :help highlight-groups
" :help cterm-colors
"
" https://www.webpagefx.com/web-design/color-picker/


" ------------------------------------------------------------------------------
" Initialization
" ------------------------------------------------------------------------------

set background=dark
highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'quill'


" ------------------------------------------------------------------------------
" Color palette
" ------------------------------------------------------------------------------

let s:palette = {}

let s:palette.fg = '#abb2bf'
let s:palette.bg = '#282c34'

let s:palette.blue    = '#61afef'
let s:palette.cyan    = '#56b6c2'
let s:palette.green   = '#98c379'
let s:palette.orange  = '#d19a66'
let s:palette.purple  = '#c678dd'
let s:palette.red     = '#e06c75'
let s:palette.yellow  = '#e5c07b'

let s:palette.statusline   = '#1c1f24' " darker -> #181a1f
let s:palette.cursor       = '#4968a7'
let s:palette.linenr       = '#495060'
let s:palette.comment      = '#5c6370'
let s:palette.cursorlinenr = '#abb2bf'
let s:palette.cursorline   = '#2e333f'
let s:palette.visual       = '#3e4451'
let s:palette.nontext      = '#3c404a'


" ------------------------------------------------------------------------------
" Utilities
" ------------------------------------------------------------------------------

function! s:highlight(group, fg, bg, attr_list)
  let l:guifg   = a:fg == 'NONE' ? 'NONE' : s:palette[a:fg]
  let l:guibg   = a:bg == 'NONE' ? 'NONE' : s:palette[a:bg]

  let l:highlight_command  = 'highlight! ' . a:group
  let l:highlight_command .= ' guifg=' . l:guifg     . ' guibg=' . l:guibg
  let l:highlight_command .= ' gui='   . a:attr_list . ' cterm=' . a:attr_list

  exec l:highlight_command
endfun


" ------------------------------------------------------------------------------
" Editor Highlighting
" ------------------------------------------------------------------------------

call s:highlight('Normal'             , 'fg'           , 'bg'         , 'NONE')
call s:highlight('Visual'             , 'NONE'         , 'visual'     , 'NONE')

call s:highlight('Cursor'             , 'NONE'         , 'cursor'     , 'NONE')
call s:highlight('CursorLine'         , 'NONE'         , 'cursorline' , 'NONE')
call s:highlight('CursorLineNr'       , 'cursorlinenr' , 'cursorline' , 'NONE')
call s:highlight('LineNr'             , 'linenr'       , 'NONE'       , 'NONE')
highlight! link ColorColumn CursorLine

call s:highlight('StatusLine'         , 'cursorlinenr' , 'statusline' , 'NONE')
call s:highlight('StatusLineNC'       , 'linenr'       , 'statusline' , 'NONE')

call s:highlight('TabLine'            , 'linenr'       , 'statusline' , 'NONE')
call s:highlight('TabLineFill'        , 'NONE'         , 'statusline' , 'NONE')
call s:highlight('TabLineSel'         , 'cursorlinenr' , 'statusline' , 'bold')

call s:highlight('Folded'             , 'cursor'       , 'NONE'       ,'NONE')
highlight! link FoldColumn Folded

call s:highlight('Title'              , 'green'        , 'NONE'       , 'NONE')
call s:highlight('Question'           , 'green'        , 'NONE'       , 'NONE')
call s:highlight('MoreMsg'            , 'green'        , 'NONE'       , 'NONE')
call s:highlight('ErrorMsg'           , 'red'          , 'NONE'       , 'NONE')
call s:highlight('WarningMsg'         , 'yellow'       , 'NONE'       , 'NONE')
call s:highlight('ModeMsg'            , 'green'        , 'NONE'       , 'NONE')

call s:highlight('NonText'            , 'nontext'      , 'NONE'       , 'NONE')
call s:highlight('EndOfBuffer'        , 'bg'           , 'NONE'       , 'NONE')
call s:highlight('TrailingWhitespace' , 'red'          , 'red'        , 'NONE')
highlight! link SpecialKey NonText
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

call s:highlight('Pmenu'              , 'linenr'       , 'cursorline' , 'NONE')
call s:highlight('PmenuSel'           , 'fg'           , 'visual'     , 'bold')
call s:highlight('PmenuSbar'          , 'NONE'         , 'statusline' , 'NONE')
call s:highlight('PmenuThumb'         , 'NONE'         , 'linenr'     , 'NONE')

call s:highlight('Search'             , 'bg'           , 'yellow'     , 'NONE')
call s:highlight('VertSplit'          , 'statusline'   , 'statusline' , 'NONE')
call s:highlight('MatchParen'         , 'NONE'         , 'NONE'       , 'underline,bold,inverse')


" ------------------------------------------------------------------------------
" Syntax Highlighting
" ------------------------------------------------------------------------------

" Common (see :help group-name)
call s:highlight('Comment'        , 'comment' , 'NONE' , 'italic')

call s:highlight('Constant'       , 'orange'  , 'NONE' , 'NONE')
call s:highlight('String'         , 'green'   , 'NONE' , 'NONE')
call s:highlight('Character'      , 'green'   , 'NONE' , 'NONE')

call s:highlight('Identifier'     , 'red'     , 'NONE' , 'NONE')
call s:highlight('Function'       , 'blue'    , 'NONE' , 'NONE')

call s:highlight('Statement'      , 'purple'  , 'NONE' , 'NONE')

call s:highlight('PreProc'        , 'cyan'    , 'NONE' , 'NONE')

call s:highlight('Type'           , 'green'   , 'NONE' , 'NONE')

call s:highlight('Special'        , 'red'     , 'NONE' , 'NONE')
call s:highlight('SpecialComment' , 'fg'      , 'NONE' , 'NONE')

call s:highlight('Underlined'     , 'blue'    , 'NONE' , 'underline')
call s:highlight('Error'          , 'red'     , 'NONE' , 'NONE')
call s:highlight('Todo'           , 'yellow'  , 'NONE' , 'underline,italic')

" Ruby
call s:highlight('rubyClassName' , 'yellow' , 'NONE' , 'NONE')
call s:highlight('rubyRegexp'    , 'yellow' , 'NONE' , 'NONE')
call s:highlight('rubySymbol'    , 'cyan'   , 'NONE' , 'NONE')

highlight! link rubyAttribute              Function
highlight! link rubyInclude                Function
highlight! link rubyMacro                  Function

highlight! link rubyDefine                 Statement
highlight! link rubyClass                  Statement

highlight! link rubyConstant               Constant
highlight! link rubyInstanceVariable       Identifier
highlight! link rubyInterpolationDelimiter Special
highlight! link rubyOperator               Statement
highlight! link rubyRegexpDelimiter        rubyRegexp
highlight! link rubyStringDelimiter        String
highlight! link rubyStringEscape           Special

" Vimscript
highlight! link vimCommentTitle SpecialComment
