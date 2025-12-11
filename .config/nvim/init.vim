set nobackup
set noswapfile

set title
set ignorecase
set smartcase
set nonumber relativenumber
set tagcase=match
set clipboard=unnamedplus
set mouse=ar
set mousemodel=extend
set winborder=solid

set t_Co=256
colorscheme cyan

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent nocindent nosmartindent indentexpr=-1 breakindent breakindentopt=shift:4

set fillchars+=vert:┃
set noequalalways

let $EDITOR='nvr --remote-tab-wait'
let $VISUAL=$EDITOR
let $PAGER='cat'

set wildignore=*.class,*.o,*.meta,*.dll,*.pdb,*.exe,*.asset,*.unity,*.prefab,*.min.js,*.min.css,tags,node_modules,venv,bin,obj,build,dist

"--------------------------------------------------------------------------------------------------

let g:no_plugin_maps = 1

call plug#begin()
Plug 'justinmk/vim-sneak'
Plug 'neovim/nvim-lspconfig'
Plug 'nvimtools/none-ls.nvim'
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
Plug 'marcinjahn/gemini-cli.nvim'
call plug#end()

if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --hidden --skip-vcs-ignores --ignore .git -g ""'
  let g:ackprg = 'ag --vimgrep --hidden --ignore .git'
endif
let $FZF_DEFAULT_OPTS='--style minimal --color=16,bg+:255,fg+:232,gutter:255,hl:44,pointer:44,info:44,header:44,border:15 --border=none'
let g:fzf_layout = { 'down': '40%' }
let g:ack_qhandler = 'belowright copen 10'
let g:jsx_ext_required = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_json_syntax_conceal = 0
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeAutoCenter = 0
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeStatusline = -1
let g:NERDTreeWinSize = 44
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:fugitive_dynamic_colors = 0
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git', '.svn']

lua << EOF
if not vim.g.snacks_loaded then
  require('snacks').setup({
    terminal = { enabled = true },
  })
  vim.g.snacks_loaded = true
end

require('nvim-treesitter.configs').setup({
  highlight = { enable = true },
  indent = { enable = false },
})

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
  signs = true,
  underline = false,
  update_in_insert = false,
})

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function(args)
    vim.diagnostic.setloclist({open = false})
  end,
})

vim.lsp.enable('pyright')
vim.lsp.enable('eslint')
vim.lsp.enable('ts_ls')

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = {"--dialect", "postgres"},
    }),
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = {"--dialect", "postgres"},
    }),
  },
})
EOF

"--------------------------------------------------------------------------------------------------

function! s:mod(n,m)
  return ((a:n % a:m) + a:m) % a:m
endfunction

function! s:IsEditableBuffer(bufnum)
  return buflisted(a:bufnum) && getbufvar(a:bufnum, '&modifiable')
endfunction

function! s:GetBuffers(...)
  let l:filtered = get(a:, 1, 0)
  let l:sorted = get(a:, 2, 0)
  let l:Compare = sorted
    \ ? {
      \ a, b ->
      \ (b.bufnr == bufnr()) - (a.bufnr == bufnr()) ??
      \ (b.hidden && !a.hidden) - (a.hidden && !b.hidden) ??
      \ (b.lastused - a.lastused)
    \ }
    \ : { a, b -> a.bufnr - b.bufnr }
  let l:bufnumbers = map(sort(getbufinfo(), l:Compare), {v -> v:val.bufnr})
  let l:bufnumbers = filtered
    \ ? filter(l:bufnumbers, {v -> s:IsEditableBuffer(v:val)})
    \ : filter(l:bufnumbers, {v -> bufloaded(v:val)})
  return l:bufnumbers
endfunction

function! s:LastVisitedWorkspaceBuffer(...)
  let l:force = get(a:, 1, 0)
  if !l:force && !s:IsEditableBuffer(bufnr())
    return
  endif
  let l:buffers = filter(s:GetBuffers(1, 1), {v -> v:val != bufnr() })
  if len(l:buffers) > 0
    execute 'buffer ' .  buffers[0]
  endif
