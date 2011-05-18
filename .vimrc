set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Start of Custom .vimrc

set background=dark
set shellcmdflag=-c
set number
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent "useless ?

autocmd FileType make setlocal noexpandtab

" ---

filetype plugin on

" ---

set hidden
set showmatch
set shiftround
set ignorecase
set smartcase " ignore la casse si tout en minuscule, la prends en compte sinon
set title
set cursorline
" set fdm=indent

set pastetoggle=<F2> " supprime le 'bug' du c/C (oui c'est le coller, pour le copier, F2 via un plugin) dans vim

" ---

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ---

set autochdir " change le current directory pour celui du fichier

" ---

map j gj
map k gk

" ---

autocmd BufNewFile * silent! 0r ~/.vim/tpl/%:e.tpl

" ---

"set foldmethod=indent
"set foldnestmax=2

" --

set nobackup
set nowritebackup
set noswapfile

" --

set omnifunc=syntaxcomplete#Complete

" ---

set so=5 " afficher x lignes en plus quand on scrolle vers le bas

" ---

"let NERDTreeShowBookmarks=1
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" ---

set t_Co=256
colo molokai
