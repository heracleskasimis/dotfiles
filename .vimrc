set nocompatible

let mapleader = ' '

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set encoding=utf-8
set guioptions=a
set guifont=Liberation\ Mono\ for\ Powerline:h11
set linespace=2
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set mouse=a
set visualbell
set t_vb=
set noerrorbells

set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,ΡR,ΣS,ΤT,ΘU,ΩV,ΧX,ΖY,ΥZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,ζz,υy

set autochdir
set nu
set hidden
set ignorecase
set smartcase
set ai nocin nosi inde=-1
set foldlevelstart=16

set clipboard=unnamed

set wildignore=*.class,*.o,*.meta

set tags=tags; ",/Users/cell/.vim/tags/*

filetype off

set background=light
colorscheme cyan

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
" Plugin 'justinmk/vim-sneak'
Plugin 'scrooloose/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'sbl/scvim'
" Plugin 'majutsushi/tagbar'
Plugin 'digitaltoad/vim-jade'
Plugin 'plasticboy/vim-markdown'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/javacomplete'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/unite.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fidian/hexmode'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
"Plugin 'Shougo/unite-ssh'
Plugin 'tpope/vim-vinegar'
Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
" Plugin 'kris89/vim-multiple-cursors'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'gerw/vim-HiLinkTrace'
Plugin 'tfnico/vim-gradle'
Plugin 'bling/vim-airline'
if has("gui_running")
    Plugin 'ihacklog/HiCursorWords'
endif
call vundle#end()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

filetype plugin indent on

command! -nargs=0 FormatJSON %!python -m json.tool
command! -nargs=0 Thtml %!/usr/local/bin/tidy -q -i --show-errors 0
command! -nargs=0 Txml  %!/usr/local/bin/tidy -q -i --show-errors 0 -xml

if has("gui_running")
    "autocmd CursorMoved * silent! exe printf('match LazySearch /\<%s\>/', expand('<cword>'))
    "autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
    let g:matchmaker_enable_startup = 1
    set laststatus=2
else
    let loaded_matchparen = 1
endif

set omnifunc=syntaxcomplete#Complete

let c_space_errors = 1
let java_space_errors = 1
let ruby_space_errors = 1
let javascript_space_errors = 1

let g:jsx_ext_required = 0
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_resolve_links = 1
let g:easytags_on_cursorhold = 0
" let g:easytags_by_filetype = '~/.vim/tags'
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_dynamic_files = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_expand = 0
let g:tagbar_width = 34
let g:tagbar_sort = 0
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Inc_Winwidth = 0
let g:solarized_termstrans = 1
let g:vim_markdown_folding_disabled = 1
let g:extradite_resize = 0
let g:vim_json_syntax_conceal = 0
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:airline_powerline_fonts=0
let g:HiCursorWords_delay = 50
let g:HiCursorWords_hiGroupRegexp = ''
let g:HiCursorWords_debugEchoHiName = 0
let g:NERDTreeHijackNetrw = 0
let g:syntastic_shell = '/bin/sh'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['jscs']
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_c_checkers = ['cppcheck']
let g:syntastic_c_cppcheck_args = '--std=c89 --std=posix'
let g:syntastic_c_checkpatch_args = '--file --no-tree'
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '/usr/local/Cellar/checkstyle/6.0/libexec/checkstyle-6.0-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/.checkstyle.xml'
let g:formatprg_args_c = "--style=java"
let g:formatprg_args_cpp = "--style=java"
let g:formatprg_args_expr_javascript = '"-a -f - -".(&expandtab ? "s ".&shiftwidth : "t").(&textwidth ? " -w ".&textwidth : "")'
let g:EditorConfig_core_mode = 'external_command'
let g:Gitv_TruncateCommitSubjects = 1
let g:Gitv_DoNotMapCtrlKey = 1

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
endfunction

map <leader>t :tabe
map <leader>d :tabclose<cr>
map <leader>ft :NERDTreeToggle<cr>
map <leader>0 :NERDTreeFind<cr>
map <leader><Tab> :b#<cr>
map <leader>bb :CtrlPBuffer<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
map <leader>en :lnext<cr>
map <leader>ep :lprevious<cr>
map <leader>ww <c-w>w
map <leader>wj <c-w>j
map <leader>wk <c-w>k
map <leader>wh <c-w>h
map <leader>wl <c-w>l
map <c-Tab> <c-w>w
map <leader>x :Hexmode<cr>
" map <leader>i :TagbarToggle<cr>
" map <leader>g :Rgrep<cr>
" map <leader><s-g> :Grep<cr>
map <leader>/ :silent noautocmd vimgrep <c-r>=expand("<cword>")<cr> <c-r>=getcwd()<cr>/**/*.<c-r>=expand("%:e")<cr> \| copen<home><c-right><c-right><c-right><c-right>

map <down> gj
map <up> gk
imap <down> <c-o>gj
imap <up> <c-o>gk

imap <insert> <esc>"*P']ji

cnoremap <C-g> <C-[>
