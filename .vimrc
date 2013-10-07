" ##### vundle Setting #####
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

filetype plugin indent on
" ##### vundle Setting #####

" Vundle 
Bundle 'itchyny/lightline.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'vim-scripts/vim-auto-save'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'surround.vim'
Bundle 'ruby-matchit'
Bundle 'switch.vim'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'

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

" auto indent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" ruby hash style 1.8 -> 1.9
vnoremap <silent> <C-m> :s/:\([a-zA-Z0-9_]\+\)\s*=>/\1:/g<CR>
nnoremap <silent> <C-m> :s/:\([a-zA-Z0-9_]\+\)\s*=>/\1:/g<CR>

" Shorten waiting time when press ESC
set ttimeoutlen=10         

" number
set number
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

" scroll
set scrolloff=5

" syntax
syntax on
filetype plugin on
filetype indent on
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" color setting
set t_Co=256

" lightline.vim
let g:lightline = {
  \ 'colorshceme' : 'wombat',
  \ }

if !has('gui_running')
  set t_Co=256
endif

" vim-auto-save
let g:auto_save = 0

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
