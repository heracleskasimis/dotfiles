" Vim color file

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
"
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="yellow"

hi Cursorline	  	cterm=NONE			ctermfg=0		ctermbg=15
hi SpecialKey     	cterm=bold			ctermfg=NONE
hi NonText        	cterm=bold	    	ctermfg=NONE
hi Directory      	cterm=NONE	    	ctermfg=0
hi ErrorMsg       	cterm=NONE    		ctermfg=15 		ctermbg=1
hi IncSearch      	cterm=NONE	    	ctermfg=NONE	ctermbg=11
hi Search         	cterm=NONE	    	ctermfg=NONE	ctermbg=3
hi MoreMsg        	cterm=bold	    	ctermfg=NONE
hi ModeMsg        	cterm=bold	    	ctermfg=NONE
hi LineNr         	cterm=NONE   		ctermfg=7		ctermbg=NONE
hi Question       	cterm=standout    	ctermfg=NONE
" hi StatusLine     	cterm=bold			ctermfg=15		ctermbg=8
" hi StatusLineNC   	cterm=NONE			ctermfg=7		ctermbg=234
hi StatusLine     	cterm=bold			ctermfg=15		ctermbg=0
hi StatusLineNC   	cterm=NONE			ctermfg=15		ctermbg=0
hi VertSplit      	cterm=NONE			ctermfg=15		ctermbg=NONE
hi Title          	cterm=bold			ctermfg=NONE
hi Visual         	cterm=NONE			ctermfg=NONE	ctermbg=11
hi VisualNOS      	cterm=bold			ctermfg=NONE
hi WarningMsg     	cterm=standout		ctermfg=NONE
hi WildMenu       	cterm=standout		ctermfg=NONE
hi Folded         	cterm=NONE			ctermfg=7		ctermbg=234
hi FoldColumn     	cterm=standout		ctermfg=7		ctermbg=234
hi DiffAdd        	cterm=bold	        ctermfg=NONE
hi DiffChange     	cterm=bold	        ctermfg=NONE
hi DiffDelete     	cterm=bold	        ctermfg=NONE
hi DiffText       	cterm=reverse		ctermfg=NONE
hi Comment        	cterm=NONE	        ctermfg=7
hi jsDocParam       gui=bold			guifg=darkgrey
hi jsDocTags        gui=bold			guifg=#888888
hi jsDocType        gui=bold			guifg=#888888
hi jsDocTypeNoParam gui=bold			guifg=#888888
hi Constant       	cterm=NONE			ctermfg=9
hi Special        	cterm=bold			ctermfg=NONE
hi Identifier     	cterm=bold			ctermfg=NONE
hi Statement      	cterm=bold			ctermfg=NONE
hi PreProc        	cterm=bold			ctermfg=NONE
hi Type           	cterm=bold			ctermfg=NONE
hi Underlined     	cterm=underline		ctermfg=NONE
hi Ignore         	cterm=bold			ctermfg=NONE
hi Error          	cterm=NONE			ctermfg=15				ctermbg=1
hi Todo           	cterm=standout		ctermfg=NONE
hi String		  	cterm=NONE			ctermfg=5

hi Normal			gui=NONE			guifg=#000000		guibg=#f0f0eb
hi Cursorline	  	gui=NONE			guifg=NONE			guibg=#e2e3df
hi CursorlineNr	  	gui=italic			guifg=#719952		guibg=#d4d4d0
hi Cursor			gui=NONE			guifg=white			guibg=#ff0044
hi SpecialKey     	gui=bold			guifg=NONE
hi NonText        	gui=bold	    	guifg=NONE			guibg=#e6e6e6
hi Directory      	gui=bold,italic	    guifg=NONE
hi ErrorMsg       	gui=reverse    		guifg=#850024       guibg=white
hi IncSearch      	gui=NONE	    	guifg=#ffffc0		guibg=#808060
hi Search         	gui=NONE	    	guifg=black		    guibg=#e3e3ab
hi MoreMsg        	gui=bold	    	guifg=NONE
hi ModeMsg        	gui=bold	    	guifg=NONE
hi LineNr         	gui=NONE   			guifg=#f0f0eb		guibg=#c4c4c4
hi Question       	gui=standout    	guifg=NONE
hi StatusLine     	gui=bold			guifg=#ffffff		guibg=#707070
hi StatusLineNC   	gui=NONE 			guifg=white 		guibg=#a0a0a0
hi VertSplit      	gui=bold			guifg=#c4c4c4		guibg=#c4c4c4
hi Title          	gui=bold			guifg=NONE
hi Visual         	gui=NONE			guifg=black			guibg=#ccccba
hi VisualNOS      	gui=bold,underline	guifg=NONE
hi WarningMsg     	gui=standout		guifg=NONE
hi Folded         	gui=standout		guifg=NONE
hi FoldColumn     	gui=standout		guifg=NONE
hi DiffChange     	gui=bold	        guifg=NONE      guibg=#e0e0e0
hi DiffDelete     	gui=bold	        guifg=NONE      guibg=#ffe0e9
hi DiffAdd       	gui=bold	        guifg=NONE      guibg=#e0ffff
hi DiffText       	gui=reverse	        guifg=NONE      guibg=NONE
hi Comment        	gui=bold	        guifg=darkgrey
hi Constant       	gui=bold			guifg=black
hi Special        	gui=bold			guifg=NONE
hi Identifier     	gui=bold			guifg=NONE
hi Statement      	gui=bold			guifg=NONE
hi PreProc        	gui=bold			guifg=NONE
hi Type           	gui=bold			guifg=NONE
hi Underlined     	gui=bold			guifg=NONE
hi Ignore         	gui=bold			guifg=NONE
hi Error          	gui=reverse			guifg=#ff0044		guibg=white
hi Todo           	gui=bold			guifg=#ff0044		guibg=lightgrey
hi String		  	gui=NONE			guifg=#ff0044
hi TabLineFill		gui=NONE			guifg=#e6e6e6		guibg=#e6e6e6
hi TabLine			gui=NONE			guifg=darkgrey		guibg=#e6e6e6
hi TabLineSel		gui=bold			guifg=NONE			guibg=NONE
hi WildMenu       	gui=NONE		    guifg=#888888       guibg=black
hi PMenu       	    gui=NONE		    guifg=#888888       guibg=black
hi PMenu       	    gui=NONE		    guifg=#888888       guibg=black
hi PMenuSel       	gui=NONE		    guifg=#ffffff       guibg=#202020
hi PMenuSbar       	gui=NONE		    guifg=black         guibg=black
hi PMenuThumb       gui=NONE		    guifg=#888888       guibg=#888888

hi Highlight		gui=NONE			guifg=NONE			guibg=#44ffff
hi SpellBad         gui=undercurl       guisp=#ff0044
hi SpellCap         gui=undercurl       guisp=darkcyan
hi SpellRare        gui=undercurl       guisp=#888888

hi BufferActive		gui=bold			guifg=NONE
hi BufferNormal		gui=bold			guifg=NONE
hi BufferSelected	gui=bold			guifg=NONE
hi BufferActiveSelected	 gui=bold		guifg=NONE

hi Matchparen		gui=NONE			guifg=NONE		guibg=#bbffff
hi WordUnderTheCursor   gui=NONE			guifg=NONE		guibg=#ffffc0
