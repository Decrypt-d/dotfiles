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
nmap G Gzz

no - m`o<ESC>``
no _ m`O<ESC>``

set laststatus=2

call plug#begin('~/.vim/plugged')
    Plug 'vim-python/python-syntax'
    Plug 'bling/vim-bufferline'
    Plug 'itchyny/lightline.vim'
	Plug 'pangloss/vim-javascript'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'dylanaraps/wal.vim'
    Plug 'mxw/vim-jsx'
call plug#end()

let g:lightline = { 'colorscheme': 'wal'}

"Enable NerdTree On Launch
"NERDTreeToggle
