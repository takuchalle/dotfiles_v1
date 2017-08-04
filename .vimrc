" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

syntax on

set background=dark

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
set fileformats=unix,mac,dos
set ambiwidth=double
" tab and indent
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set smartindent
set shiftwidth=4
set ruler

set incsearch
set ignorecase
set smartcase
set hlsearch

set laststatus=2

nnoremap <Esc><Esc> :<C-u>set nohlsearch!<CR>

set cursorline
set whichwrap=b,s,h,l,<,>,[,],~

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
noremap <C-a> <Esc>^
noremap <C-e> <Esc>$
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$i

noremap <C-x><C-R> :Unite file_mru<CR> " 

set showmatch

set wildmenu
set history=5000

"
" dein.vm
" https://github.com/Shougo/dein.vim
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('itchyny/lightline.vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('scrooloose/nerdtree')
  call dein#add('glidenote/memolist.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/neocomplete')
  call dein#add('Shougo/vimfiler')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('fatih/vim-go')
  call dein#add('justmao945/vim-clang')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"" Set color
colorscheme solarized

" set 256 colors for vim
set t_Co=256

" setting for lightline
"
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

"" set option for vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=lib++ --pedantic-errors'

