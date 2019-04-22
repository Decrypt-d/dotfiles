set belloff=all                                         
set showcmd                                                
set tabstop=4                                              
set number                                                 
set encoding=utf-8                                         
set backspace=indent,eol,start                             
colorscheme my_color_scheme
                                                           
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
                                                           
nmap , <C-w>w                                              
nmap . <C-w>r                                              
nmap G Gzz                                                 
                                                           
no - m`o<ESC>``                                            
no _ m`O<ESC>``                                            
                                                           
set laststatus=2                                                          

call plug#begin('~/.vim/plugged')                   
    Plug 'vim-python/python-syntax'                        
    Plug 'bling/vim-bufferline'                            
    Plug 'itchyny/lightline.vim'                           
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'octol/vim-cpp-enhanced-highlight'                
call plug#end()                                            

let g:lightline = { 'colorscheme': 'PaperColor_light'}

"Enable NerdTree On Launch
"NERDTreeToggle 

