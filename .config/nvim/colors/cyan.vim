if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="cyan"

hi Normal                   cterm=NONE              ctermfg=232         ctermbg=231         gui=NONE                guifg=#000000       guibg=#ffffff
hi Unfocused                cterm=NONE              ctermfg=NONE        ctermbg=255         gui=NONE                guifg=NONE          guibg=#f8f8f8
hi Cursor                   cterm=NONE              ctermfg=231         ctermbg=161         gui=NONE                guifg=white         guibg=#ff0066
hi Cursorline               cterm=NONE              ctermfg=NONE        ctermbg=255         gui=NONE                guifg=NONE          guibg=#f8f8f8
hi CursorlineNr             cterm=NONE              ctermfg=219         ctermbg=NONE        gui=NONE                guifg=#ffa6ca       guibg=NONE
hi ColorColumn              cterm=NONE              ctermfg=NONE        ctermbg=255         gui=NONE                guifg=NONE          guibg=#f8f8f8
hi LineNr                   cterm=NONE              ctermfg=250         ctermbg=NONE        gui=NONE                guifg=#bbbbbb       guibg=NONE
hi SpecialKey               cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi NonText                  cterm=bold              ctermfg=255                             gui=bold                guifg=#e0e0e0       guibg=NONE
hi Directory                cterm=bold,italic       ctermfg=NONE                            gui=bold,italic         guifg=NONE
hi ErrorMsg                 cterm=NONE              ctermfg=231         ctermbg=161         gui=NONE                guifg=#ff0066       guibg=#ffffff
hi IncSearch                cterm=NONE              ctermfg=231         ctermbg=0           gui=NONE                guifg=#ffffff       guibg=#000000
hi Search                   cterm=NONE              ctermfg=NONE        ctermbg=159         gui=NONE                guifg=#000000       guibg=#d7ffff
hi CurSearch                cterm=NONE              ctermfg=NONE        ctermbg=159         gui=NONE                guifg=#000000       guibg=#d7ffff
hi MoreMsg                  cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi ModeMsg                  cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Question                 cterm=standout          ctermfg=NONE                            gui=standout            guifg=NONE
hi StatusLine               cterm=bold              ctermfg=NONE        ctermbg=255         gui=bold                guifg=#000000       guibg=#f2f2f2
hi StatusLineNC             cterm=bold              ctermfg=NONE        ctermbg=255         gui=bold                guifg=#000000       guibg=#f2f2f2
hi StatusLineTerm           cterm=bold              ctermfg=NONE        ctermbg=255         gui=bold                guifg=#000000       guibg=#f2f2f2
hi StatusLineTermNC         cterm=bold              ctermfg=NONE        ctermbg=255         gui=bold                guifg=#000000       guibg=#f2f2f2
hi VertSplit                cterm=NONE              ctermfg=255         ctermbg=231         gui=NONE                guifg=#f8f8f8       guibg=#ffffff
hi SignColumn               cterm=NONE              ctermfg=30          ctermbg=NONE        gui=bold                guifg=#008888       guibg=NONE
hi Title                    cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Visual                   cterm=NONE              ctermfg=NONE        ctermbg=123         gui=NONE                guifg=NONE          guibg=#b0ffff
hi VisualNOS                cterm=NONE              ctermfg=NONE        ctermbg=230         gui=NONE                guifg=NONE          guibg=#ffffcc
hi Underlined               cterm=underline         ctermfg=NONE                            gui=bold,underline      guifg=NONE
hi WarningMsg               cterm=standout          ctermfg=NONE                            gui=standout            guifg=NONE
hi WildMenu                 cterm=bold              ctermfg=231         ctermbg=37          gui=bold                guifg=#ffffff       guibg=#00b0b0
hi PMenu                    cterm=NONE              ctermfg=16          ctermbg=254         gui=NONE                guifg=#000000       guibg=#e8e8e8
hi PMenuSel                 cterm=NONE              ctermfg=231         ctermbg=16          gui=NONE                guifg=#ffffff       guibg=#000000
hi PMenuSbar                cterm=NONE              ctermfg=253         ctermbg=253         gui=NONE                guifg=#000000       guibg=#d8d8d8
hi PMenuThumb               cterm=NONE              ctermfg=16          ctermbg=16          gui=NONE                guifg=#000000       guibg=#000000
hi Folded                   cterm=bold,italic       ctermfg=249         ctermbg=231         gui=bold,italic         guifg=#aaaaaa       guibg=NONE
hi FoldColumn               cterm=italic            ctermfg=249         ctermbg=231         gui=italic              guifg=#aaaaaa       guibg=NONE
hi DiffAdd                  cterm=NONE              ctermfg=NONE        ctermbg=195         gui=NONE                guifg=NONE          guibg=#ecffff
hi DiffAdded                cterm=NONE              ctermfg=NONE        ctermbg=195         gui=NONE                guifg=NONE          guibg=#ecffff
hi DiffChange               cterm=bold              ctermfg=NONE        ctermbg=230         gui=NONE                guifg=NONE          guibg=#ffffe8
hi DiffDelete               cterm=bold              ctermfg=161         ctermbg=NONE        gui=bold                guifg=#ff0066       guibg=#fff7f9
hi DiffRemoved              cterm=NONE              ctermfg=161         ctermbg=NONE        gui=NONE                guifg=#ff0066       guibg=#fff7f9
hi DiffText                 cterm=bold              ctermfg=232         ctermbg=187         gui=NONE                guifg=NONE          guibg=#e8e8d0
hi Comment                  cterm=bold              ctermfg=250                             gui=bold                guifg=darkgrey
hi SpecialComment           cterm=bold              ctermfg=248                             gui=bold                guifg=#808080
hi jsDocParam               cterm=NONE              ctermfg=NONE                            gui=bold                guifg=darkgrey
hi jsDocTags                cterm=NONE              ctermfg=NONE                            gui=bold                guifg=#888888
hi jsDocType                cterm=NONE              ctermfg=NONE                            gui=bold                guifg=#888888
hi jsDocTypeNoParam         cterm=NONE              ctermfg=NONE                            gui=bold                guifg=#888888
hi Constant                 cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Special                  cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Identifier               cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Function                 cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Statement                cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi PreProc                  cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Type                     cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi Ignore                   cterm=bold              ctermfg=255                             gui=bold                guifg=#f0f0f0
hi Error                    cterm=bold              ctermfg=161         ctermbg=NONE        gui=bold                guifg=#ff0066       guibg=#ffe0e9
hi Todo                     cterm=bold              ctermfg=37          ctermbg=254         gui=bold                guifg=#008888       guibg=#e0e0e0
hi String                   cterm=NONE              ctermfg=30                              gui=NONE                guifg=#008888
hi SpellBad                 cterm=NONE              ctermfg=161         ctermbg=NONE        gui=undercurl           guisp=#ff0066
hi SpellCap                 cterm=NONE              ctermfg=161         ctermbg=NONE        gui=undercurl           guisp=#008888
hi SpellRare                cterm=NONE              ctermfg=161         ctermbg=NONE        gui=undercurl           guisp=#888888
hi TabLineFill              cterm=NONE              ctermfg=249         ctermbg=255         gui=bold                guifg=#808080       guibg=#f2f2f2
hi TabLine                  cterm=bold              ctermfg=232         ctermbg=254         gui=bold                guifg=#000000       guibg=#e8e8e8
hi TabLineSel               cterm=bold              ctermfg=231         ctermbg=44          gui=bold                guifg=#ffffff       guibg=#00c0c0
hi Sneak                    cterm=NONE              ctermfg=NONE        ctermbg=229         gui=NONE                guifg=NONE          guibg=#ffff88
hi SneakLabel               cterm=underline         ctermfg=16          ctermbg=227         gui=underline           guifg=#000000       guibg=#ffff60

