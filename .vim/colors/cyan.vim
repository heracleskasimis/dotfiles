if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="cyan"

hi Cursorline               cterm=NONE              ctermfg=NONE        ctermbg=255
hi CursorlineNr             cterm=NONE              ctermfg=219         ctermbg=NONE
hi LineNr                   cterm=NONE              ctermfg=250         ctermbg=NONE
hi SpecialKey               cterm=bold              ctermfg=NONE
hi NonText                  cterm=bold              ctermfg=255
hi Directory                cterm=bold,italic       ctermfg=NONE
hi ErrorMsg                 cterm=NONE              ctermfg=231         ctermbg=161
hi IncSearch                cterm=NONE              ctermfg=231         ctermbg=0
hi Search                   cterm=NONE              ctermfg=NONE        ctermbg=159
hi MoreMsg                  cterm=bold              ctermfg=NONE
hi ModeMsg                  cterm=bold              ctermfg=NONE
hi Question                 cterm=standout          ctermfg=NONE
hi StatusLine               cterm=bold              ctermfg=NONE        ctermbg=255
hi StatusLineNC             cterm=bold              ctermfg=NONE        ctermbg=255
hi StatusLineTerm           cterm=bold              ctermfg=NONE        ctermbg=255
hi StatusLineTermNC         cterm=bold              ctermfg=NONE        ctermbg=255
hi VertSplit                cterm=NONE              ctermfg=254         ctermbg=NONE
hi SignColumn               cterm=NONE              ctermfg=30          ctermbg=NONE
hi Title                    cterm=bold              ctermfg=NONE
hi Visual                   cterm=NONE              ctermfg=NONE        ctermbg=123
hi VisualNOS                cterm=NONE              ctermfg=NONE        ctermbg=230
hi Underlined               cterm=underline         ctermfg=NONE
hi WarningMsg               cterm=standout          ctermfg=NONE
hi WildMenu                 cterm=bold              ctermfg=231         ctermbg=37
hi PMenu                    cterm=NONE              ctermfg=16          ctermbg=255
hi PMenuSel                 cterm=NONE              ctermfg=231         ctermbg=16
hi PMenuSbar                cterm=NONE              ctermfg=16          ctermbg=254
hi PMenuThumb               cterm=NONE              ctermfg=16          ctermbg=16
hi Folded                   cterm=bold,italic       ctermfg=249         ctermbg=231
hi FoldColumn               cterm=italic            ctermfg=249         ctermbg=231
hi DiffAdd                  cterm=NONE              ctermfg=NONE        ctermbg=195
hi DiffAdded                cterm=NONE              ctermfg=NONE        ctermbg=195
hi DiffChange               cterm=bold              ctermfg=NONE        ctermbg=230
hi DiffDelete               cterm=bold              ctermfg=161         ctermbg=NONE
hi DiffRemoved              cterm=NONE              ctermfg=161         ctermbg=NONE
hi DiffText                 cterm=bold              ctermfg=232         ctermbg=187
hi Comment                  cterm=bold              ctermfg=250
hi SpecialComment           cterm=bold              ctermfg=248
hi Constant                 cterm=bold              ctermfg=NONE
hi Special                  cterm=bold              ctermfg=NONE
hi Identifier               cterm=bold              ctermfg=NONE
hi Statement                cterm=bold              ctermfg=NONE
hi PreProc                  cterm=bold              ctermfg=NONE
hi Type                     cterm=bold              ctermfg=NONE
hi Ignore                   cterm=bold              ctermfg=255
hi Error                    cterm=bold              ctermfg=161         ctermbg=NONE
hi Todo                     cterm=bold              ctermfg=37          ctermbg=254
hi String                   cterm=NONE              ctermfg=30
hi SpellBad                 cterm=NONE              ctermfg=161         ctermbg=NONE
hi SpellCap                 cterm=NONE              ctermfg=161         ctermbg=NONE
hi SpellRare                cterm=NONE              ctermfg=161         ctermbg=NONE
hi TabLineFill              cterm=NONE              ctermfg=249         ctermbg=255
hi TabLine                  cterm=bold              ctermfg=232         ctermbg=254
hi TabLineSel               cterm=bold              ctermfg=231         ctermbg=44
hi Sneak                    cterm=NONE              ctermfg=NONE        ctermbg=229
hi SneakLabel               cterm=underline         ctermfg=16          ctermbg=227

