"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime "Triggers autoread when changing buffer 
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" shortcut for saving file
nmap <leader>w :w!<cr>

" Key to enter escape mode
inoremap <C-v> <ESC>

" Leader key
let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'preservim/nerdtree'
    Plug 'nvim-lua/popup.nvim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'coc-extensions/coc-omnisharp' 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'} 
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
    Plug 'wellle/targets.vim'
    Plug 'myusuf3/numbers.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'szw/vim-maximizer'
call plug#end()
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display line numbers
set number relativenumber

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap=h,<,>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Highlight the current cursor line number
set cursorline

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme gruvbox
    highlight Normal guibg=NONE ctermbg=NONE
"    highlight CursorLine term=bold cterm=NONE ctermbg=none  ctermfg=none gui=bold
"    highlight CursorLineNr term=bold cterm=none ctermbg=none ctermfg=yellow gui=bold

catch
endtry

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs by following the previous tabstops
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lineset tabstop=4

" Add underscore as a keyword so that 
set iskeyword-=_

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

""""""""""""""""
"Windows
""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
if match(&runtimepath, 'vim-maximizer') != -1
    map <C-w>m :MaximizerToggle<cr>
endif

""""""""""""""""
"Buffer
""""""""""""""""
" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Moving the buffer back and forth
map <leader>bl :bnext<cr>
map <leader>bh :bprevious<cr>
map <leader>be :buffer

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

""""""""
" Tabs
""""""""
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>th :tabm -1<cr>
map <leader>tl :tabm +1<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tp :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch current working directory to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc and KeyBindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow shift + y to behave like shift + d or shift + c
nnoremap Y y$

" Centering cursor 
nnoremap n nzzzv
vnoremap n nzzzv
nnoremap N Nzzzv
vnoremap N Nzzzv
nnoremap J mzJ`z

" Moving texts
vnoremap <up> :m '<-2<CR>gv=gv
vnoremap <down> :m '>+1<CR>gv=gv
inoremap <up> <esc>:m .-2<CR>==a
inoremap <down> <esc>:m .+1<CR>==a
nnoremap <up> :m .-2<CR>==
nnoremap <down> :m .+1<CR>==

" Remapping the wildmenu tab completion movement key so that moving down/up the menu is with down and up arrow keys
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" Autocompletion via tab
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Key to disable search highlight
noremap <leader>h :nohlsearch<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Copying and pasting in normal mode
noremap <leader>c "+y
noremap <leader>v "+p

" Disable arrow keys
no <right> <nop>
no <left> <nop>

" Disable middle button paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map <ScrollWheelUp> <Nop>
map <ScrollWheelDown> <Nop>
set mouse=a

" Set timeout time for when a key timeout
set timeoutlen=400

" Insert new line below or above keys
no - m`o<ESC>``
no _ m`O<ESC>``

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ve :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable comments continuation to the next line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fzf appear in middle of screen
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7 } }

" Open buffer via fzf
noremap <leader>fb :Buffers<cr>

" Change default keybindings
let g:fzf_action = {
    \ 'alt-v': 'vsplit',
    \ 'alt-s': 'split',
    \ 'alt-t': 'tab split' }

" Browse and open file via fzf
noremap <leader>ff :Files<cr>

" Browse and open file via fzf
noremap <leader>fm :Marks<cr>

" Tags in the current project
noremap <leader>ft :Tags<cr>

" RipGrep integration
" The function below is used to delegate all search operations including the fuzzy find operations to ripgrep
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case -- %s $(pwd)/* || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang FzfGrep call RipgrepFzf(<q-args>, <bang>0)
noremap <leader>fg :FzfGrep<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight yank setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:highlightedyank_highlight_duration = 150

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Terminal Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Terminal
if exists(':tnoremap')
    " Use <C-l> in terminal mode to leave terminal mode
    tnoremap <C-l> <C-\><C-n>

    " With this function you can reuse the same terminal in neovim.
    " You can toggle the terminal and also send a command to the same terminal.
    " Taken and modified from: https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23
    let s:monkey_terminal_window = -1
    let s:monkey_terminal_buffer = -1
    let s:monkey_terminal_job_id = -1

    function! MonkeyTerminalOpen()
        " Check if buffer exists, if not create a window and a buffer
        if !bufexists(s:monkey_terminal_buffer)
            " Creates a window call monkey_terminal
            new monkey_terminal
            " Moves to the window below the current one
            wincmd L
            let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })

            " Change the name of the buffer to "Terminal 1"
            silent file Terminal\ 1
            " Gets the id of the terminal window
            let s:monkey_terminal_window = win_getid()
            let s:monkey_terminal_buffer = bufnr('%')

            " The buffer of the terminal won't appear in the list of the buffers
            " when calling :buffers command
            set nobuflisted

            " Change to current buffer directory
            call chansend(s:monkey_terminal_job_id, "cd ")
            call chansend(s:monkey_terminal_job_id, getcwd())
            call chansend(s:monkey_terminal_job_id, "\n")
        else
            if !win_gotoid(s:monkey_terminal_window)
                vsp
                " Moves to the window below the current one
                wincmd L
                buffer Terminal\ 1
                " Gets the id of the terminal window
                let s:monkey_terminal_window = win_getid()
            endif
        endif
    endfunction

    function! MonkeyTerminalToggle()
        if win_gotoid(s:monkey_terminal_window)
            call MonkeyTerminalClose()
        else
            " Resize terminal window to be 1/2 of main window
            let s:main_window_height = winwidth(0) * 1/2
            call MonkeyTerminalOpen()
            exe 'resize' s:main_window_height
        endif
    endfunction

    function! MonkeyTerminalClose()
        if win_gotoid(s:monkey_terminal_window)
            " close the current window
            hide
        endif
    endfunction

    nnoremap <silent> <M-cr> :call MonkeyTerminalToggle()<cr>a
    inoremap <silent> <M-cr> <Esc>:call MonkeyTerminalToggle()<cr>a
    tnoremap <silent> <M-cr> <C-\><C-n>:call MonkeyTerminalToggle()<cr>
endif