hi User1                    cterm=bold              ctermfg=231         ctermbg=232         gui=bold                guifg=#ffffff       guibg=#000000
hi User2                    cterm=bold              ctermfg=231         ctermbg=197         gui=bold                guifg=#ffffff       guibg=#ff0066
hi User3                    cterm=bold              ctermfg=231         ctermbg=30          gui=bold                guifg=#ffffff       guibg=#008888
hi User4                    cterm=bold              ctermfg=231         ctermbg=37          gui=bold                guifg=#ffffff       guibg=#00c0c0
hi User5                    cterm=bold              ctermfg=NONE        ctermbg=NONE        gui=bold                guifg=NONE          guibg=NONE
hi User7                    cterm=bold              ctermfg=NONE        ctermbg=NONE        gui=bold                guifg=NONE          guibg=NONE
hi User8                    cterm=bold              ctermfg=NONE        ctermbg=NONE        gui=bold                guifg=NONE          guibg=NONE
hi User9                    cterm=bold              ctermfg=232         ctermbg=254         gui=bold                guifg=#000000       guibg=#e0e0e0

hi Highlight                cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=NONE          guibg=#44ffff
hi Matchparen               cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=NONE          guibg=#bbffff
hi TrailingWhitespace       cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=#ff0066       guibg=#ffe0e9

