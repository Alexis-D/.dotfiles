set nocompatible

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a 
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" --

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" --

set history=5000
set ruler
set incsearch

" --

let mapleader = ','

" --

set background=dark
set shellcmdflag=-c
set number
set showcmd

" ---
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent "useless ?
set shiftround

autocmd FileType make setlocal noexpandtab
autocmd FileType haskell setlocal tabstop=2
autocmd FileType haskell setlocal shiftwidth=2

" ---

filetype plugin on

" ---

set hidden

" ---

set showmatch
set ignorecase
set smartcase " ignore la casse si tout en minuscule, la prends en compte sinon
set title
set cursorline

" ---

set pastetoggle=<F2> " supprime le 'bug' du c/C (oui c'est le coller, pour le copier, F2 via un plugin) dans vim

" ---

set autochdir " change le current directory pour celui du fichier

" ---

nmap j gj
nmap k gk

" ---

autocmd BufNewFile * silent! 0r ~/.vim/tpl/%:e.tpl

" ---

set nobackup
set nowritebackup
set noswapfile

" ---

set omnifunc=syntaxcomplete#Complete

" ---

set so=5 " afficher x lignes en plus quand on scrolle vers le bas

" ---

set t_Co=256
colo xoria256
"colo neverland2-darker

"if &t_Co > 8
"    colo molokai
"endif

" ---

nmap <C-j> <C-w>j<C-w>_
nmap <C-k> <C-w>k<C-w>_
nmap <C-h> <C-w>h<C-w><Bar>
nmap <C-l> <C-w>l<C-w><Bar>

" ---

" also increment/decrement character with <C-a>, <C-x>
set nrformats=octal,hex,alpha

" --

" nnoremap / /\v
" vnoremap / /\v

" --

set gdefault " :s/??/!!/g without g, to come back to default add g

" --

nnoremap <leader><space> :noh<cr>

" --

nnoremap <tab> %
vnoremap <tab> %

" --

inoremap jj <ESC>

" --

" when forget sudo
cmap w!! %!sudo tee > /dev/null %

" --