hi User1                    cterm=bold              ctermfg=231         ctermbg=30
hi User2                    cterm=bold              ctermfg=231         ctermbg=197
hi User3                    cterm=bold              ctermfg=231         ctermbg=232
hi User4                    cterm=bold              ctermfg=231         ctermbg=37
hi User5                    cterm=bold              ctermfg=NONE        ctermbg=NONE
hi User7                    cterm=bold              ctermfg=NONE        ctermbg=NONE
hi User8                    cterm=bold              ctermfg=NONE        ctermbg=NONE
hi User9                    cterm=bold              ctermfg=232         ctermbg=254

if &background == 'dark'
    hi Cursorline           cterm=NONE              ctermfg=NONE        ctermbg=232
    hi Visual               cterm=NONE              ctermfg=NONE        ctermbg=23
    hi VisualNOS            cterm=NONE              ctermfg=NONE        ctermbg=236
    hi NonText              cterm=bold              ctermfg=0
    hi IncSearch            cterm=NONE              ctermfg=0           ctermbg=14
    hi LineNr               cterm=NONE              ctermfg=7           ctermbg=NONE
    hi StatusLine           cterm=bold              ctermfg=7           ctermbg=235
    hi StatusLineNC         cterm=NONE              ctermfg=7           ctermbg=234
    hi StatusLineTerm       cterm=bold              ctermfg=7           ctermbg=235
    hi StatusLineTermNC     cterm=NONE              ctermfg=7           ctermbg=234
    hi Ignore               cterm=bold              ctermfg=7
    hi VertSplit            cterm=NONE              ctermfg=0           ctermbg=NONE
    hi Search               cterm=NONE              ctermfg=0           ctermbg=6
    hi TabLineFill          cterm=NONE              ctermfg=7           ctermbg=0
    hi TabLine              cterm=bold,italic       ctermfg=7           ctermbg=0
    hi TabLineSel           cterm=bold              ctermfg=7           ctermbg=0
    hi User3                cterm=bold              ctermfg=NONE        ctermbg=238
    hi User9                cterm=bold              ctermfg=NONE        ctermbg=236
    hi DiffAdd              cterm=NONE              ctermfg=231         ctermbg=30
    hi DiffAdded            cterm=NONE              ctermfg=231         ctermbg=30
    hi DiffChange           cterm=bold              ctermfg=NONE        ctermbg=58
    hi DiffText             cterm=bold              ctermfg=255         ctermbg=100
    hi Folded               cterm=bold,italic       ctermfg=249         ctermbg=234
    hi FoldColumn           cterm=italic            ctermfg=249         ctermbg=234
endif

