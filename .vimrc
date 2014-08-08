" Disable vi compatibility mode - we don't need it!
set nocompatible

" Disable default filetype detection
filetype off

" Vundle load
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'

call vundle#end()

" Set the leader key to , because it's easier to get to
let mapleader=","

" Set shortcuts to edit and reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


set hidden       " Don't close buffers but hide them
set nowrap       " Don't wrap lines
set tabstop=4    " A tab is four spaces
set backspace=indent,eol,start
                 " Allow backspacing over everything in insert mode
set autoindent   " Always autoindent
set copyindent   " Copy the previous indentation on autoindenting
set number       " Always show line numbers
set shiftwidth=4 " Numbber of spaces to use for autoindenting
set shiftround   " Use multiple of shiftwidth when inenting with '<' and '>'
set showmatch    " Set show matching parenthesis
set ignorecase   " Ignore case when searching
set smartcase    " Ignore case if search pattern is all lowercase,
                 "     case-sensitive otherwise 
set smarttab     " Insert tabs on the start of a line according to
                 "     shiftwidth, not tabstop
set hlsearch     " Highlight search terms
set incsearch    " Show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell           " don't beep
set noerrorbells         " don't beep

" Don't bother using vim's backup facility. Git is perfectly capable for
" tracking changes
set nobackup
set noswapfile

" Enable file type plugins for syntax rule autodetection
if has('autocmd')
    filetype plugin indent on
    autocmd filetype python set expandtab
endif

" Syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax on
    set background=dark
endif

" Paste mode shortcut
set pastetoggle=<leader>p

" Remap colon with semicolon to speed up typing vim commands
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Disable the arrow keys to use vim bindings
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Make moving between lines that have been wrapped more natural
nnoremap j gj
nnoremap k gk

" Clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" CtrlP

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
