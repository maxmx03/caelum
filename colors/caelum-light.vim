
if exists('s:colors_name') 
  hi clear
endif

if exists('g:syntax_on')
  syntax reset
endif

set termguicolors
set background=light
let s:colors_name = 'caelum-light'

let s:colors = {
      \ 'background':               '#eee8b9',
      \ 'float_background':         '#ece5b0',
      \ 'foreground':               '#514934',
      \ 'selection':                '#f2edc9',
      \ 'green':                    '#7B8F5A',
      \ 'yellow':                   '#BB9644',
      \ 'blue':                     '#677FA3',
      \ 'gray':                     '#57554d',
      \ 'red':                      '#de6464',
      \ 'orange':                   '#E58538',
      \ 'purple':                   '#7B77A0',
      \ 'magenta':                  '#D885A3',
      \ 'info':                     '#5B8F5A',
      \ 'hint':                     '#BB9644',
      \ 'warn':                     '#E58538',
      \ 'error':                    '#de6464',
      \ 'add':                      '#7B8F5A',
      \ 'change':                   '#BB9644',
      \ 'delete':                   '#de6464',
      \ }

let s:true = 1
let s:false = 0

function! Hl(group, options)
  let cmd = 'hi! ' . a:group

  if has_key(a:options, 'fg') && a:options.fg !=# ''
    let cmd .= ' guifg=' . s:colors[a:options.fg]
  endif

  if has_key(a:options, 'bg')
    if empty(a:options.bg)
      let cmd .= ' guibg=NONE'
    else
      let cmd .= ' guibg=' . s:colors[a:options.bg]
    endif
  else
    let cmd .= ' guibg=NONE'
  endif

  if has_key(a:options, 'reverse')
    if a:options.reverse
      let cmd .= ' gui=reverse'
    else
      let cmd .= ' gui=NONE'
    endif
  endif

  if has_key(a:options, 'bold') && has_key(a:options, 'italic')
    if a:options.bold && a:options.italic
      let cmd .= ' gui=bold,italic'
    elseif a:options.bold
      let cmd .= ' gui=bold'
    elseif a:options.italic
      let cmd .= ' gui=italic'
    else
      let cmd .= ' gui=NONE'
    endif
  elseif has_key(a:options, 'bold')
    if a:options.bold
      let cmd .= ' gui=bold'
    else
      let cmd .= ' gui=NONE'
    endif
  elseif has_key(a:options, 'italic')
    if a:options.italic
      let cmd .= ' gui=italic'
    else
      let cmd .= ' gui=NONE'
    endif
  endif

  if has_key(a:options, 'underline')
    if a:options.underline
      let cmd .= ' gui=underline'
    else
      let cmd .= ' gui=NONE'
    endif
  endif

  if has_key(a:options, 'sp') && a:options.sp !=# ''
    let cmd .= ' guisp=' . s:colors[a:options.sp]
  endif

  if has_key(a:options, 'strikethrough')
    if a:options.strikethrough
      let cmd .= ' gui=strikethrough'
    else
      let cmd .= ' gui=NONE'
    endif
  endif

  if has_key(a:options, 'undercurl')
    if a:options.undercurl && has('nvim')
      let cmd .= ' guisp=undercurl'
    else
      let cmd .= ' guisp=NONE'
    endif
  endif

  exe cmd
endfunction

function! Lk(group, target)
  exe 'hi! link ' . a:group . ' ' . a:target
endfunction

function! ApplyCaelumCustomHl(group)
  let hl_options = {}
  let group_name = substitute(a:group, '\<\w\>', '\u\0', 'g')
  if exists('g:caelum_' . a:group . '_italic')
    let hl_options['italic'] = v:true
  endif
  if exists('g:caelum_' . a:group . '_bold')
    let hl_options['bold'] = v:true
  endif
  if exists('g:caelum_' . a:group . '_fg')
    let hl_options['fg'] = g:caelum_ . a:group . '_fg'
  endif
  if exists('g:caelum_' . a:group . '_bg')
    let hl_options['bg'] = g:caelum_ . a:group . '_bg'
  endif
  call Hl(group_name, hl_options)
