let mapleader = ','

" no need to be compatible with vim
set nocompatible

" enable mouse support
set mouse=a

" enable syntax highlighting
syntax on

" let vim detect the type of the current file
filetype plugin on

" maximum lenght of inserted line (it's broken if wider)
autocmd FileType text setlocal textwidth=78

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" length of history
set history=5000

" search options
" search while typing
set incsearch
" highlight search results
set hlsearch
" ignore case in search
set ignorecase
" ignore case only if all the word is in lowercase
set smartcase

" obvious?
set background=dark

" show line numbers
set number

" show the command while typing
set showcmd

" tabs options
" length of a tab in space
set tabstop=4
" number of space for each step of autoindent
set shiftwidth=4
" convert tabs to spaces
set expandtab
" see help
set smarttab
" indent = multiple of shiftwidth
set shiftround

" filetype specific settings
filetype plugin indent on
autocmd FileType make setlocal noexpandtab
autocmd FileType haskell setlocal tabstop=2
autocmd FileType haskell setlocal shiftwidth=2
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2

" :h hidden
set hidden

" show matching brackets
set showmatch

" change the title of the term
set title

" show the current line in a different color
set cursorline

" pwd
" go to home by default
cd
" set the working directory to the one of the current buffer
set autochdir

" better j, k motion
nnoremap j gj
nnoremap k gk

" try to load some template files if availables
autocmd BufNewFile * silent! 0r ~/.vim/tpl/%:e.tpl

" no backup when overwritting a file
set nobackup
set nowritebackup
set noswapfile

" the current line is always at (at least) 5 from the top/bottom of the window
set scrolloff=5

" tty
if &term == 'linux'
    colo default
else
    " number of color of the term
    set t_Co=256
    " colorscheme
    colo xoria256
end

" used to maximise a window when switching to it
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-h> <C-w>h<C-w><bar>
nnoremap <C-l> <C-w>l<C-w><bar>

" also increment/decrement character with <C-a>, <C-x>
set nrformats=octal,hex,alpha

" :s/??/!!/g without g, to come back to default add g
set gdefault

" hide previous search results
nnoremap <leader><space> :noh<cr>

" when forget sudo...
cnoremap w!! %!sudo tee > /dev/null %

" make the current file executable
cnoremap chmox !chmod +x %

" show number of loc, and position in the file
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ %l,%v\ \ %P

" some <F-somethings> mappings
" tell vim we paste something, and it shouldn't try to indent it
set pastetoggle=<F2>
" must have : google for gundo.vim!
nnoremap <F3> :GundoToggle<cr>
" open the current folder
nnoremap <F4> :NERDTreeToggle<cr>
" run the current file
nnoremap <F5> :!./%<cr>

" show tabs and trailing spaces
set list
" characters to use
set listchars=tab:→\ ,trail:·

