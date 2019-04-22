if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="cyan"

hi Cursorline               cterm=NONE              ctermfg=NONE        ctermbg=255
hi CursorlineNr             cterm=italic            ctermfg=252
hi SpecialKey               cterm=bold              ctermfg=NONE
hi NonText                  cterm=bold              ctermfg=255
hi Directory                cterm=bold,italic       ctermfg=NONE
hi ErrorMsg                 cterm=NONE              ctermfg=231         ctermbg=161
hi IncSearch                cterm=NONE              ctermfg=231         ctermbg=0
hi Search                   cterm=NONE              ctermfg=NONE        ctermbg=195
hi MoreMsg                  cterm=bold              ctermfg=NONE
hi ModeMsg                  cterm=bold              ctermfg=NONE
hi LineNr                   cterm=italic            ctermfg=231         ctermbg=252
hi Question                 cterm=standout          ctermfg=NONE
hi StatusLine               cterm=bold              ctermfg=231         ctermbg=252
hi StatusLineNC             cterm=NONE              ctermfg=231         ctermbg=252
hi StatusLineTerm           cterm=bold              ctermfg=231         ctermbg=252
hi StatusLineTermNC         cterm=NONE              ctermfg=231         ctermbg=252
hi VertSplit                cterm=NONE              ctermfg=231         ctermbg=252
hi Title                    cterm=bold              ctermfg=NONE
hi Visual                   cterm=NONE              ctermfg=NONE        ctermbg=253
hi VisualNOS                cterm=NONE              ctermfg=NONE        ctermbg=230
hi Underlined               cterm=underline         ctermfg=NONE
hi WarningMsg               cterm=standout          ctermfg=NONE
hi WildMenu                 cterm=standout          ctermfg=NONE
hi Folded                   cterm=italic            ctermfg=231         ctermbg=252
hi FoldColumn               cterm=italic            ctermfg=231         ctermbg=252
hi DiffAdd                  cterm=bold              ctermfg=NONE        ctermbg=195
hi DiffChange               cterm=bold              ctermfg=NONE        ctermbg=230
hi DiffDelete               cterm=bold              ctermfg=161         ctermbg=NONE
hi DiffText                 cterm=italic            ctermfg=NONE        ctermbg=227
hi Comment                  cterm=bold              ctermfg=252
hi SpecialComment           cterm=bold              ctermfg=250
hi Constant                 cterm=bold              ctermfg=NONE
hi Special                  cterm=bold              ctermfg=NONE
hi Identifier               cterm=bold              ctermfg=NONE
hi Statement                cterm=bold              ctermfg=NONE
hi PreProc                  cterm=bold              ctermfg=NONE
hi Type                     cterm=bold              ctermfg=NONE
hi Ignore                   cterm=bold              ctermfg=231
hi Error                    cterm=bold              ctermfg=161         ctermbg=NONE
hi Todo                     cterm=bold              ctermfg=37          ctermbg=254
hi String                   cterm=NONE              ctermfg=30
hi SpellBad                 cterm=NONE              ctermfg=161         ctermbg=NONE
hi SpellCap                 cterm=NONE              ctermfg=161         ctermbg=NONE
hi SpellRare                cterm=NONE              ctermfg=161         ctermbg=NONE
hi TabLineFill              cterm=NONE              ctermfg=255         ctermbg=252
hi TabLine                  cterm=italic            ctermfg=255         ctermbg=252
hi TabLineSel               cterm=bold              ctermfg=231         ctermbg=252

if &background == 'dark'
    hi Cursorline           cterm=NONE              ctermfg=NONE        ctermbg=232
    hi VisualNOS            cterm=NONE              ctermfg=NONE        ctermbg=236
    hi NonText              cterm=bold              ctermfg=0
    hi IncSearch            cterm=NONE              ctermfg=0           ctermbg=14
    hi LineNr               cterm=italic            ctermfg=7           ctermbg=0
    hi StatusLine           cterm=bold              ctermfg=7           ctermbg=0
    hi StatusLineNC         cterm=NONE              ctermfg=7           ctermbg=0
    hi StatusLineTerm       cterm=bold              ctermfg=7           ctermbg=0
    hi StatusLineTermNC     cterm=NONE              ctermfg=7           ctermbg=0
    hi Ignore               cterm=bold              ctermfg=7
    hi VertSplit            cterm=NONE              ctermfg=0           ctermbg=0 
    hi Search               cterm=NONE              ctermfg=NONE        ctermbg=6
    hi TabLineFill          cterm=NONE              ctermfg=7           ctermbg=0
    hi TabLine              cterm=italic            ctermfg=7           ctermbg=0
    hi TabLineSel           cterm=bold              ctermfg=7           ctermbg=0
endif