endfunction

" Editor
call Hl('Normal', { 'fg': 'foreground', 'bg': 'background' })
call Lk('NormalNC', 'Normal')
call Hl('NormalFloat', { 'fg': 'foreground', 'bg': 'float_background' })
call Hl('Cursor', { 'fg': 'background', 'bg': 'foreground' })
call Lk('CursorIM', 'Cursor')
call Hl('CursorLine', { 'bg': 'selection', 'sp': 'foreground' })
call Lk('CursorColumn', 'CursorLine')
call Hl('CursorLineNr', { 'fg': 'foreground', 'bg': 'background' })
call Hl('LineNr', { 'fg': 'gray', 'bg': 'background' })
call Hl('DiffText', { 'fg': 'blue', 'reverse': s:true })
call Hl('DiffAdd', { 'fg': 'green', 'reverse': s:true })
call Hl('DiffChange', { 'fg': 'orange', 'reverse': s:true })
call Hl('DiffDelete', { 'fg': 'red', 'reverse': s:true })
call Hl('Pmenu', { 'fg': 'foreground', 'bg': 'background' })
call Hl('PmenuSel', { 'bg': 'selection' })
call Hl('PmenuSbar', { 'bg': 'background' })
call Hl('PmenuThumb', { 'bg': 'foreground' })
call Hl('WildMenu', { 'bg': 'background', 'bold': s:true })
call Lk('MsgArea', 'Normal')
call Hl('ModeMsg', {  'fg': 'foreground', 'bg': 'background', 'bold': s:true  })
call Hl('MsgSeparator', { 'fg': 'foreground', 'bg': 'background', 'bold': s:true })
call Hl('MoreMsg', { 'fg': 'blue' })
call Hl('WarningMsg', { 'fg': 'warn' })
call Hl('ErrorMsg', { 'fg': 'error', 'bg': 'background', 'bold': s:true })
call Hl('MatchParen', { 'fg': 'yellow', 'bg': 'background', 'bold': s:true })
call Hl('Tabline', { 'fg': 'foreground', 'bg': 'background' })
call Hl('Tablinefill', { 'fg': 'background' })
call Hl('Tablinesel', { 'fg': 'foreground', 'bg': 'background' })
call Hl('StatusLine', { 'fg': 'foreground', 'bg': 'background' } )
call Hl('StatusLineNC', { 'fg': 'background', 'bg': 'foreground' } )
call Lk('Search', 'Visual')
call Hl('IncSearch', { 'fg': 'foreground', 'bold': s:true })
call Lk('CurSearch', 'IncSearch')
call Hl('Visual', { 'bg': 'selection' })
call Lk('VisualNOS', 'Visual')
call Hl('Folded', { 'fg': 'gray', 'bg': 'selection' })
call Lk('FoldColumn', 'NormalNC')
call Lk('ColorColumn', 'CursorColumn')
call Lk('SignColumn', 'LineNr')
call Hl('WinSeparator', { 'fg': 'float_background', 'bg': 'float_background' })
call Lk('VertSplit', 'WinSeparator')
call Lk('FloatBorder', 'WinSeparator')
call Hl('SpellBad', { 'sp': 'error', 'undercurl': s:true })
call Hl('SpellCap', { 'sp': 'warn', 'undercurl': s:true })
call Hl('SpellLocal', { 'sp': 'info', 'undercurl': s:true })
call Hl('SpellRare', { 'sp': 'hint', 'undercurl': s:true })
call Hl('QuickFixLine', { 'bg': 'selection', 'bold': s:true })
call Hl('Directory', { 'fg': 'orange' })
call Hl('Question', { 'fg': 'blue' })
call Hl('NonText', { 'fg': 'foreground', 'bg': 'background' })
call Hl('EndOfBuffer', { 'fg': 'background' })