hi Normal                   gui=NONE                guifg=NONE          guibg=NONE
hi Cursorline               gui=NONE                guifg=NONE          guibg=#f8f8f8
hi CursorlineNr             gui=NONE                guifg=#ffa6ca       guibg=NONE
hi LineNr                   gui=NONE                guifg=#bbbbbb       guibg=NONE
hi Cursor                   gui=NONE                guifg=white         guibg=#ff0066
hi SpecialKey               gui=bold                guifg=NONE
hi NonText                  gui=bold                guifg=#e0e0e0       guibg=NONE
hi Directory                gui=bold,italic         guifg=NONE
hi ErrorMsg                 gui=NONE                guifg=#ff0066       guibg=#ffffff
hi IncSearch                gui=NONE                guifg=#ffffff       guibg=#000000
hi Search                   gui=NONE                guifg=#000000       guibg=#d7ffff
hi MoreMsg                  gui=bold                guifg=NONE
hi ModeMsg                  gui=bold                guifg=NONE
hi Question                 gui=standout            guifg=NONE
hi StatusLine               gui=bold                guifg=#000000       guibg=#e8e8e8
hi StatusLineNC             gui=bold                guifg=#000000       guibg=#f0f0f0
hi StatusLineTerm           gui=bold                guifg=#000000       guibg=#e8e8e8
hi StatusLineTermNC         gui=bold                guifg=#000000       guibg=#f0f0f0
hi VertSplit                gui=bold                guifg=#dddddd       guibg=NONE
hi SignColumn               gui=bold                guifg=#008888       guibg=NONE
hi TabLineFill              gui=bold                guifg=#808080       guibg=#f0f0f0
hi TabLine                  gui=bold                guifg=#000000       guibg=#e8e8e8
hi TabLineSel               gui=bold                guifg=#ffffff       guibg=#00c0c0
hi Title                    gui=bold                guifg=NONE
hi Visual                   gui=NONE                guifg=NONE          guibg=#b0ffff
hi VisualNOS                gui=NONE                guifg=NONE          guibg=#ffffcc
hi Underlined               gui=bold,underline      guifg=NONE
hi WarningMsg               gui=standout            guifg=NONE
hi Folded                   gui=bold,italic         guifg=#aaaaaa       guibg=NONE
hi FoldColumn               gui=italic              guifg=#aaaaaa       guibg=NONE
hi DiffChange               gui=NONE                guifg=NONE          guibg=#ffffe8
hi DiffDelete               gui=bold                guifg=#ff0066       guibg=#fff7f9
hi DiffRemoved              gui=NONE                guifg=#ff0066       guibg=#fff7f9
hi DiffAdd                  gui=NONE                guifg=NONE          guibg=#ecffff
hi DiffAdded                gui=NONE                guifg=NONE          guibg=#ecffff
hi DiffText                 gui=NONE                guifg=NONE          guibg=#e8e8d0
hi Comment                  gui=bold                guifg=darkgrey
hi SpecialComment           gui=bold                guifg=#808080
hi jsDocParam               gui=bold                guifg=darkgrey
hi jsDocTags                gui=bold                guifg=#888888
hi jsDocType                gui=bold                guifg=#888888
hi jsDocTypeNoParam         gui=bold                guifg=#888888
hi Constant                 gui=bold                guifg=NONE
hi Special                  gui=bold                guifg=NONE
hi Identifier               gui=bold                guifg=NONE
hi Statement                gui=bold                guifg=NONE
hi PreProc                  gui=bold                guifg=NONE
hi Type                     gui=bold                guifg=NONE
hi Ignore                   gui=bold                guifg=#f0f0f0
hi Error                    gui=bold                guifg=#ff0066       guibg=#ffe0e9
hi Todo                     gui=bold                guifg=#008888       guibg=#e0e0e0
hi String                   gui=NONE                guifg=#008888
hi WildMenu                 gui=bold                guifg=#ffffff       guibg=#00b0b0
hi PMenu                    gui=NONE                guifg=#000000       guibg=#e8e8e8
hi PMenuSel                 gui=NONE                guifg=#ffffff       guibg=#000000
hi PMenuSbar                gui=NONE                guifg=#000000       guibg=#d8d8d8
hi PMenuThumb               gui=NONE                guifg=#000000       guibg=#000000
hi Sneak                    gui=NONE                guifg=NONE          guibg=#ffff88
hi SneakLabel               gui=underline           guifg=#000000       guibg=#ffff60

hi User1                    gui=bold                guifg=#ffffff       guibg=#008888
hi User2                    gui=bold                guifg=#ffffff       guibg=#ff0066
hi User3                    gui=bold                guifg=#ffffff       guibg=#000000
hi User4                    gui=bold                guifg=#ffffff       guibg=#00c0c0
hi User5                    gui=bold                guifg=NONE          guibg=NONE
hi User7                    gui=bold                guifg=NONE          guibg=NONE
hi User8                    gui=bold                guifg=NONE          guibg=NONE
hi User9                    gui=bold                guifg=#000000       guibg=#e0e0e0