endfunction
command! LastVisitedWorkspaceBuffer call s:LastVisitedWorkspaceBuffer()

function! s:LastVisitedBuffer(...)
  let l:buffers = filter(s:GetBuffers(0, 1), {v -> v:val != bufnr() })
  if len(l:buffers) > 0
    execute 'buffer ' .  buffers[0]
  endif
endfunction
command! LastVisitedBuffer call s:LastVisitedBuffer()

function! s:NextWorkspaceBuffer()
  let l:buffers = s:GetBuffers(1)
  execute 'buffer ' . l:buffers[s:mod((index(buffers, bufnr()) + 1), len(l:buffers))]
endfunction
command! NextWorkspaceBuffer call s:NextWorkspaceBuffer()

function! s:PreviousWorkspaceBuffer()
  let l:buffers = s:GetBuffers(1)
  execute 'buffer ' . l:buffers[s:mod((index(buffers, bufnr()) - 1), len(l:buffers))]
endfunction
command! PreviousWorkspaceBuffer call s:PreviousWorkspaceBuffer()

function! s:PreviewBuffers(buffers)
  call fzf#vim#buffers('', {
    \ 'source': map(a:buffers, {v -> fzf#vim#_format_buffer(v:val)}),
    \ 'options': ['--preview', '[[ -f {4} ]] && bat --theme=ansi --color=always --plain {4}']
  \ })
endfunction

function! s:WorkspaceBuffers(...)
  call s:PreviewBuffers(s:GetBuffers(1, 1))
endfunction
command! WorkspaceBuffers call s:WorkspaceBuffers()

function! s:Buffers(...)
  call s:PreviewBuffers(s:GetBuffers(0, 1))
endfunction
command! Buffers call s:Buffers()

function! s:Bclose(bang, buffer)
  let l:buffernr = empty(a:buffer) ? bufnr() : str2nr(a:buffer)
  if l:buffernr == bufnr() 
      \ && (a:bang || (!getbufvar(l:buffernr, '&modified') && !getbufvar(l:buffernr, 'terminal_job_id'))) 
      \ && (tabpagenr('$') == 1 || len(tabpagebuflist()) > 1)
    call s:LastVisitedWorkspaceBuffer(1)
  endif
  if bufloaded(l:buffernr)
    execute 'bdelete' . a:bang . ' ' . l:buffernr
  endif
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')