" Code
call Hl('Comment', { 'fg': 'gray', 'italic': s:true })
call Hl('Constant', { 'fg': 'purple' })
call Hl('String', { 'fg': 'green' })
call Hl('Number', { 'fg': 'purple' })
call Hl('Boolean', { 'fg': 'purple' })
call Hl('Float', { 'fg': 'purple' })
call Hl('Identifier', { 'fg': 'blue' })
call Hl('Variable', { 'fg': 'foreground' })
call Hl('Function', { 'fg': 'yellow' })
call Hl('Conditional', { 'fg': 'orange'})
call Hl('Repeat', { 'fg': 'orange'})
call Hl('Label', { 'fg': 'blue'})
call Hl('Operator', { 'fg': 'orange'})
call Hl('Statement', { 'fg': 'orange'})
call Hl('Keyword', { 'fg': 'orange' })
call Hl('Exception', { 'fg': 'orange'})
call Hl('PreProc', { 'fg': 'orange'})
call Hl('Define', { 'fg': 'orange'})
call Hl('Macro', { 'fg': 'orange'})
call Hl('PreCondit', { 'fg': 'orange'})
call Hl('Type', { 'fg': 'blue', 'bold': s:false })
call Hl('StorageClass', { 'fg': 'orange'})
call Hl('Structure', { 'fg': 'orange'})
call Lk('Typedef', 'Type')
call Hl('Special', { 'fg': 'purple' })
call Hl('SpecialChar', { 'fg': 'purple' })
call Hl('Tag', { 'fg': 'purple'})
call Hl('Delimiter', { 'fg': 'foreground' })
call Hl('SpecialComment', { 'fg': 'magenta' })
call Hl('Underlined', { 'fg': 'purple', 'underline': s:true })
call Hl('Bold', { 'fg': 'purple', 'bold': s:true })
call Hl('Italic', { 'fg': 'purple', 'italic': s:true })
call Hl('Underlined', { 'fg': 'purple', 'underline': s:true })
call Hl('Error', { 'fg': 'error', 'bg': 'background' })
call Hl('Title', { 'fg': 'yellow', 'bold': s:true })
call Hl('Todo', { 'fg': 'background', 'bg': 'info', 'bold': s:true })
call Lk('Conceal', 'Keyword')
call Lk('SpecialKey', 'Special')
call Lk('Substitute', 'IncSearch')

" javascript
call Lk('jsFuncCall', 'Function')
call Lk('jsFunction', 'Keyword')
call Lk('jsArrowFunction', 'Keyword')
call Lk('jsPrototype', 'Keyword')
call Lk('jsClassDefinition', 'Identifier')
call Lk('jsObjectValue', 'Identifier')
call Lk('jsObjectKey', 'Identifier')

" typescript
call Lk('typescriptImport', 'Keyword')
call Lk('typescriptBraces', 'Delimiter')
call Lk('typescriptVariable', 'Keyword')
call Lk('typescriptMember', 'Function')
call Lk('typescriptIdentifier', 'Constant')
call Hl('typescriptIdentifierName', { 'fg': 'blue' })
call Lk('typescriptInterfaceName', 'Type')
call Lk('typescriptAliasDeclaration', 'Type')
call Lk('typescriptEndColons', 'Delimiter')
call Lk('typescriptGlobal', 'Constant')
call Lk('typescriptConsoleMethod', 'Function')
call Lk('typescriptOperator', 'Operator')
call Lk('typescriptClassName', 'Type')
call Lk('typescriptProp', 'Function')

" html
call Lk('htmlTagName', 'Tag')
call Lk('htmlTag', 'Delimiter')
call Lk('htmlEndTag', 'Delimiter')
call Hl('htmlLink', { 'fg': 'magenta' })
call Lk('htmlSpecialTagName', 'Tag')
call Lk('htmlScriptTag', 'Tag')

" css
call Hl('cssAttr', {'fg': 'magenta'})
call Hl('cssUrl', { 'fg': 'magenta' })
call Lk('cssTagName', 'Tag')
call Lk('cssProp', 'Identifier')
call Lk('cssUnitDecorators', 'String')

" javascriptreact
call Lk('jsxTagName', 'Tag')
call Lk('jsxTag', 'Delimiter')
call Lk('jsxCloseString', 'Delimiter')

" vimscript
call Lk('vimFunc', 'Function')
call Lk('vimUserFunc', 'Function')
call Lk('vimVar', 'Variable')
call Lk('vimOption', 'Constant')