hi Highlight                gui=NONE                guifg=NONE          guibg=#44ffff
hi SpellBad                 gui=undercurl           guisp=#ff0066
hi SpellCap                 gui=undercurl           guisp=#008888
hi SpellRare                gui=undercurl           guisp=#888888

hi BufferActive             gui=bold                guifg=NONE
hi BufferNormal             gui=bold                guifg=NONE
hi BufferSelected           gui=bold                guifg=NONE
hi BufferActiveSelected     gui=bold                guifg=NONE
hi TagbarAccessPublic       gui=NONE                guifg=NONE
hi TagbarAccessPrivate      gui=NONE                guifg=NONE
hi TagbarVisibilityPublic   gui=NONE                guifg=NONE
hi TagbarVisibilityPrivate  gui=NONE                guifg=NONE

hi Matchparen               gui=NONE                guifg=NONE          guibg=#bbffff
hi TrailingWhitespace       gui=NONE                guifg=#ff0066       guibg=#ffe0e9

hi fzf1                     gui=bold                guifg=NONE          guibg=NONE
hi fzf2                     gui=NONE                guifg=#008888       guibg=NONE
hi fzf3                     gui=NONE                guifg=NONE          guibg=NONE

if &background == 'dark'
    hi Normal               gui=NONE                guifg=#ffffff       guibg=#444444
    hi Cursorline           gui=NONE                guifg=NONE          guibg=#000000
    hi Visual               gui=NONE                guifg=NONE          guibg=#008888
    hi VisualNOS            gui=NONE                guifg=NONE          guibg=#222222
    hi NonText              gui=bold                guifg=#232323
    hi IncSearch            gui=NONE                guifg=#f0f0f0       guibg=#008888
    hi LineNr               gui=NONE                guifg=#ffffff       guibg=NONE
    hi StatusLine           gui=bold                guifg=#aaaaaa       guibg=#303030
    hi StatusLineNC         gui=NONE                guifg=#aaaaaa       guibg=#363636
    hi StatusLineTerm       gui=bold                guifg=#aaaaaa       guibg=#303030
    hi StatusLineTermNC     gui=NONE                guifg=#aaaaaa       guibg=#363636
    hi Ignore               gui=bold                guifg=#aaaaaa
    hi VertSplit            gui=NONE                guifg=#232323       guibg=NONE
    hi Search               gui=NONE                guifg=#232323       guibg=#888888
    hi TabLineFill          gui=NONE                guifg=#aaaaaa       guibg=#232323
    hi TabLine              gui=bold,italic         guifg=#aaaaaa       guibg=#232323
    hi TabLineSel           gui=bold                guifg=#aaaaaa       guibg=#232323
    hi User3                gui=bold                guifg=NONE          guibg=#222222
    hi User9                gui=bold                guifg=NONE          guibg=#303030
    hi DiffAdd              gui=NONE                guifg=#ffffff       guibg=#445050
    hi DiffAdded            gui=NONE                guifg=#ffffff       guibg=#445050
    hi DiffChange           gui=bold                guifg=NONE          guibg=#555544
    hi DiffDelete           gui=NONE                guifg=#ff0066       guibg=NONE
    hi DiffRemoved          gui=NONE                guifg=#ff0066       guibg=NONE
    hi DiffText             gui=bold                guifg=#eeeeee       guibg=#555522
    hi Folded               gui=bold,italic         guifg=#b0b0b0       guibg=#383838
    hi FoldColumn           gui=italic              guifg=#b0b0b0       guibg=#383838
endif

hi link ColorColumn DiffDelete
hi link QuickfixLine DiffAdd

hi link mkdLineBreak Error
hi link javaCommentTitle Comment
hi link javaDocTags SpecialComment
hi link javaDocParam SpecialComment

hi link EasyMotionTarget Search
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

let g:terminal_ansi_colors = [
    \'#404040', '#ff70a4', '#00a8a8', '#a2a2a2', '#008080', '#8d5796', '#00cdcd', '#cccccc',
    \'#585858', '#ffa2c1', '#00bebe', '#d5d5d5', '#00a4a4', '#ac80a6', '#00ffff', '#eeeeee'
\]
