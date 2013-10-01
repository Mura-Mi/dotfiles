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

" tab and indent
set ts=2 sw=2
set autoindent
set expandtab
"
" auto indent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Shorten waiting time when press ESC
set ttimeoutlen=10         

" number
set number
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" syntax
syntax on
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
"
" lightline.vim
let g:lightline = {
  \ 'colorshceme' : 'wombat',
  \ }

if !has('gui_running')
  set t_Co=256
endif

" vim-auto-save
let g:auto_save = 1

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