hi Cursorline               gui=NONE                guifg=NONE          guibg=#ebebeb
hi CursorlineNr             gui=italic              guifg=#e0e0e0       guibg=#bbbbbb
hi Cursor                   gui=NONE                guifg=white         guibg=#ff0044
hi SpecialKey               gui=bold                guifg=NONE
hi NonText                  gui=bold                guifg=#e0e0e0       guibg=NONE
hi Directory                gui=bold,italic         guifg=NONE
hi ErrorMsg                 gui=NONE                guifg=#ff0044       guibg=#ffffff
hi IncSearch                gui=NONE                guifg=#ffffff       guibg=#000000
hi Search                   gui=NONE                guifg=black         guibg=#ccffff
hi MoreMsg                  gui=bold                guifg=NONE
hi ModeMsg                  gui=bold                guifg=NONE
hi LineNr                   gui=italic              guifg=white         guibg=#c8c8c8
hi Question                 gui=standout            guifg=NONE
hi StatusLine               gui=bold                guifg=#ffffff       guibg=#c0c0c0
hi StatusLineNC             gui=NONE                guifg=#ffffff       guibg=#c8c8c8
hi VertSplit                gui=bold                guifg=#c8c8c8       guibg=#c8c8c8
hi Title                    gui=bold                guifg=NONE
hi Visual                   gui=NONE                guifg=NONE          guibg=#e0e0e0
hi VisualNOS                gui=NONE                guifg=NONE          guibg=#ffffd0
hi Underlined               gui=bold,underline      guifg=NONE
hi WarningMsg               gui=standout            guifg=NONE
hi Folded                   gui=italic              guifg=#ffffff       guibg=#c8c8c8
hi FoldColumn               gui=italic              guifg=#ffffff       guibg=#c8c8c8
hi DiffChange               gui=bold                guifg=NONE          guibg=#f0f0b5
hi DiffDelete               gui=bold                guifg=NONE          guibg=#ffe0e9
hi DiffAdd                  gui=bold                guifg=NONE          guibg=#e0ffff
hi DiffText                 gui=italic              guifg=NONE          guibg=#dbdba5
hi DiffAdded                gui=bold                guifg=NONE          guibg=#e0ffff
hi DiffRemoved              gui=bold                guifg=NONE          guibg=#ffe0e9
hi Comment                  gui=bold                guifg=darkgrey
hi SpecialComment           gui=bold                guifg=#808080
hi jsDocParam               gui=bold                guifg=darkgrey
hi jsDocTags                gui=bold                guifg=#888888
hi jsDocType                gui=bold                guifg=#888888
hi jsDocTypeNoParam         gui=bold                guifg=#888888
hi Constant                 gui=bold                guifg=black
hi Special                  gui=bold                guifg=NONE
hi Identifier               gui=bold                guifg=NONE
hi Statement                gui=bold                guifg=NONE
hi PreProc                  gui=bold                guifg=NONE
hi Type                     gui=bold                guifg=NONE
hi Ignore                   gui=bold                guifg=#ffffff
hi Error                    gui=bold                guifg=#ff0044       guibg=#ffe0e9
hi Todo                     gui=bold                guifg=darkcyan      guibg=lightgrey
hi String                   gui=NONE                guifg=darkcyan
hi TabLineFill              gui=NONE                guifg=#e6e6e6       guibg=#e6e6e6
hi TabLine                  gui=NONE                guifg=darkgrey      guibg=#e6e6e6
hi TabLineSel               gui=bold                guifg=NONE          guibg=NONE
hi WildMenu                 gui=NONE                guifg=black         guibg=#dddddd
hi PMenu                    gui=NONE                guifg=black         guibg=#dddddd
hi PMenuSel                 gui=NONE                guifg=#ffffff       guibg=black
hi PMenuSbar                gui=NONE                guifg=black         guibg=#cccccc
hi PMenuThumb               gui=NONE                guifg=#000000       guibg=#000000

hi Highlight                gui=NONE                guifg=NONE          guibg=#44ffff
hi SpellBad                 gui=undercurl           guisp=#ff0044
hi SpellCap                 gui=undercurl           guisp=darkcyan
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

hi TrailingWhitespace       gui=NONE                guifg=#ff0044       guibg=#ffe0e9

hi gitvGraphEdge9           guifg=#850024
hi gitvGraphEdge8           guifg=#005D6D
hi gitvGraphEdge7           guifg=#B60020
hi gitvGraphEdge6           guifg=#00779F
hi gitvGraphEdge5           guifg=#A30023
hi gitvGraphEdge4           guifg=#108D9B
hi gitvGraphEdge3           guifg=#DE002B
hi gitvGraphEdge2           guifg=#18A3A7
hi gitvGraphEdge1           guifg=#808080
hi gitvLocalCommitedNode    guifg=darkcyan
hi gitvLocalUncommitNode    guifg=#B60020

hi link javaCommentTitle Comment
hi link javaDocTags SpecialComment
hi link javaDocParam SpecialComment

hi link EasyMotionTarget Search
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search
