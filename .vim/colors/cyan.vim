if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="cyan"

hi Cursorline               cterm=NONE              ctermfg=NONE        ctermbg=255
hi CursorlineNr             cterm=bold              ctermfg=248         ctermbg=255
hi LineNr                   cterm=NONE              ctermfg=248         ctermbg=255
hi SpecialKey               cterm=bold              ctermfg=NONE
hi NonText                  cterm=bold              ctermfg=255
hi Directory                cterm=bold,italic       ctermfg=NONE
hi ErrorMsg                 cterm=NONE              ctermfg=231         ctermbg=161
hi IncSearch                cterm=NONE              ctermfg=231         ctermbg=0
hi Search                   cterm=NONE              ctermfg=NONE        ctermbg=195
hi MoreMsg                  cterm=bold              ctermfg=NONE
hi ModeMsg                  cterm=bold              ctermfg=NONE
hi Question                 cterm=standout          ctermfg=NONE
hi StatusLine               cterm=bold,italic       ctermfg=NONE        ctermbg=255
hi StatusLineNC             cterm=bold,italic       ctermfg=249         ctermbg=255
hi StatusLineTerm           cterm=bold,italic       ctermfg=NONE        ctermbg=255
hi StatusLineTermNC         cterm=italic            ctermfg=NONE        ctermbg=255
hi VertSplit                cterm=NONE              ctermfg=255         ctermbg=255
hi SignColumn               cterm=NONE              ctermfg=30          ctermbg=254
hi Title                    cterm=bold              ctermfg=NONE
hi Visual                   cterm=NONE              ctermfg=NONE        ctermbg=254
hi VisualNOS                cterm=NONE              ctermfg=NONE        ctermbg=230
hi Underlined               cterm=underline         ctermfg=NONE
hi WarningMsg               cterm=standout          ctermfg=NONE
hi WildMenu                 cterm=standout          ctermfg=NONE
hi PMenu                    cterm=NONE              ctermfg=16          ctermbg=255
hi PMenuSel                 cterm=NONE              ctermfg=231         ctermbg=16
hi PMenuSbar                cterm=NONE              ctermfg=16          ctermbg=254
hi PMenuThumb               cterm=NONE              ctermfg=16          ctermbg=16
hi Folded                   cterm=bold,italic       ctermfg=249         ctermbg=231
hi FoldColumn               cterm=italic            ctermfg=249         ctermbg=255
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
hi TabLine                  cterm=bold              ctermfg=249         ctermbg=255
hi TabLineSel               cterm=bold              ctermfg=231         ctermbg=0
hi Sneak                    cterm=NONE              ctermfg=NONE        ctermbg=229
hi SneakLabel               cterm=underline         ctermfg=16          ctermbg=227

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
    hi SignColumn           cterm=NONE              ctermfg=30          ctermbg=0
    hi Ignore               cterm=bold              ctermfg=7
    hi VertSplit            cterm=NONE              ctermfg=0           ctermbg=0
    hi Search               cterm=NONE              ctermfg=NONE        ctermbg=6
    hi TabLineFill          cterm=NONE              ctermfg=7           ctermbg=0
    hi TabLine              cterm=bold,italic       ctermfg=7           ctermbg=0
    hi TabLineSel           cterm=bold              ctermfg=7           ctermbg=0
endif

