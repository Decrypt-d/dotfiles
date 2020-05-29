"Set the runtime path of vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')
	Plug 'hail2u/vim-css3-syntax'
	Plug 'vim-python/python-syntax'
	Plug 'itchyny/lightline.vim'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'mxw/vim-jsx'
	Plug 'dylanaraps/wal.vim'
call plug#end()

set belloff=all
set showcmd
set tabstop=4
set number
set encoding=utf-8
set smartindent
set shiftwidth=4
set mouse=a
set cursorline
set iskeyword-=_
set autoread

syntax on
colorscheme wal
set background=dark

autocmd Colorscheme * colorscheme wal

noremap Y "zy
noremap P "zp
noremap <C-x> "+y
noremap <C-z> "+p

inoremap jj <ESC>l

no <right> <nop>
no <left> <nop>
nmap <up> ddkkp
nmap <down> ddp

vno <up> <nop>
vno <left> <nop>
vno <right> <nop>
vno <down> <nop>

ino <up> <nop>
ino <left> <nop>
ino <right> <nop>
ino <down> <nop>
ino g<left> gT
ino g<right> gt

nmap , <C-w>w
"nmap . <C-w>r

no - m`o<ESC>``
no _ m`O<ESC>``

set laststatus=2



let g:lightline = { 'colorscheme': 'wal'}

set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Enable NerdTree On Launch
"NERDTreeToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