" lua
call Lk('luaLocal', 'Keyword')
call Lk('luaFuncKeyword', 'Keyword')
call Lk('luaFunc', 'Function')
call Lk('luaBuiltin', 'Constant')
call Lk('luaTable', 'Identifier')
call Lk('luaGoto', 'Keyword')

" airblade/vim-gitgutter
call Hl('GitSignsAdd', { 'fg': 'add', 'bg': 'background' })
call Hl('GitSignsChange', { 'fg': 'change', 'bg': 'background' })
call Hl('GitSignsDelete', { 'fg': 'delete', 'bg': 'background' })
call Hl('GitGutterAdd', { 'fg': 'add', 'bg': 'background' })
call Hl('GitGutterChange', { 'fg': 'change', 'bg': 'background' })
call Hl('GitGutterDelete', { 'zfg': 'delete', 'bg': 'background' })

if has('nvim')
  " nvim-treesitter/nvim-treesitter
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
  call Lk('@method', 'Function')
  call Lk('@method.call', 'Function')
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
  call Lk('@lsp.type.class', 'Keyword')
  call Lk('@storageclass', 'StorageClass')
  call Lk('@attribute', 'Keyword')
  call Hl('@field', { 'fg': 'blue' })
  call Lk('@property', '@field')
  call Lk('@variable', 'Variable')
  call Lk('@variable.builtin', 'Constant')
  call Lk('@lsp.type.variable', 'Variable')
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
  call Hl('@text.uri', { 'fg': 'magenta', 'underline': s:true })
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
  call Lk('@tag.delimiter', 'Delimiter')

  " lewis6991 / gitsigns.nvim 
  call Hl('SignAdd', { 'fg': 'add' })
  call Hl('SignChange', { 'fg': 'change' })
  call Hl('SignDelete', { 'fg': 'delete' })

  " neovim / nvim-lspconfig
  call Hl('LspReferenceText', { 'bg': 'selection', 'bold': s:true })
  call Hl('LspReferenceRead', { 'bg': 'selection', 'bold': s:true })
  call Hl('LspReferenceWrite', { 'bg': 'selection', 'bold': s:true })
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

  " nvim-tree/nvim-tree.lua
  call Lk('NvimTreeRootFolder', 'Directory')
  call Lk('NvimTreeFolderIcon', 'Directory')
  call Hl('NvimTreeIndentMarker', { 'fg': 'foreground' })
  call Lk('NvimTreeNormal', 'NormalFloat')
  call Lk('NvimTreeNormalNC', 'NormalFloat')
  call Lk('NvimTreeWinSeparator', 'WinSeparator')
  call Hl('NvimTreeFolderName', { 'fg': 'foreground' })
  call Hl('NvimTreeOpenedFolderName', { 'fg': 'orange', 'bold': s:true })
  call Lk('NvimTreeEmptyFolderName', 'Comment')
  call Lk('NvimTreeEndOfBuffer', 'EndOfBuffer')
  call Lk('NvimTreeCursorLine', 'CursorLine')
  call Lk('NvimTreeGitIgnored', 'Comment')
  call Hl('NvimTreeGitStaged', { 'fg': 'add' })
  call Hl('NvimTreeGitNew', { 'fg': 'add' })
  call Hl('NvimTreeGitRenamed', { 'fg': 'add' })
  call Hl('NvimTreeGitDeleted', { 'fg': 'add' })
  call Hl('NvimTreeGitMerge', { 'fg': 'change' })
  call Hl('NvimTreeGitDirty', { 'fg': 'change' })

  " nvim-neo-tree/neo-tree.nvim
  call Lk('NeoTreeRootName', 'NvimTreeRootFolder')
  call Lk('NeoTreeDirectoryIcon', 'NvimTreeFolderIcon')
  call Lk('NeoTreeIndentMarker', 'NvimTreeIndentMarker')
  call Lk('NeoTreeNormal', 'NvimTreeNormal')
  call Lk('NeoTreeNormalNC', 'NvimTreeNormalNC')
  call Lk('NeoTreeWinSeparator', 'NvimTreeWinSeparator')
  call Lk('NeoTreeDirectoryName', 'NvimTreeFolderName')
  call Lk('NeoTreeOpenedDirectoryName', 'NvimTreeOpenedFolderName')
  call Lk('NeoTreeHiddenByName', 'NvimTreeEmptyFolderName')
  call Lk('NeoTreeEndOfBuffer', 'NvimTreeEndOfBuffer')
  call Lk('NeoTreeCursorLine', 'NvimTreeCursorLine')
  call Lk('NeoTreeGitIgnored', 'NvimTreeGitIgnored')
  call Lk('NeoTreeGitAdded', 'NvimTreeGitStaged')
  call Lk('NeoTreeGitConflict', 'NvimTreeGitDeleted')
  call Lk('NeoTreeGitDeleted', 'NvimTreeGitDeleted')
  call Lk('NeoTreeGitModified', 'NvimTreeGitDirty')
  call Lk('NeoTreeGitUnstaged', 'NvimTreeGitUnstaged')
  call Lk('NeoTreeGitUntracked', 'NvimTreeGitNew')

  " phaazon/hop.nvim
  call Hl('HopPreview', { 'fg': 'foreground' })
  call Hl('HopNextKey', { 'fg': 'magenta' })
  call Hl('HopNextKey1', { 'fg': 'blue' })
  call Hl('HopNextKey2', { 'fg': 'purple' })

  " RRethy/vim-illuminate
  call Hl('illuminatedWord', { 'bg': 'selection' })
  call Lk('illuminatedCurWord', 'illuminatedWord')
  call Lk('IlluminatedWordText', 'illuminatedWord')
  call Lk('IlluminatedWordRead', 'illuminatedWord')
  call Lk('IlluminatedWordWrite', 'illuminatedWord')

  " rcarriga/nvim-notify
  call Hl('NotifyBackground', { 'bg': 'background' })
  call Hl('NotifyERRORBorder', { 'fg': 'error' })
  call Hl('NotifyWARNBorder', { 'fg': 'warn' })
  call Hl('NotifyINFOBorder', { 'fg': 'info' })
  call Hl('NotifyDEBUGBorder', { 'fg': 'purple' })
  call Hl('NotifyTRACEBorder', { 'fg': 'purple' })
  call Lk('NotifyERRORIcon', 'NotifyERRORBorder')
  call Lk('NotifyWARNIcon', 'NotifyWARNBorder')
  call Lk('NotifyINFOIcon', 'NotifyINFOBorder')
  call Lk('NotifyDEBUGIcon', 'NotifyDEBUGBorder')
  call Lk('NotifyTRACEIcon', 'NotifyTRACEBorder')
  call Lk('NotifyERRORTitle', 'NotifyERRORBorder')
  call Lk('NotifyWARNTitle', 'NotifyWARNBorder')
  call Lk('NotifyINFOTitle', 'NotifyINFOBorder')
  call Lk('NotifyDEBUGTitle', 'NotifyDEBUGBorder')
  call Lk('NotifyTRACETitle', 'NotifyTRACEBorder')

  " nvim-telescope/telescope.nvim
  call Lk('TelescopeNormal', 'NormalFloat')
  call Lk('TelescopeBorder', 'WinSeparator')

  " folke/which-key.nvim
  call Hl('WhichKey', { 'fg': 'blue' })
  call Hl('WhichKeyValue', { 'fg': 'purple' })
  call Hl('WhichKeySeparator', { 'fg': 'purple' })
  call Hl('WhichKeyDesc', { 'fg': 'foreground' })

  " glepnir/lspsaga.nvim
  call Lk('SagaNormal', 'NormalFloat')

  " rcarriga/nvim-dap-ui
  call Lk('DapUINormal', 'NormalFloat')
endif

if exists('g:caelum_transparent') && g:caelum_transparent
  call Hl('Normal', { 'fg': 'foreground' })
  call Hl('LineNr', { 'fg': 'gray' })
endif

call ApplyCaelumCustomHl('function')
call ApplyCaelumCustomHl('keyword')
call ApplyCaelumCustomHl('comment')
call ApplyCaelumCustomHl('variable')
