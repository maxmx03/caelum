if exists('g:colors_name') 
  hi clear
endif

if exists('g:syntax_on')
  syntax reset
endif

set termguicolors
let g:colors_name = 'caelum'

let g:colors = {
      \ 'background':               '#1F1F1F',
      \ 'background2':              '#363636',  
      \ 'foreground':               '#CABEAC',
      \ 'green':                    '#7B8F5A',
      \ 'yellow':                   '#DCC68D',
      \ 'blue':                     '#677FA3',
      \ 'gray':                     '#848e8A',
      \ 'red':                      '#de6464',
      \ 'orange':                   '#E58538',
      \ 'brown':                    '#9F6A1F',
      \ 'purple':                   '#7B77A0',
      \ 'info':                     '#FFCF62',
      \ 'hint':                     '#1B5569',
      \ 'warn':                     '#E58538',
      \ 'error':                    '#de6464',
      \ 'add':                      '#7B8F5A',
      \ 'change':                   '#E58538',
      \ 'delete':                   '#de6464',
      \ }

function! Hl(group, options)
  let cmd = 'hi! ' . a:group

  if has_key(a:options, 'fg') && a:options.fg !=# ''
    let cmd .= ' guifg=' . g:colors[a:options.fg]
  endif

  if has_key(a:options, 'bg')
    if empty(a:options.bg)
      let cmd .= ' guibg=NONE'
    else
      let cmd .= ' guibg=' . g:colors[a:options.bg]
    endif
  endif

  if has_key(a:options, 'reverse') && a:options.reverse
    let cmd .= ' gui=reverse'
  endif

  if has_key(a:options, 'bold') && a:options.bold
    let cmd .= ' gui=bold'
  endif

  if has_key(a:options, 'italic') && a:options.italic
    let cmd .= ' gui=italic'
  endif

  if has_key(a:options, 'underline') && a:options.underline
    let cmd .= ' gui=underline'
  endif

  if has_key(a:options, 'sp') && a:options.sp !=# ''
    let cmd .= ' guisp=' . g:colors[a:options.sp]
  endif

  if has_key(a:options, 'strikethrough') && a:options.strikethrough
    let cmd .= ' gui=strikethrough'
  endif

  if has_key(a:options, 'undercurl') && a:options.undercurl && has('nvim')
    let cmd .= ' guisp=undercurl'
  endif

  exe cmd
endfunction

function! Lk(group, target)
  exe 'hi! link ' . a:group . ' ' . a:target
endfunction

let s:true = 1
let s:false = 0

" Editor
call Hl('Normal', { 'fg': 'foreground', 'bg': 'background'})
call Lk('NormalNC', 'Normal')
call Hl('NormalFloat', { 'fg': 'foreground', 'bg': 'background2' })
call Hl('Cursor', { 'fg': 'background', 'bg': 'foreground' })
call Lk('CursorIM', 'Cursor')
call Hl('CursorLine', { 'bg': 'background2', 'sp': 'foreground' })
call Lk('CursorColumn', 'CursorLine')
call Hl('CursorLineNr', { 'fg': 'foreground', 'bg': 'background2', 'bold': s:true })
call Hl('LineNr', { 'fg': 'foreground', 'bg': 'background2' })
call Hl('DiffText', { 'fg': 'blue', 'reverse': 1 })
call Hl('DiffAdd', { 'fg': 'green', 'reverse': 1 })
call Hl('DiffChange', { 'fg': 'orange', 'reverse': 1 })
call Hl('DiffDelete', { 'fg': 'red', 'reverse': 1 })
call Hl('Pmenu', { 'fg': 'foreground', 'bg': 'background2' })
call Hl('PmenuSel', { 'bg': 'background' })
call Hl('PmenuSbar', { 'bg': 'background' })
call Hl('PmenuThumb', { 'bg': 'foreground' })
call Hl('WildMenu', { 'bg': 'background2', 'bold': s:true })
call Hl('MsgArea', { 'fg': 'foreground', 'bg': 'background' })
call Hl('ModeMsg', {  'fg': 'foreground', 'bg': 'background', 'bold': s:true  })
call Hl('MsgSeparator', { 'fg': 'foreground', 'bg': 'background', 'bold': s:true })
call Hl('MoreMsg', { 'fg': 'blue' })
call Hl('WarningMsg', { 'fg': 'warn' })
call Hl('ErrorMsg', { 'fg': 'error', 'bg': 'background', 'bold': s:true })
call Hl('MatchParen', { 'fg': 'orange',  'bold': s:true })
call Hl('Tabline', { 'fg': 'foreground', 'bg': 'background2' })
call Hl('Tablinefill', { 'fg': 'background' })
call Hl('Tablinesel', { 'fg': 'foreground', 'bg': 'background' })
call Lk('Search', 'Visual')
call Hl('IncSearch', { 'fg': 'foreground', 'bold': s:true })
call Lk('CurSearch', 'IncSearch')
call Hl('Visual', { 'bg': 'background2' })
call Lk('VisualNOS', 'Visual')
call Hl('Folded', { 'fg': 'gray', 'bg': 'background2' })
call Lk('FoldColumn', 'Normal')
call Lk('ColorColumn', 'CursorColumn')
call Lk('SignColumn', 'FoldColumn')
call Hl('WinSeparator', { 'fg': 'foreground' })
call Lk('FloatBorder', 'WinSeparator')
call Hl('SpellBad', { 'sp': 'error', 'undercurl': s:true })
call Hl('SpellCap', { 'sp': 'warn', 'undercurl': s:true })
call Hl('SpellLocal', { 'sp': 'info', 'undercurl': s:true })
call Hl('SpellRare', { 'sp': 'hint', 'undercurl': s:true })
call Hl('QuickFixLine', { 'bg': 'background2', 'bold': s:true })
call Hl('Directory', { 'fg': 'orange' })
call Hl('Question', { 'fg': 'blue' })
call Hl('NonText', { 'fg': 'foreground', 'bg': 'background' })
call Hl('EndOfBuffer', { 'fg': 'background' })

