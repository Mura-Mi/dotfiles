" ##### vundle Setting #####
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/'))
endif

syntax enable

filetype plugin indent on
" ##### NeoBundle Setting #####

" NeoBundle 
NeoBundleCheck
NeoBundleFetch 'Shugo/neobundle.vim'

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'surround.vim'
NeoBundle 'ruby-matchit'
NeoBundle 'switch.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'thoughtbot/vim-rspec'
if v:version > 702 
  NeoBundle 'myusuf3/numbers.vim'
endif
NeoBundle 'tpope/vim-commentary'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'elzr/vim-json'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-endwise'

if has('vim_starting')
  call neobundle#end()
endif

" tab and indent
set ts=2 sw=2
set autoindent
set smartindent
set expandtab

" highlight wrap
set showmatch

" make fast to access terminal
set ttyfast

" search setting
set hlsearch

" command history
set history=200

" auto indent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" move to head of line on press 0
nnoremap <expr> 0
\  match(strpart(getline('.'), 0, col('.') - 1), '^\s\+$') >= 0 ? '0' : '^'

" ruby hash style 1.8 -> 1.9
vnoremap <silent> <C-m> :s/:\([a-zA-Z0-9_]\+\)\s*=>/\1:/g<CR>
nnoremap <silent> <C-m> :s/:\([a-zA-Z0-9_]\+\)\s*=>/\1:/g<CR>

" Shorten waiting time when press ESC
set ttimeoutlen=10         

""" KEYMAPS 
" swap locical and physical j/k 
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" number
set number
nnoremap <F2> :setlocal spell! spelllang=en_us<CR>
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" showing cursor line
set ruler
" set cursorline
" hi CursorLine cterm=none ctermfg=none ctermbg=200
" ctermbg=242

" status line
set laststatus=2
set showcmd
set statusline+=%h

" vim-coffee-script
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

" scroll
set scrolloff=5

" syntax
syntax on
filetype plugin on
filetype indent on
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
" change cursor if japanese input on
if has('multi_byte_ime') || has('xim') 
  highlight Cursor guifg=NONE guibg=White
  highlight CursorIM guifg=NONE guibg=DarkRed
endif

" color setting
set t_Co=256

" color setting for diff
hi DiffAdd ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText ctermfg=black ctermbg=7

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" lightline.vim
let g:lightline = {
  \ 'colorshceme' : 'wombat',
  \ }

if !has('gui_running')
  set t_Co=256
endif

" vim-auto-save
let g:auto_save = 0

" matchit
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" ##### TAB PAGE #####
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag] <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
" ##### TAB PAGE #####
"
set vb t_vb=