hi Cursorline               gui=NONE                guifg=NONE          guibg=#f0f0f0
hi CursorlineNr             gui=bold                guifg=#aaaaaa       guibg=#f0f0f0
hi LineNr                   gui=NONE                guifg=#aaaaaa       guibg=#f0f0f0
hi Cursor                   gui=NONE                guifg=white         guibg=#ff0055
hi SpecialKey               gui=bold                guifg=NONE
hi NonText                  gui=bold                guifg=#e0e0e0       guibg=NONE
hi Directory                gui=bold,italic         guifg=NONE
hi ErrorMsg                 gui=NONE                guifg=#ff0055       guibg=#ffffff
hi IncSearch                gui=NONE                guifg=#ffffff       guibg=#000000
hi Search                   gui=NONE                guifg=black         guibg=#d7ffff
hi MoreMsg                  gui=bold                guifg=NONE
hi ModeMsg                  gui=bold                guifg=NONE
hi Question                 gui=standout            guifg=NONE
hi StatusLine               gui=bold                guifg=#000000       guibg=#f0f0f0
hi StatusLineNC             gui=bold                guifg=#aaaaaa       guibg=#f0f0f0
hi StatusLineTerm           gui=bold                guifg=#000000       guibg=#f0f0f0
hi StatusLineTermNC         gui=bold                guifg=#aaaaaa       guibg=#f0f0f0
hi VertSplit                gui=bold                guifg=#f0f0f0       guibg=#f0f0f0
hi SignColumn               gui=bold                guifg=darkcyan      guibg=#f0f0f0
hi TabLineFill              gui=bold                guifg=#aaaaaa       guibg=#f0f0f0
hi TabLine                  gui=bold                guifg=#aaaaaa       guibg=#f0f0f0
hi TabLineSel               gui=bold                guifg=#ffffff       guibg=#000000
hi Title                    gui=bold                guifg=NONE
hi Visual                   gui=NONE                guifg=NONE          guibg=#e0e0e0
hi VisualNOS                gui=NONE                guifg=NONE          guibg=#ffffd0
hi Underlined               gui=bold,underline      guifg=NONE
hi WarningMsg               gui=standout            guifg=NONE
hi Folded                   gui=bold,italic         guifg=#aaaaaa       guibg=#ffffff
hi FoldColumn               gui=italic              guifg=#aaaaaa       guibg=#f0f0f0
hi DiffChange               gui=NONE                guifg=NONE          guibg=#ffffe8
hi DiffDelete               gui=bold                guifg=#ff0055       guibg=#fff7f9
hi DiffRemoved              gui=NONE                guifg=#ff0055       guibg=#fff7f9
hi DiffAdd                  gui=NONE                guifg=NONE          guibg=#ecffff
hi DiffAdded                gui=NONE                guifg=NONE          guibg=#ecffff
hi DiffText                 gui=NONE                guifg=NONE          guibg=#e8e8d0
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
hi Ignore                   gui=bold                guifg=#f0f0f0
hi Error                    gui=bold                guifg=#ff0055       guibg=#ffe0e9
hi Todo                     gui=bold                guifg=darkcyan      guibg=lightgrey
hi String                   gui=NONE                guifg=darkcyan
hi WildMenu                 gui=NONE                guifg=black         guibg=#dddddd
hi PMenu                    gui=NONE                guifg=black         guibg=#dddddd
hi PMenuSel                 gui=NONE                guifg=#ffffff       guibg=black
hi PMenuSbar                gui=NONE                guifg=black         guibg=#cccccc
hi PMenuThumb               gui=NONE                guifg=#000000       guibg=#000000
hi Sneak                    gui=NONE                guifg=NONE          guibg=#ffffa0
hi SneakLabel               gui=underline           guifg=#000000       guibg=#ffff60

hi Highlight                gui=NONE                guifg=NONE          guibg=#44ffff
hi SpellBad                 gui=undercurl           guisp=#ff0055
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
hi TrailingWhitespace       gui=NONE                guifg=#ff0055       guibg=#ffe0e9

hi fzf1                     gui=bold                guifg=NONE          guibg=#f0f0f0
hi fzf2                     gui=NONE                guifg=darkcyan      guibg=#f0f0f0
hi fzf3                     gui=NONE                guifg=NONE          guibg=#f0f0f0

hi gitvGraphEdge9           guifg=#850024
hi gitvGraphEdge8           guifg=#005d6d
hi gitvGraphEdge7           guifg=#b60020
hi gitvGraphEdge6           guifg=#00779f
hi gitvGraphEdge5           guifg=#a30023
hi gitvGraphEdge4           guifg=#108d9b
hi gitvGraphEdge3           guifg=#de002b
hi gitvGraphEdge2           guifg=#18a3a7
hi gitvGraphEdge1           guifg=#808080
hi gitvLocalCommitedNode    guifg=darkcyan
hi gitvLocalUncommitNode    guifg=#b60020

hi link ColorColumn DiffDelete

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
    \'#262626', '#ff5faf', '#00afaf', '#b5b5b5', '#007f80', '#d75fd7', '#00cdd4', '#929292',
    \'#515151', '#ff96ca', '#00bebe', '#dcdcdc', '#00a4a4', '#ff71ff', '#00ffff', '#d7d7d7'
\]