" Code
call Hl('Comment', { 'fg': 'brown', 'italic': 1 })
call Hl('Constant', { 'fg': 'purple' })
call Hl('String', { 'fg': 'green' })
call Hl('Number', { 'fg': 'purple' })
call Hl('Boolean', { 'fg': 'purple' })
call Hl('Float', { 'fg': 'purple' })
call Hl('Identifier', { 'fg': 'yellow' })
call Hl('Variable', { 'fg': 'foreground' })
call Hl('Function', { 'fg': 'yellow' })
call Hl('Conditional', { 'fg': 'orange', 'bold': s:true })
call Hl('Repeat', { 'fg': 'orange', 'bold': s:true })
call Hl('Label', { 'fg': 'blue', 'bold': s:true })
call Hl('Operator', { 'fg': 'orange', 'bold': s:true })
call Hl('Statement', { 'fg': 'orange', 'bold': s:true })
call Hl('Keyword', { 'fg': 'orange', 'bold': s:true })
call Hl('Exception', { 'fg': 'orange', 'bold': s:true })
call Hl('PreProc', { 'fg': 'orange', 'bold': s:true })
call Hl('Define', { 'fg': 'orange', 'bold': s:true })
call Hl('Macro', { 'fg': 'orange', 'bold': s:true })
call Hl('PreCondit', { 'fg': 'orange', 'bold': s:true })
call Hl('Type', { 'fg': 'blue' })
call Hl('StorageClass', { 'fg': 'orange', 'bold': s:true })
call Hl('Structure', { 'fg': 'orange', 'bold': s:true })
call Hl('Typedef', { 'fg': 'orange', 'bold': s:true })
call Hl('Special', { 'fg': 'purple' })
call Hl('SpecialChar', { 'fg': 'purple' })
call Hl('Tag', { 'fg': 'red', 'bold': s:true })
call Hl('Delimiter', { 'fg': 'foreground' })
call Hl('SpecialComment', { 'fg': 'yellow' })
call Hl('Underlined', { 'fg': 'purple', 'underline': s:true })
call Hl('Bold', { 'fg': 'purple', 'bold': s:true })
call Hl('Italic', { 'fg': 'purple', 'italic': s:true })
call Hl('Underlined', { 'fg': 'purple', 'underline': s:true })
call Hl('Error', { 'fg': 'error' })
call Hl('Title', { 'fg': 'yellow', 'bold': s:true })
call Hl('Todo', { 'fg': 'background', 'bg': 'info', 'bold': s:true })
call Lk('Conceal', 'Keyword')
call Lk('SpecialKey', 'Special')
call Lk('Substitute', 'IncSearch')