hi BufferActive             cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi BufferNormal             cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi BufferSelected           cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi BufferActiveSelected     cterm=bold              ctermfg=NONE                            gui=bold                guifg=NONE
hi TagbarAccessPublic       cterm=NONE              ctermfg=NONE                            gui=NONE                guifg=NONE
hi TagbarAccessPrivate      cterm=NONE              ctermfg=NONE                            gui=NONE                guifg=NONE
hi TagbarVisibilityPublic   cterm=NONE              ctermfg=NONE                            gui=NONE                guifg=NONE
hi TagbarVisibilityPrivate  cterm=NONE              ctermfg=NONE                            gui=NONE                guifg=NONE

hi fzf1                     cterm=bold              ctermfg=NONE        ctermbg=NONE        gui=bold                guifg=NONE          guibg=NONE
hi fzf2                     cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=#008888       guibg=NONE
hi fzf3                     cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=NONE          guibg=NONE

if &background == 'dark'
    hi Normal               cterm=NONE              ctermfg=231         ctermbg=232         gui=NONE                guifg=#ffffff       guibg=#000000
    hi Unfocused            cterm=NONE              ctermfg=NONE        ctermbg=234         gui=NONE                guifg=NONE          guibg=#202020
    hi Cursorline           cterm=NONE              ctermfg=NONE        ctermbg=233         gui=NONE                guifg=NONE          guibg=#303030
    hi ColorColumn          cterm=NONE              ctermfg=NONE        ctermbg=233         gui=NONE                guifg=NONE          guibg=#303030
    hi Visual               cterm=NONE              ctermfg=232         ctermbg=123         gui=NONE                guifg=#000000       guibg=#88ffff
    hi VisualNOS            cterm=NONE              ctermfg=NONE        ctermbg=58          gui=NONE                guifg=NONE          guibg=#606000
    hi NonText              cterm=bold              ctermfg=0                               gui=bold                guifg=#303030
    hi Search               cterm=NONE              ctermfg=232         ctermbg=6           gui=NONE                guifg=#444444       guibg=#ccffff
    hi CurSearch            cterm=NONE              ctermfg=232         ctermbg=6           gui=NONE                guifg=#444444       guibg=#ccffff
    hi IncSearch            cterm=NONE              ctermfg=0           ctermbg=14          gui=NONE                guifg=#444444       guibg=#00ffff
    hi LineNr               cterm=NONE              ctermfg=7           ctermbg=NONE        gui=NONE                guifg=#bbbbbb       guibg=NONE
    hi StatusLine           cterm=bold              ctermfg=7           ctermbg=235         gui=bold                guifg=#dcdcdc       guibg=#202020
    hi StatusLineNC         cterm=NONE              ctermfg=7           ctermbg=234         gui=NONE                guifg=#cccccc       guibg=#202020
    hi StatusLineTerm       cterm=bold              ctermfg=7           ctermbg=235         gui=bold                guifg=#dcdcdc       guibg=#202020
    hi StatusLineTermNC     cterm=NONE              ctermfg=7           ctermbg=234         gui=NONE                guifg=#cccccc       guibg=#202020
    hi Ignore               cterm=bold              ctermfg=7                               gui=bold                guifg=#aaaaaa
    hi VertSplit            cterm=NONE              ctermfg=234         ctermbg=232         gui=NONE                guifg=#202020       guibg=#000000
    hi TabLineFill          cterm=NONE              ctermfg=7           ctermbg=0           gui=NONE                guifg=#aaaaaa       guibg=#282828
    hi TabLine              cterm=bold,italic       ctermfg=7           ctermbg=0           gui=bold,italic         guifg=#aaaaaa       guibg=#282828
    hi TabLineSel           cterm=bold              ctermfg=7           ctermbg=0           gui=bold                guifg=#aaaaaa       guibg=#282828
    hi User1                cterm=bold              ctermfg=NONE        ctermbg=238         gui=bold                guifg=NONE          guibg=#202020
    hi User9                cterm=bold              ctermfg=NONE        ctermbg=236         gui=bold                guifg=NONE          guibg=#303030
    hi DiffAdd              cterm=NONE              ctermfg=123         ctermbg=NONE        gui=NONE                guifg=#008080       guibg=#202020
    hi DiffAdded            cterm=NONE              ctermfg=123         ctermbg=NONE        gui=NONE                guifg=#008888       guibg=#202020
    hi DiffChange           cterm=bold              ctermfg=100         ctermbg=NONE        gui=bold                guifg=#bbbb88       guibg=#202020
    hi DiffDelete           cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=#ff0080       guibg=#202020
    hi DiffRemoved          cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=#ff0080       guibg=#202020
    hi DiffText             cterm=bold              ctermfg=184         ctermbg=NONE        gui=bold                guifg=#ffffbb       guibg=NONE
    hi Folded               cterm=bold,italic       ctermfg=249         ctermbg=234         gui=bold,italic         guifg=#b0b0b0       guibg=#202020
    hi FoldColumn           cterm=italic            ctermfg=249         ctermbg=234         gui=italic              guifg=#b0b0b0       guibg=#202020
    hi String               cterm=NONE              ctermfg=37                              gui=NONE                guifg=#00c0c0
    hi Matchparen           cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=bold                guifg=NONE          guibg=#008888
    hi Sneak                cterm=NONE              ctermfg=232         ctermbg=229         gui=NONE                guifg=#444444       guibg=#ffff88
    hi SneakLabel           cterm=underline         ctermfg=232         ctermbg=227         gui=underline           guifg=#444444       guibg=#ffff60
    hi ErrorMsg             cterm=NONE              ctermfg=NONE        ctermbg=NONE        gui=NONE                guifg=#ffffff       guibg=#ff0066
    hi PMenu                cterm=NONE              ctermfg=NONE        ctermbg=236         gui=NONE                guifg=NONE          guibg=#202020
    hi PMenuSel             cterm=NONE              ctermfg=NONE        ctermbg=238         gui=NONE                guifg=NONE          guibg=#303030
    hi PMenuSbar            cterm=NONE              ctermfg=NONE        ctermbg=238         gui=NONE                guifg=NONE          guibg=#303030
    hi PMenuThumb           cterm=NONE              ctermfg=240         ctermbg=240         gui=NONE                guifg=#444444       guibg=#444444
