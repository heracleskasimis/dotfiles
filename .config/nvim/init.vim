set nobackup
set noswapfile

set title
set ignorecase
set smartcase
set clipboard=unnamedplus
set nonumber relativenumber
set tagcase=match

set t_Co=256
colorscheme cyan

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent nocindent nosmartindent inde=-1 breakindent breakindentopt=shift:4

set fillchars+=vert:┃
set noequalalways

lua << EOF
vim.diagnostic.config { underline = false }
EOF

set wildignore=*.class,*.o,*.meta,*.dll,*.pdb,*.exe,*.asset,*.unity,*.prefab,*.min.js,*.min.css,tags,node_modules,venv,bin,obj,build,dist

"--------------------------------------------------------------------------------------------------

let g:no_plugin_maps = 1

call plug#begin()
Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'sbl/scvim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fidian/hexmode'
Plug 'tpope/vim-vinegar'
Plug 'editorconfig/editorconfig-vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-rooter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-dadbod'
Plug 'mtth/scratch.vim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'sunaku/vim-shortcut'
Plug 'tpope/vim-dotenv'
Plug 'junegunn/vim-peekaboo'
Plug 'jamessan/vim-gnupg'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'folke/snacks.nvim'
Plug 'NickvanDyke/opencode.nvim'
call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup({
  highlight = { enable = true },
  indent = { enable = false },
})
EOF

if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --hidden --skip-vcs-ignores --ignore .git -g ""'
  let g:ackprg = 'ag --vimgrep --hidden --ignore .git'
endif
let $FZF_DEFAULT_OPTS='--style minimal --color=16,bg+:255,fg+:232,gutter:-1,hl:44,pointer:44,info:44,header:44,border:15 --border=none'
let g:fzf_layout = { 'down': '40%' }
let g:ack_qhandler = 'copen 10'
let g:jsx_ext_required = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_json_syntax_conceal = 0
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeAutoCenter = 0
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeStatusline = -1
let g:NERDTreeWinSize = 44
let g:formatprg_args_c = '--style=java'
let g:formatprg_args_cpp = '--style=java'
let g:formatprg_args_expr_javascript = '"-a -f - -".(&expandtab ? "s ".&shiftwidth : "t").(&textwidth ? " -w ".&textwidth : "")'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git', '.svn']
let g:gutentags_project_root = ['.git', '.svn']
let g:gutentags_cache_dir = '~/.cache/tags'
let g:gutentags_ctags_extra_args = ['--map-TypeScript=+.tsx']
let g:ale_lint_on_text_changed = 'always'
let g:ale_set_highlights = 0
let g:ale_use_neovim_diagnostics_api = 1
let g:ale_lint_delay = 750
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'javascript.jsx': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'typescriptreact': ['eslint'],
  \ 'javascriptreact': ['eslint'],
  \ 'python': ['isort', 'autopep8', 'black'],
  \ 'sql': ['sqlfluff']
  \ }
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'javascript.jsx': ['eslint'],
  \ 'python': ['pylint', 'flake8'],
  \ 'sql': ['sqlfluff']
  \ }
let g:ale_sql_pgformatter_options = '--spaces 2 --function-case 1 --comma-break'
let g:ale_sql_sqlfluff_options = '--dialect postgres'
let g:ale_python_flake8_options = '--config ~/.config/flake8'
let g:ale_virtualtext_cursor = 'disabled'

"--------------------------------------------------------------------------------------------------

function! s:mod(n,m)
  return ((a:n % a:m) + a:m) % a:m
endfunction

