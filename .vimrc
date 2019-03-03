set nocompatible
set shellslash
set runtimepath^=~/.vim

let mapleader=' '

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set encoding=utf-8
set guioptions=a
set linespace=1
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set mouse=a
set novisualbell
set vb t_vb=
set noerrorbells

set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,ΡR,ΣS,ΤT,ΘU,ΩV,ΧX,ΖY,ΥZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,ζz,υy

set autochdir
set number "relativenumber
set hidden
set ignorecase
set smartcase
set ai nocin nosi inde=-1
set foldlevelstart=16

set clipboard=unnamed

set wildignore=*.class,*.o,*.meta,*/node_modules/*

set tags=tags; ",/Users/cell/.vim/tags/*

filetype off

set background=light
colorscheme cyan

call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'sbl/scvim'
Plug 'digitaltoad/vim-jade'
Plug 'plasticboy/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'elzr/vim-json'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/javacomplete'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fidian/hexmode'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-vinegar'
Plug 'xolox/vim-misc'
Plug 'groenewege/vim-less'
Plug 'fatih/vim-go'
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'gerw/vim-HiLinkTrace'
Plug 'tfnico/vim-gradle'
Plug 'bling/vim-airline'
Plug 'vadimr/bclose.vim'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-dispatch'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/SyntaxRange'
Plug 'jceb/vim-orgmode'
" Plug 'justinmk/vim-sneak'
" Plug 'majutsushi/tagbar'
" Plug 'Shougo/unite-ssh'
" Plug 'xolox/vim-easytags'
" Plug 'kris89/vim-multiple-cursors'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/unite.vim'
if has("gui_running")
    Plug 'jkerian/HiCursorWords'
endif
call plug#end()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set noshellslash
    if has('win32')
        set shell=cmd
        set shellcmdflag=/c
        set shellxquote=\"
    endif
endif

filetype plugin indent on

command! -nargs=0 FormatJSON %!python -m json.tool
command! -nargs=0 FormatHTML %!tidy -q -i --show-errors 0
command! -nargs=0 FormatXML  %!tidy -q -i --show-errors 0 -xml

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
let g:HiCursorWords_delay = 333
let g:HiCursorWords_hiGroupRegexp = ''
let g:HiCursorWords_debugEchoHiName = 0
let g:NERDTreeHijackNetrw = 0
" let g:syntastic_shell = '/bin/sh'
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
let g:EditorConfig_core_mode = 'python_external'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
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

map <leader><Tab>n :tabe<cr>
map <leader><Tab>d :tabclose<cr>
map <leader><Tab>[ :tabprevious<cr>
map <leader><Tab>] :tabnext<cr>

map <leader>on :NERDTreeToggle<cr>
map <leader>oN :NERDTreeFind<cr>

map <leader>bb :CtrlPBuffer<cr>
map <leader>b] :bnext<cr>
map <leader>b[ :bprevious<cr>
map <leader>bk :Bclose<cr>
map <leader>< :CtrlPBuffer<cr>

map <leader>ww <c-w>w
map <leader>wj <c-w>j
map <leader>wk <c-w>k
map <leader>wh <c-w>h
map <leader>wl <c-w>l
map <c-Tab> <c-w>w
" map <leader>i :TagbarToggle<cr>
" map <leader>g :Rgrep<cr>
" map <leader><s-g> :Grep<cr>
map <leader>f/ :CtrlP<cr>
map <leader>p/ :CtrlP<cr>
map <leader>/p :silent noautocmd vimgrep <c-r>=expand("<cword>")<cr> <c-r>=getcwd()<cr>/**/*.<c-r>=expand("%:e")<cr> \| copen<home><c-right><c-right><c-right><c-right>
map <leader>/d :silent noautocmd vimgrep <c-r>=expand("<cword>")<cr> <c-r>=getcwd()<cr>/**/*.<c-r>=expand("%:e")<cr> \| copen<home><c-right><c-right><c-right><c-right>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


map <leader>]e :lnext<cr>
map <leader>[e :lprevious<cr>

map <down> gj
map <up> gk
imap <down> <c-o>gj
imap <up> <c-o>gk

imap <insert> <esc>"*P']ji

cnoremap <C-g> <C-[>
