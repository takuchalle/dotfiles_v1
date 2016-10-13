" Note: Skip initialization for vim-tiny or vim-small.
syntax on

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

nnoremap <Esc><Esc> :<C-u>set nohlsearch!<CR>

set cursorline
set whichwrap=b,s,h,l,<,>,[,],~

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set showmatch

set wildmenu
set history=5000

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
        if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'itchyny/lightline.vim'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