if has('nvim')
  " Treesitter
  call Lk('@comment', 'Comment')
  call Lk('@error', 'Error')
  call Lk('@preproc', 'PreProc')
  call Lk('@define', 'Define')
  call Lk('@operator', 'Operator')
  call Lk('@punctuation.delimiter', 'Delimiter')
  call Lk('@punctuation.bracket', 'Delimiter')
  call Lk('@punctuation.special', 'Delimiter')
  call Lk('@string', 'String')
  call Lk('@string.regex', 'Special')
  call Lk('@string.escape', 'Special')
  call Lk('@character', 'Character')
  call Lk('@character.special', 'Special')
  call Lk('@boolean', 'Boolean')
  call Lk('@number', 'Number')
  call Lk('@float', 'Float')
  call Lk('@function', 'Function')
  call Lk('@function.call', 'Function')
  call Lk('@function.builtin', 'Function')
  call Hl('@method', { 'fg': 'yellow' })
  call Hl('@method.call', { 'fg': 'yellow' })
  call Lk('@constructor', '@method')
  call Hl('@parameter', { 'fg': 'foreground', 'italic': s:true })
  call Lk('@keyword', 'Keyword')
  call Lk('@keyword.coroutine', 'Keyword')
  call Lk('@keyword.function', 'Keyword')
  call Lk('@keyword.operator', 'Keyword')
  call Lk('@keyword.return', 'Keyword')
  call Lk('@conditional', 'Conditional')
  call Lk('@conditional.ternary', 'Conditional')
  call Lk('@repeat', 'Repeat')
  call Lk('@label', 'Label')
  call Lk('@include', 'Include')
  call Lk('@exception', 'Exception')
  call Lk('@type', 'Type')
  call Lk('@type.builtin', 'Keyword')
  call Lk('@type.definition', 'Type')
  call Lk('@type.qualifier', 'Keyword')
  call Lk('@storageclass', 'StorageClass')
  call Lk('@attribute', 'Keyword')
  call Hl('@field', { 'fg': 'blue' })
  call Lk('@property', '@field')
  call Lk('@variable', 'Variable')
  call Lk('@variable.builtin', 'Constant')
  call Lk('@constant', 'Constant')
  call Lk('@constant.builtin', 'Constant')
  call Lk('@constant.macro', 'Constant')
  call Lk('@namespace', 'Type')
  call Lk('@symbol', 'Type')
  call Hl('@text', { 'fg': 'foreground' })
  call Lk('@text.strong', 'Bold')
  call Lk('@text.emphasis', 'Italic')
  call Lk('@text.underline', 'Underlined')
  call Hl('@text.strike', { 'strikethrough': s:true })
  call Lk('@text.title', 'Title')
  call Lk('@text.literal', 'String')
  call Hl('@text.uri', { 'fg': 'red', 'underline': s:true })
  call Lk('@text.math', 'Special' )
  call Lk('@text.reference', '@text.uri')
  call Lk('@text.todo', 'Title')
  call Lk('@text.note', 'SpecialComment')
  call Lk('@text.warning', 'WarningMsg')
  call Lk('@text.danger', 'ErrorMsg')
  call Lk('@text.diff.add', 'DiffAdd')
  call Lk('@text.diff.delete', 'DiffDelete')
  call Lk('@tag', 'Tag')
  call Lk('@tag.attribute', '@field')
  call Lk('@tag.delimiter', 'Keyword')

  " Git
  call Hl('SignAdd', { 'fg': 'add' })
  call Hl('SignChange', { 'fg': 'change' })
  call Hl('SignDelete', { 'fg': 'delete' })
  call Hl('GitSignsAdd', { 'fg': 'add' })
  call Hl('GitSignsChange', { 'fg': 'change' })
  call Hl('GitSignsDelete', { 'fg': 'delete' })
  call Hl('GitGutterAdd', { 'fg': 'add' })
  call Hl('GitGutterChange', { 'fg': 'change' })
  call Hl('GitGutterDelete', { 'fg': 'delete' })

  " LSP
  call Hl('LspReferenceText', { 'bg': 'background2', 'bold': s:true })
  call Hl('LspReferenceRead', { 'bg': 'background2', 'bold': s:true })
  call Hl('LspReferenceWrite', { 'bg': 'background2', 'bold': s:true })
  call Hl('DiagnosticHint', { 'fg': 'hint' })
  call Hl('DiagnosticInfo', { 'fg': 'info' })
  call Hl('DiagnosticError', { 'fg': 'error' })
  call Hl('DiagnosticWarn', { 'fg': 'warn' })
  call Hl('DiagnosticOther', { 'fg': 'purple' })
  call Lk('DiagnosticSignHint', 'DiagnosticHint')
  call Lk('DiagnosticSignInfo', 'DiagnosticInfo')
  call Lk('DiagnosticSignWarning', 'DiagnosticWarn')
  call Lk('DiagnosticSignError', 'DiagnosticError')
  call Lk('DiagnosticSignOther', 'DiagnosticOther')
  call Lk('DiagnosticFloatingHint', 'DiagnosticHint')
  call Lk('DiagnosticFloatingInfo', 'DiagnosticInfo')
  call Lk('DiagnosticFloatingWarn', 'DiagnosticWarn')
  call Lk('DiagnosticFloatingError', 'DiagnosticError')
  call Lk('DiagnosticVirtualTextHint', 'DiagnosticHint')
  call Lk('DiagnosticVirtualTextInfo', 'DiagnosticInfo')
  call Lk('DiagnosticVirtualTextWarn', 'DiagnosticWarn')
  call Lk('DiagnosticVirtualTextError', 'DiagnosticError')

  " NvimTree
  call Lk('NvimTreeFolderIcon', 'Directory')
  call Hl('NvimTreeIndentMarker', { 'fg': 'foreground' })
  call Lk('NvimTreeNormal', 'Normal')
  call Lk('NvimTreeNormalNC', 'NormalNC')
  call Lk('NvimTreeWinSeparator', 'WinSeparator')
  call Hl('NvimTreeFolderName', { 'fg': 'foreground' })
  call Hl('NvimTreeOpenedFolderName', { 'fg': 'orange', 'bold': s:true })
  call Lk('NvimTreeEmptyFolderName', 'Comment')
  call Hl('NvimTreeOpenedFile', { 'bg': 'background2' })
endif