function! VimrcShortcuts()
  map <space> <leader>
  map <space>m <localleader>
  map <space><space> <leader><leader>
  map <leader><esc> <Nop>

  Shortcut 'Run shortcut'
    \ map <leader> <cmd>Shortcuts<cr><leader>

  Shortcut 'Commands'
    \ map <leader>: <cmd>Commands<cr>

  Shortcut 'New tab'
    \ map <leader><Tab>n <cmd>tabe<cr>
  Shortcut 'Delete tab'
    \ map <leader><Tab>d <cmd>tabclose<cr>
  Shortcut 'Previous tab'
    \ map <leader><Tab>[ <cmd>tabprevious<cr>
  Shortcut 'Next tab'
    \ map <leader><Tab>] <cmd>tabnext<cr>
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
    \ map <leader>op <cmd>execute 'NERDTreeToggle ' . FindRootDirectory()<cr>
  Shortcut 'Find file in project sidebar'
    \ map <leader>oP <cmd>NERDTreeFind<cr>
  Shortcut 'Terminal'
    \ nmap <leader>ot <cmd>call execute([ 'belowright 10split', 'lcd ' . FindRootDirectory(), 'terminal' ])<cr>
  Shortcut 'Terminal here'
    \ map <leader>oT <cmd>call execute([ 'belowright 10split', 'lcd ' . expand('%:p:h'), 'terminal' ])<cr>
  Shortcut 'Agent prompt'
    \ map <leader>oa <cmd>call execute([ 'lcd ' . FindRootDirectory(), 'lua require("opencode").toggle()' ])<cr>
  Shortcut 'Ask agent about this'
    \ map <leader>oA <cmd>call execute([ 'lcd ' . FindRootDirectory(), 'lua require("opencode").ask("@this: ", { submit = true })' ])<cr>
  map <leader>o<esc> <Nop>

  Shortcut 'Switch workspace buffer'
    \ map <leader>, <cmd>WorkspaceBuffers<cr>
  Shortcut 'Switch workspace buffer'
    \ map <leader>bb <cmd>WorkspaceBuffers<cr>
  Shortcut 'Switch buffer'
    \ map <leader>bB <cmd>Buffers<cr>
  Shortcut 'Switch workspace buffer'
    \ map <leader>b, <cmd>WorkspaceBuffers<cr>
  Shortcut 'Switch buffer'
    \ map <leader>b< <cmd>Buffers<cr>
  Shortcut 'Next workspace buffer'
    \ map <leader>b] <cmd>NextWorkspaceBuffer<cr>
  Shortcut 'Next workspace buffer'
    \ map <leader>bn <cmd>NextWorkspaceBuffer<cr>
  Shortcut 'Previous workspace buffer'
    \ map <leader>b[ <cmd>PreviousWorkspaceBuffer<cr>
  Shortcut 'Previous workspace buffer'
    \ map <leader>bp <cmd>PreviousWorkspaceBuffer<cr>
  Shortcut 'Kill buffer'
    \ map <leader>bk <cmd>Bclose<cr>
  Shortcut 'Kill unsaved buffer'
    \ map <leader>bK <cmd>Bclose!<cr>
  Shortcut 'New empty buffer'
    \ map <leader>bN <cmd>vnew<cr>
  Shortcut 'Kill other buffers'
    \ map <leader>bo <cmd>%bd\|e#\|bd#<cr>
  Shortcut 'Switch buffer'
    \ map <leader>< <cmd>Buffers<cr>
  map <leader>b<esc> <Nop>

  Shortcut 'Previously visited workspace buffer'
    \ map <bs> <cmd>LastVisitedWorkspaceBuffer<cr>
  Shortcut 'Previously visited buffer'
    \ map <s-bs> <cmd>LastVisitedBuffer<cr>

  Shortcut 'Pop up scratch buffer'
    \ map <leader>bx <cmd>Scratch<cr>
  Shortcut 'Pop up scratch buffer'
    \ map <leader>x <cmd>Scratch<cr>

  Shortcut 'Go to definition'
    \ map <leader>cd <cmd>lua vim.lsp.buf.definition()<cr>
  Shortcut 'Go to declaration'
    \ map <leader>cD <cmd>lua vim.lsp.buf.declaration()<cr>
  Shortcut 'Display symbol information'
    \ map <leader>cK <cmd>lua vim.lsp.buf.hover()<cr>
  Shortcut 'Go to implementation'
    \ map <leader>ci <cmd>lua vim.lsp.buf.implementation()<cr>
  Shortcut 'List symbol references'
    \ map <leader>cl <cmd>lua vim.lsp.buf.references()<cr>
  Shortcut 'List errors'
    \ map <leader>cx <cmd>lopen<cr>
  Shortcut 'Compile'
    \ map <leader>cc <cmd>make<cr>
  Shortcut 'Format buffer/region'
    \ map <leader>cf <cmd>lua vim.lsp.buf.format({ async = true, timeout_ms = 8000 })<cr>
  Shortcut 'List LSP code actions'
    \ map <leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
  Shortcut 'Rename symbol'
    \ map <leader>cr <cmd>lua vim.lsp.buf.rename()<cr>
  map <leader>c<esc> <Nop>

  Shortcut 'Window movement'
    \ map <leader>w <c-w>
  Shortcut 'Next tab'
    \ map <c-Tab> gt
  Shortcut 'Previous tab'
    \ map <c-s-Tab> gT

  Shortcut 'Find file'
    \ map <leader>. <cmd>execute 'Files ' . FindRootDirectory() . '/'<cr>

  Shortcut 'Find file from here'
    \ map <leader>f/ <cmd>execute 'Files ' . expand('%:p:h')/<cr>
  Shortcut 'Find file from here'
    \ map <leader>f/ <cmd>execute 'Files ' . expand('%:p:h')/<cr>
  Shortcut 'Find file'
    \ map <leader>f. <cmd>execute 'Files ' . FindRootDirectory()<cr>
  Shortcut 'Delete this file'
    \ map <leader>fX <cmd>Remove<cr>
  Shortcut 'Move file'
    \ map <leader>fm <cmd>execute 'Move ' . expand('%:p')<cr>
  Shortcut 'Open project editorconfig'
    \ map <leader>fc <cmd>execute 'e ' . FindRootDirectory() . '/.editorconfig'<cr>
  Shortcut 'Recent files'
    \ map <leader>fr <cmd>History<cr>
  Shortcut 'Find file in private configuration'
    \ map <leader>fp <cmd>execute 'Files ' . fnamemodify($MYVIMRC, ':h')<cr>
  Shortcut 'Yank filename'
    \ map <leader>fy <cmd>let @+ = expand('%:p')<cr>
  map <leader>f<esc> <Nop>

  Shortcut 'Find file in project'
    \ map <leader>p/ <cmd>execute 'GFiles ' . FindRootDirectory()<cr>
  map <leader>p<esc> <Nop>
  Shortcut 'Find file in project'
    \ map <leader><leader> <cmd>execute 'GFiles ' . FindRootDirectory()<cr>

  Shortcut 'Search for symbol in project'
    \ map <leader>* <cmd>execute 'Ack! -- ' . expand("<cword>") . ' ' . FindRootDirectory()<cr>
  Shortcut 'Search project'
    \ map <leader>/p :Ack! -- <c-r>=expand("<cword>")<cr> <c-r>=FindRootDirectory()<cr><c-b><s-right><s-right><s-right>
  Shortcut 'Search current directory'
    \ map <leader>/d :Ack! -- <c-r>=expand("<cword>")<cr> %:h<c-b><s-right><s-right><s-right>
  Shortcut 'Search buffer'
    \ map <leader>/b :Ack! -- <c-r>=expand("<cword>")<cr> %<c-b><s-right><s-right><s-right>
  Shortcut 'Search git commits'
    \ map <leader>/g :Gclog! -S<c-r>=expand("<cword>")<cr> -- \| copen<s-left><s-left><s-left><left>
  Shortcut 'Search git file commits'
    \ map <leader>/G :0Gclog! -S<c-r>=expand("<cword>")<cr> -- \| copen<s-left><s-left><s-left><left>
  Shortcut 'Quicklist replace'
    \ map <leader>/: :cdo s/\(\<<c-r>=expand("<cword>")<cr>\>\)//g \| update<s-left><s-left><left><left><left>
  map <leader>/<esc> <Nop>

  Shortcut 'Git status'
    \ map <leader>gg <cmd>aboveleft Git<cr>
  Shortcut 'Git blame'
    \ map <leader>gB <cmd>Git blame<cr>
  Shortcut 'List git commits'
    \ map <leader>gl <cmd>Commits<cr>
  Shortcut 'List git file commits'
    \ map <leader>gL <cmd>BCommits<cr>
  Shortcut 'Git stage file'
    \ map <leader>gS <cmd>Git add %<cr>
  Shortcut 'Git unstage file'
    \ map <leader>gU <cmd>Git reset HEAD %<cr>
  Shortcut 'Git revert file'
    \ map <leader>gR <cmd>Git checkout -- %<cr>
  Shortcut 'Git fetch'
    \ map <leader>gF <cmd>Git fetch<cr>
  Shortcut 'Git remove file'
    \ map <leader>gx <cmd>Gremove %<cr>
  map <leader>g<esc> <Nop>

  Shortcut 'List commands'
    \ map <leader>hf <cmd>Helptags<cr>
  Shortcut 'Vim info'
    \ map <leader>hi <cmd>help<cr>
  map <leader>h<esc> <Nop>

  nmap <esc> <cmd>noh<cr>
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

  map f <Plug>Sneak_f
  map F <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T

  nmap <X1Mouse> <c-o>
  nmap <X2Mouse> <c-i>
  nmap <c-LeftMouse> <cmd><cr>
  nmap <c-LeftDrag> <LeftMouse><c-v>
  vmap <c-LeftDrag> <RightDrag>

  tmap <c-Tab> <c-\><c-o>gt
  tmap <c-s-Tab> <c-\><c-o>gT

  nmap <c-t> <cmd>tabe<cr>
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

  nmap <M-h> <c-h>
  tmap <M-h> <c-h>
  nmap <M-j> <c-j>
  tmap <M-j> <c-j>
  nmap <M-k> <c-k>
  tmap <M-k> <c-k>
  nmap <M-l> <c-l>
  tmap <M-l> <c-l>
  nmap <M-tab> <c-w>w
endfunction

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

function! s:OnLspAttach()
  nnoremap <silent> <buffer> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> <buffer> K <cmd>lua vim.lsp.buf.hover()<CR>
  setlocal omnifunc=v:lua.vim.lsp.omnifunc
endfunction

augroup lsp_attach_keymaps
  autocmd!
  autocmd LspAttach * call s:OnLspAttach()
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

function! GetBufferLabel(...) abort
  let l:bufnum = get(a:, 1, bufnr())
  return expand('#' .. l:bufnum .. ':t') ?? getbufvar(l:bufnum, '&buftype') ?? l:bufnum
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

function! GetTabLabel(n) abort
  let l:buflist = tabpagebuflist(a:n)
  let l:winnr = tabpagewinnr(a:n)
  return GetBufferLabel(l:buflist[l:winnr - 1])
endfunction

function! CreateTabline() abort
  let l:tabline = ''
  for i in range(tabpagenr('$'))
    let l:tabline ..= i + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
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
  if bufname('') =~ '^NERD_tree' || bufname('') =~ '\(opencode\|gemini\)$'
    setlocal winhighlight=Normal:ColorColumn
  elseif get(nvim_win_get_config(win_getid()), 'zindex', 0) > 0
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

lua << EOF
local timer = nil

local function sync_selection()
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" or mode == "\22" then
        local start_pos = vim.fn.getpos("v")
        local end_pos = vim.fn.getpos(".")
        local lines = vim.fn.getregion(start_pos, end_pos, {type = mode})
        vim.fn.setreg("*", table.concat(lines, "\n"))
    end
end

vim.api.nvim_create_autocmd("CursorMoved", {
    desc = "Keep * register synced with visual selection (debounced)",
    callback = function()
        local mode = vim.fn.mode()
        if mode == "v" or mode == "V" or mode == "\22" then
            if timer then
                vim.fn.timer_stop(timer)
            end
            -- Sync after 100ms of no cursor movement
            timer = vim.fn.timer_start(100, sync_selection)
        end
    end,
})
EOF

"--------------------------------------------------------------------------------------------------

set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor
set guifont=Liberation\ Mono:h11
set linespace=1

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

  nmap <c-ScrollWheelUp> <cmd>call FontSizePlus()<cr>
  nmap <c-ScrollWheelDown> <cmd>call FontSizeMinus()<cr>

  map <c-s-t> <cmd>execute 'tabe | lcd ' . FindRootDirectory() . ' | terminal'<cr>
  tmap <c-s-t> <cmd>execute 'tabe | lcd ' . FindRootDirectory() . ' | terminal'<cr>
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
