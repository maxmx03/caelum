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
      \ 'green':                    '#515C39',
      \ 'yellow':                   '#DCC68D',
      \ 'gold':                     '#9B8251',
      \ 'blue':                     '#677FA3',
      \ 'gray':                     '#848e8A',
      \ 'red':                      '#7D4D49',
      \ 'orange':                   '#C38630',
      \ 'brown':                    '#9F6A1F',
      \ 'purple':                   '#4B4755',
      \ 'info':                   '#FFCF62',
      \ 'hint':                   '#1B5569',
      \ 'warn':                   '#E58538',
      \ 'error':                   '#8D1805',
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
call Hl('CursorLine', { 'fg': 'foreground', 'bg': 'background2' })
call Lk('CursorColumn', 'CursorLine')
call Hl('CursorLineNr', { 'fg': 'yellow' })
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
call Hl('MatchParen', { 'fg': 'orange', 'bold': s:true })
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
call Hl('NonText', { 'fg': 'foreground', 'bg': 'background' })

" Code
call Hl('Comment', { 'fg': 'gray', 'italic': 1 })
call Hl('Constant', { 'fg': 'blue' })
call Hl('String', { 'fg': 'green' })
call Hl('Number', { 'fg': 'blue' })
call Hl('Boolean', { 'fg': 'blue' })
call Hl('Float', { 'fg': 'blue' })
call Hl('Identifier', { 'fg': 'yellow' })
call Hl('Function', { 'fg': 'yellow' })
call Hl('Conditional', { 'fg': 'orange' })
call Hl('Repeat', { 'fg': 'orange' })
call Hl('Label', { 'fg': 'orange' })
call Hl('Operator', { 'fg': 'orange' })
call Hl('Statement', { 'fg': 'orange' })
call Hl('Keyword', { 'fg': 'orange', })
call Hl('Exception', { 'fg': 'orange' })
call Hl('PreProc', { 'fg': 'orange' })
call Hl('Define', { 'fg': 'orange' })
call Hl('Macro', { 'fg': 'orange' })
call Hl('PreCondit', { 'fg': 'orange' })
call Hl('Type', { 'fg': 'orange' })
call Hl('StorageClass', { 'fg': 'orange' })
call Hl('Structure', { 'fg': 'orange' })
call Hl('Typedef', { 'fg': 'orange' })
call Hl('Special', { 'fg': 'blue' })
call Hl('SpecialChar', { 'fg': 'blue' })
call Hl('Tag', { 'fg': 'yellow' })
call Hl('Delimiter', { 'fg': 'blue' })
call Hl('SpecialComment', { 'fg': 'yellow' })
call Hl('Underlined', { 'fg': 'blue', 'underline': s:true })
call Hl('Bold', { 'fg': 'blue', 'bold': s:true })
call Hl('Italic', { 'fg': 'blue', 'italic': s:true })
call Hl('Underlined', { 'fg': 'blue', 'underline': s:true })
call Hl('Error', { 'fg': 'error' })
call Hl('Todo', { 'fg': 'background', 'bg': 'info', 'bold': s:true })