endif

hi link WinBar StatusLine
hi link NormalFloat StatusLine
hi link FloatBorder StatusLine
hi link WinBarNC StatusLineNC
hi link WinSeparator VertSplit
hi link TermCursor Cursor
hi link SneakCurrent Sneak

hi link ColorColumn DiffDelete
hi link QuickfixLine DiffAdd

hi link mkdLineBreak Error
hi link markdownCodeBlock String
hi link javaCommentTitle Comment
hi link javaDocTags SpecialComment
hi link javaDocParam SpecialComment

hi link EasyMotionTarget Search
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

hi link DiagnosticError DiffDelete
hi link DiagnosticSignError DiffDelete
hi link ALEErrorSign DiffDelete
hi link ALEErrorSignLineNr DiffDelete
hi link ALEError DiffDelete
hi link DiagnosticWarn DiffRemoved
hi link DiagnosticSignWarn DiffRemoved
hi link ALEWarningSign DiffRemoved
hi link ALEWarningSignLineNr DiffRemoved
hi link ALEWarning DiffRemoved
hi link DiagnosticInfo DiffAdd
hi link DiagnosticSignInfo DiffAdd
hi link ALEInfoSign DiffAdd
hi link ALEInfoSignLineNr DiffAdd
hi link ALEInfo DiffAdd
hi link ALEStyleErrorSign DiffDelete

let g:terminal_color_0 = '#404040'
let g:terminal_color_1 = '#ff70a4'
let g:terminal_color_2 = '#00a8a8'
let g:terminal_color_3 = '#a2a2a2'
let g:terminal_color_4 = '#008080'
let g:terminal_color_5 = '#8d5796'
let g:terminal_color_6 = '#00cdcd'
let g:terminal_color_7 = '#cccccc'
let g:terminal_color_8 = '#585858'
let g:terminal_color_9 = '#ffa2c1'
let g:terminal_color_10 = '#00bebe'
let g:terminal_color_11 = '#d5d5d5'
let g:terminal_color_12 = '#00a4a4'
let g:terminal_color_13 = '#ac80a6'
let g:terminal_color_14 = '#00ffff'
let g:terminal_color_15 = '#eeeeee'

let g:terminal_ansi_colors = [
  \terminal_color_0,
  \terminal_color_1,
  \terminal_color_2,
  \terminal_color_3,
  \terminal_color_4,
  \terminal_color_5,
  \terminal_color_6,
  \terminal_color_7,
  \terminal_color_8,
  \terminal_color_9,
  \terminal_color_10,
  \terminal_color_11,
  \terminal_color_12,
  \terminal_color_13,
  \terminal_color_14,
  \terminal_color_15
\]

let $BAT_THEME='ansi'
