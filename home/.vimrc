""no vi compatibility
set nocompatible

""line numbers
set number relativenumber

""synatax highligting
syntax on

""set tab size
set tabstop=4

""auto indent new line
set autoindent

""detect file type
filetype on

""use plugins for file types
filetype plugin on

""show all search results
set incsearch

""min cursor distance to top and bottom
set scrolloff=10

""ignore search case
set ignorecase

""Upper case search
set smartcase

""show partial commands
set showcmd

""show current mode
set showmode

""use system clipboard
set clipboard=unnamedplus

""set leader key
let mapleader=" "

set showmatch

set hlsearch

set history=100

set nowrap

set wildmenu

set wildmode=list:longest

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set ttyfast

set laststatus=2

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

noremap <leader>p "_dP
noremap <leader>d "_d
noremap <leader>o o<Esc>
noremap <leader>O O<Esc>