function! s:GetWorkspaceBuffers(...)
  let sorted = get(a:, 1, 0)
  let formatted = get(a:, 2, 0)
  let buffers = gettabvar(tabpagenr(), 'buffers')
  let bufnumbers = sort(map(keys(buffers), {v -> str2nr(v:val)}), 'n')
  let bufnumbers = filter(bufnumbers, {v -> buflisted(v:val) && getbufvar(v:val, '&filetype') != 'qf'})
  let bufnumbers = sorted ? sort(bufnumbers, {a, b -> buffers[a] < buffers[b] ? 1 : -1}) : bufnumbers
  return formatted ? map(bufnumbers, {v -> fzf#vim#_format_buffer(v:val)}) : bufnumbers
endfunction

function! s:PreviousEditedWorkspaceBuffer()
  let buffers = filter(s:GetWorkspaceBuffers(1), {v -> v:val != bufnr() && bufname(v:val) !~ '^!' && bufname(v:val) !~ 'term://' && getbufvar(v:val, '&filetype') != 'fugitive'})
  if len(buffers) > 0
    execute ':buffer ' .  buffers[0]
  endif
endfunction
command! PreviousEditedWorkspaceBuffer call s:PreviousEditedWorkspaceBuffer()

function! s:NextWorkspaceBuffer()
  let buffers = s:GetWorkspaceBuffers()
  execute ':buffer ' . buffers[s:mod((index(buffers, bufnr()) + 1), len(buffers))]
endfunction
command! NextWorkspaceBuffer call s:NextWorkspaceBuffer()

function! s:PreviousWorkspaceBuffer()
  let buffers = s:GetWorkspaceBuffers()
  execute ':buffer ' . buffers[s:mod((index(buffers, bufnr()) - 1), len(buffers))]
endfunction
command! PreviousWorkspaceBuffer call s:PreviousWorkspaceBuffer()

function! s:WorkspaceAttachBuffer(...)
  let buffernr = a:0 == 0 ? bufnr() : str2nr(a:1)
  let buffers = extend(gettabvar(tabpagenr(), 'buffers', {}), { buffernr: localtime() })
  call settabvar(tabpagenr(), 'buffers', buffers)
endfunction
command! -nargs=? WorkspaceAttachBuffer call s:WorkspaceAttachBuffer(<args>)

function! s:WorkspaceDetachBuffer(...)
  let buffernr = a:0 == 0 ? bufnr() : str2nr(a:1)
  silent! call remove(gettabvar(tabpagenr(), 'buffers'), buffernr)
endfunction
command! -nargs=? WorkspaceDetachBuffer call s:WorkspaceDetachBuffer(<args>)

function! s:WorkspaceBuffers(...)
  call fzf#vim#buffers('', { 'source': s:GetWorkspaceBuffers(1, 1) })
endfunction
command! WorkspaceBuffers call s:WorkspaceBuffers()

function! s:Bclose(bang, buffer)
  let buffernr = empty(a:buffer) ? bufnr() : str2nr(a:buffer)
  if buffernr == bufnr()
    call s:PreviousEditedWorkspaceBuffer()
  endif
  execute ':bdelete'.a:bang.' '.buffernr
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')

function! s:Tag(tag)
  let tlist = taglist('^' . a:tag . '$')
  if len(tlist) > 1
    call fzf#vim#tags(a:tag)
  else
    execute ':tag ' . a:tag
  endif
endfunction
command! -complete=buffer -nargs=? Tag call s:Tag('<args>')
    
function! VimrcShortcuts()
  map <space> <leader>
  map <space>m <localleader>
  map <space><space> <leader><leader>
  map <leader><esc> <Nop>

  Shortcut 'Run shortcut'
    \ map <leader> :Shortcuts<cr><leader>

  Shortcut 'Commands'
    \ map <leader>: :Commands<cr>

  Shortcut 'New tab'
    \ map <leader><Tab>n :tabe<cr>
  Shortcut 'Delete tab'
    \ map <leader><Tab>d :tabclose<cr>
  Shortcut 'Previous tab'
    \ map <leader><Tab>[ :tabprevious<cr>
  Shortcut 'Next tab'
    \ map <leader><Tab>] :tabnext<cr>
  Shortcut 'Switch to tab 1'
    \ map <leader><Tab>1 1gt<cr>
  Shortcut 'Switch to tab 2'
    \ map <leader><Tab>2 2gt<cr>
  Shortcut 'Switch to tab 3'
    \ map <leader><Tab>3 3gt<cr>
  Shortcut 'Switch to tab 4'
    \ map <leader><Tab>4 4gt<cr>
  Shortcut 'Switch to tab 5'
    \ map <leader><Tab>5 5gt<cr>
  Shortcut 'Switch to tab 6'
    \ map <leader><Tab>6 6gt<cr>
  Shortcut 'Switch to tab 7'
    \ map <leader><Tab>7 7gt<cr>
  map <leader><Tab><esc> <Nop>

  Shortcut 'Project sidebar'
    \ map <leader>op :NERDTreeToggle <c-r>=FindRootDirectory()<cr><cr>
  Shortcut 'Find file in project sidebar'
    \ map <leader>oP :NERDTreeFind<cr>
  Shortcut 'Terminal'
    \ map <leader>ot :belowright 10split \| lcd <c-r>=FindRootDirectory()<cr> \| terminal<cr>
  Shortcut 'Terminal here'
    \ map <leader>oT :belowright 10split \| lcd <c-r>=expand('%:p:h')<cr> \| terminal<cr>
  map <leader>o<esc> <Nop>

  Shortcut 'Switch workspace buffer'
    \ map <leader>, :WorkspaceBuffers<cr>
  Shortcut 'Switch workspace buffer'
    \ map <leader>bb :WorkspaceBuffers<cr>
  Shortcut 'Switch buffer'
    \ map <leader>bB :Buffers<cr>
  Shortcut 'Switch workspace buffer'
    \ map <leader>b, :WorkspaceBuffers<cr>
  Shortcut 'Next buffer'
    \ map <leader>b] :NextWorkspaceBuffer<cr>
  Shortcut 'Next buffer'
    \ map <leader>bn :NextWorkspaceBuffer<cr>
  Shortcut 'Previous buffer'
    \ map <leader>b[ :PreviousWorkspaceBuffer<cr>
  Shortcut 'Previous buffer'
    \ map <leader>bp :PreviousWorkspaceBuffer<cr>
  Shortcut 'Kill buffer'
    \ map <leader>bk :Bclose<cr>
  Shortcut 'Kill unsaved buffer'
    \ map <leader>bK :Bclose!<cr>
  Shortcut 'New empty buffer'
    \ map <leader>bN :vnew<cr>
  Shortcut 'Kill other buffers'
    \ map <leader>bo :%bd\|e#\|bd#<cr>
  Shortcut 'Switch buffer'
    \ map <leader>< :Buffers<cr>
  map <leader>b<esc> <Nop>

  Shortcut 'Previously edited buffer'
    \ map <bs> :PreviousEditedWorkspaceBuffer<cr>

  Shortcut 'Pop up scratch buffer'
    \ map <leader>bx :Scratch<cr>
  Shortcut 'Pop up scratch buffer'
    \ map <leader>x :Scratch<cr>

  Shortcut 'Jump to definition'
    \ map <leader>cd :Tags <c-r>=expand("<cword>")<cr><cr>
  Shortcut 'List errors'
    \ map <leader>cx :lopen<cr>
  Shortcut 'Compile'
    \ map <leader>cc :make<cr>
  Shortcut 'Format buffer/region'
    \ map <leader>cf :ALEFix<cr>
  Shortcut 'Ask agent about this'
    \ map <leader>ca <Cmd>lua require("opencode").ask("@this: ", { submit = true })<cr>
  map <leader>c<esc> <Nop>

  Shortcut 'Window movement'
    \ map <leader>w <c-w>
  Shortcut 'Next tab'
    \ map <c-Tab> gt
  Shortcut 'Previous tab'
    \ map <c-s-Tab> gT

  Shortcut 'Find file'
    \ map <leader>. :Files <c-r>=FindRootDirectory()<cr>/<cr>

  Shortcut 'Find file from here'
    \ map <leader>f/ :Files <c-r>=expand('%:p:h')<cr>/<cr>
  Shortcut 'Find file from here'
    \ map <leader>ff :Files <c-r>=expand('%:p:h')<cr>/<cr>
  Shortcut 'Find file'
    \ map <leader>f. :Files <c-r>=FindRootDirectory()<cr><cr>
  Shortcut 'Delete this file'
    \ map <leader>fX :Remove<cr>
  Shortcut 'Move file'
    \ map <leader>fm :Move <c-r>=expand('%:p')<cr>
  Shortcut 'Open project editorconfig'
    \ map <leader>fc :e <c-r>=FindRootDirectory()<cr>/.editorconfig<cr>
  Shortcut 'Recent files'
    \ map <leader>fr :History<cr>
  Shortcut 'Find file in private configuration'
    \ map <leader>fp :Files <c-r>=expand('$HOME')<cr>/.vim/<cr>
  Shortcut 'Yank filename'
    \ map <leader>fy :let @+ = expand('%:p')<cr>
  map <leader>f<esc> <Nop>

  Shortcut 'Find file in project'
    \ map <leader>p/ :GFiles <c-r>=FindRootDirectory()<cr><cr>
  map <leader>p<esc> <Nop>

  Shortcut 'Find file in project'
    \ map <leader><leader> :GFiles <c-r>=FindRootDirectory()<cr><cr>

  Shortcut 'Search for symbol in project'
    \ map <leader>* :Ack! -- <c-r>=expand("<cword>")<cr> <c-r>=FindRootDirectory()<cr><cr>
  Shortcut 'Search project'
    \ map <leader>/p :Ack! -- <c-r>=expand("<cword>")<cr> <c-r>=FindRootDirectory()<cr><c-b><s-right><s-right><s-right>
  Shortcut 'Search current directory'
    \ map <leader>/d :Ack! -- <c-r>=expand("<cword>")<cr> %:h<c-b><s-right><s-right><s-right>
  Shortcut 'Search buffer'
    \ map <leader>/b :Ack! -- <c-r>=expand("<cword>")<cr> %<c-b><s-right><s-right><s-right>
  Shortcut 'Search symbol'
    \ map <leader>/i :Ctags <c-r>=expand("<cword>")<cr>
  Shortcut 'Search git commits'
    \ map <leader>/g :Gclog! -S<c-r>=expand("<cword>")<cr> -- \| copen<s-left><s-left><s-left><left>
  Shortcut 'Search git file commits'
    \ map <leader>/G :0Gclog! -S<c-r>=expand("<cword>")<cr> -- \| copen<s-left><s-left><s-left><left>
  Shortcut 'Quicklist replace'
    \ map <leader>/: :cdo s/\(\<<c-r>=expand("<cword>")<cr>\>\)//g \| update<s-left><s-left><left><left><left>
  map <leader>/<esc> <Nop>

  Shortcut 'Git status'
    \ map <leader>gg :aboveleft Git<cr>
  Shortcut 'Git blame'
    \ map <leader>gB :Git blame<cr>
  Shortcut 'List git commits'
    \ map <leader>gl :Commits<cr>
  Shortcut 'List git file commits'
    \ map <leader>gL :BCommits<cr>
  Shortcut 'Git stage file'
    \ map <leader>gS :Git add %<cr>
  Shortcut 'Git unstage file'
    \ map <leader>gU :Git reset HEAD %<cr>
  Shortcut 'Git revert file'
    \ map <leader>gR :Git chekout -- %<cr>
  Shortcut 'Git fetch'
    \ map <leader>gF :Git fetch<cr>
  Shortcut 'Git remove file'
    \ map <leader>gx :Gremove %<cr>
  map <leader>g<esc> <Nop>

  Shortcut 'List commands'
    \ map <leader>hf :Helptags<cr>
  Shortcut 'Vim info'
    \ map <leader>hi :help<cr>
  map <leader>h<esc> <Nop>

  nmap <esc> :noh<cr>
  map <down> gj
  map <up> gk
  imap <down> <c-o>gj
  imap <up> <c-o>gk

  imap <c-s-v> <c-r><c-o>+
  tmap <c-s-v> <c-\><c-n>"+pi
  cmap <c-s-v> <c-r><c-o>+
  tmap <s-insert> <c-\><c-n>"*pi
  imap <s-insert> <c-r><c-o>*
  cmap <s-insert> <c-r><c-o>*
  cmap <c-g> <c-[>

  map f <Plug>Sneak_f
  map F <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T

  map <c-]> :Tag <c-r>=expand("<cword>")<cr><cr>

  nmap <X1Mouse> <c-o>
  nmap <X2Mouse> <c-i>
  nmap <c-LeftDrag> <LeftMouse><c-v>
  vmap <c-LeftDrag> <RightDrag>
  vmap <LeftRelease> "*ygv

  tmap <c-Tab> <c-\><c-o>gt
  tmap <c-s-Tab> <c-\><c-o>gT
endfunction

augroup workspace
  autocmd!
  autocmd BufWinEnter * WorkspaceAttachBuffer 
  autocmd BufDelete * WorkspaceDetachBuffer expand('<abuf>') 
augroup END

augroup shortcuts
  autocmd!
  autocmd VimEnter * call VimrcShortcuts()
augroup END

augroup termesc
  autocmd!
  autocmd TermOpen * silent tmap <buffer> <esc><esc> <c-\><c-n>
  autocmd TermOpen * silent tmap <buffer> <c-[><c-[> <c-\><c-n>
  autocmd TermOpen * silent tmap <buffer> <c-h> <c-\><c-n><c-w>h
  autocmd TermOpen * silent tmap <buffer> <c-j> <c-\><c-n><c-w>j
  autocmd TermOpen * silent tmap <buffer> <c-k> <c-\><c-n><c-w>k
  autocmd TermOpen * silent tmap <buffer> <c-l> <c-\><c-n><c-w>l
  autocmd TermOpen * silent tmap <buffer> <c-s-f> <c-\><c-n>/
  autocmd TermOpen * silent nnoremap <buffer> <bs> <bs>
  autocmd TermOpen * silent nnoremap <buffer> <MiddleMouse> "*pi
  autocmd TermOpen * silent vnoremap <buffer> <MiddleMouse> <esc>"*pi
  autocmd FileType fzf silent tunmap <buffer> <esc><esc>
  autocmd FileType fzf silent tunmap <buffer> <c-[><c-[>
  autocmd FileType fzf silent tunmap <buffer> <c-h>
  autocmd FileType fzf silent tunmap <buffer> <c-j>
  autocmd FileType fzf silent tunmap <buffer> <c-k>
  autocmd FileType fzf silent tunmap <buffer> <c-l>
augroup END

"--------------------------------------------------------------------------------------------------

function! HumanSize(bytes) abort
  let l:bytes = a:bytes
  if l:bytes < 0
    return '-'
  endif
  let l:sizes = ['B', 'KiB', 'MiB', 'GiB']
  let l:i = 0
  while l:bytes >= 1024
    let l:bytes = l:bytes / 1024.0
    let l:i += 1
  endwhile
  return printf('%.1f%s', l:bytes, l:sizes[l:i])
endfunction

function! CreateStatuslineColorLabel(label) abort
  let l:win = winnr()
  let l:label = ''
  let l:label .= '%9*%{winnr()!=' . l:win . '?" ".' . a:label . '." ":""}'
  let l:label .= '%3*%{winnr()==' . l:win . '&&mode()=~"^[n]"?" ".' . a:label . '." ":""}'
  let l:label .= '%1*%{winnr()==' . l:win . '&&mode()=~"^[it]"?" ".' . a:label . '." ":""}'
  let l:label .= '%2*%{winnr()==' . l:win . '&&mode()=~"^[r!]"?" ".' . a:label . '." ":""}'
  let l:label .= '%4*%{winnr()==' . l:win . '&&mode()=~"^[vc]"?" ".' . a:label . '." ":""}'
  return l:label
endfunction

function! GetBufferLabel() abort
  let l:label = expand('%:t')
  if l:label == ''
    let l:label = &buftype
  endif
  if l:label == ''
    let l:label = bufnr('%')
  endif
  return l:label
endfunction

function! CreateStatusline() abort
  let l:statusline = ''
  let l:statusline .= CreateStatuslineColorLabel('" ".GetBufferLabel().(&modified?"+":"")')
  let l:statusline .= '%0* %Y '
  let l:statusline .= '%<%{exists("w:quickfix_title")?w:quickfix_title:expand("%:p")} '
  let l:statusline .= '%= '
  let l:statusline .= '%{&fileencoding ? &fileencoding : &encoding} | '
  let l:statusline .= '%{&fileformat} | '
  let l:statusline .= '%{HumanSize(getfsize(expand("%:p")))} | '
  let l:statusline .= '%p%% '
  let l:statusline .= CreateStatuslineColorLabel('line(".").":".col(".")')
  return l:statusline
endfunction

set laststatus=2
set statusline=%!CreateStatusline()

function! GetTabLabel(n)
  let l:buffers = gettabvar(a:n, 'buffers', {})
  let l:label = sort(map(sort(keys(l:buffers)), {v -> expand('#' . v:val . ':p')}), {a, b -> a =~ '/' ? -1 : 1})[0]
  let l:label = pathshorten(substitute(l:label, '/[^/]*$', '',''))
  return empty(l:label) ? a:n : l:label
endfunction

function! CreateTabline()
  let l:tabline = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let l:tabline ..= '%#TabLineSel#'
    else
      let l:tabline ..= '%#TabLine#'
    endif
    let l:tabline ..= '%' .. (i + 1) .. 'T'
    let l:tabline ..= ' %{GetTabLabel(' .. (i + 1) .. ')} '
  endfor
  let l:tabline ..= '%#TabLineFill#%T'
  return l:tabline
endfunction

set tabline=%!CreateTabline()

augroup fzf
  autocmd!
  autocmd User FzfStatusLine :
augroup END

augroup chdir
  autocmd!
  autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif
augroup END

"--------------------------------------------------------------------------------------------------

set updatetime=750

function! HighlightBackground()
  if bufname('') =~ '^NERD_tree'
    setlocal winhighlight=Normal:NormalFloat
  else
    setlocal winhighlight=Normal:Normal
  endif
endfunction

function! HighlightWordUnderCursor()
  exec '2match' 'VisualNOS' '/\<'.expand('<cword>').'\>/'
endfunction

function! ClearWordHighlight()
  2match none
endfunction

augroup highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * silent! call HighlightWordUnderCursor()
  autocmd CursorMoved,CursorMovedI,WinLeave * silent! call ClearWordHighlight()
  autocmd TermOpen,BufWinEnter * silent! call HighlightBackground()
augroup END

augroup quickfix
  autocmd!
  autocmd Filetype qf setlocal statusline=%!CreateStatusline()
augroup END

"--------------------------------------------------------------------------------------------------

set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor
set guifont=Liberation\ Mono:h11
set linespace=1
let vim_markdown_preview_browser='Firefox'

if has('gui_running')
  set background=light

  function! FontSizePlus ()
    let l:font_size = matchstr(&guifont, '\d\+$')
    let &guifont = substitute(&guifont, '\d\+$', l:font_size + 1, '')
  endfunction

  function! FontSizeMinus ()
    let l:font_size = matchstr(&guifont, '\d\+$')
    let &guifont = substitute(&guifont, '\d\+$', l:font_size - 1, '')
  endfunction

  nmap <c-ScrollWheelUp> :call FontSizePlus()<cr>
  nmap <c-ScrollWheelDown> :call FontSizeMinus()<cr>

  nmap <c-s-t> :tabe \| lcd <c-r>=FindRootDirectory()<cr> \| terminal<cr>
  tmap <c-s-t> <c-\><c-n>:tabe \| lcd <c-r>=FindRootDirectory()<cr> \| terminal<cr>
  nmap <c-t> :tabe<cr>
  nmap <c-PageUp> gT
  tmap <c-PageUp> <c-\><c-n>gT
  nmap <c-PageDown> gt
  tmap <c-PageDown> <c-\><c-n>gt

  nmap <M-1> 1gt
  tmap <M-1> <c-\><c-n>1gt
  nmap <M-2> 2gt
  tmap <M-2> <c-\><c-n>2gt
  nmap <M-3> 3gt
  tmap <M-3> <c-\><c-n>3gt
  nmap <M-4> 4gt
  tmap <M-4> <c-\><c-n>4gt
  nmap <M-5> 5gt
  tmap <M-5> <c-\><c-n>5gt
  nmap <M-6> 6gt
  tmap <M-6> <c-\><c-n>6gt
  nmap <M-7> 7gt
  tmap <M-7> <c-\><c-n>7gt
  nmap <M-8> 8gt
  tmap <M-8> <c-\><c-n>8gt
  nmap <M-9> 9gt
  tmap <M-9> <c-\><c-n>9gt
endif

if exists('g:neovide')
  let g:neovide_remember_window_size = v:true
  let g:neovide_text_gamma = 0.0
  let g:neovide_text_contrast = 0.75
  let g:neovide_scale_factor = 1.0
  let g:neovide_floating_shadow = v:false
  let g:neovide_cursor_animation_length = 0
  let g:neovide_scroll_animation_length = 0
  let g:neovide_position_animation_length = 0
endif
