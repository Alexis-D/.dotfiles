let mapleader = ','

" no need to be compatible with vim
set nocompatible

" enable mouse support
" set mouse=a

" utf-8, all the time
set encoding=utf-8

" enable syntax highlighting
syntax on

" let vim detect the type of the current file
filetype plugin on

" maximum lenght of inserted line (it's broken if wider)
setlocal textwidth=78

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
set relativenumber
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
autocmd FileType go setlocal noexpandtab
autocmd FileType latex setlocal noexpandtab
autocmd FileType tex setlocal noexpandtab
autocmd FileType haskell setlocal tabstop=2
autocmd FileType haskell setlocal shiftwidth=2
autocmd FileType javascript setlocal tabstop=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType ruby setlocal tabstop=2
autocmd FileType ruby setlocal shiftwidth=2
autocmd FileType python map <buffer> <F6> :call Flake8()<CR>

" :h hidden
set hidden

" show matching brackets
set showmatch

" change the title of the term
set title

" show the current line in a different color
autocmd WinEnter * setlocal cursorline
autocmd BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" go to home by default
cd
" set the working directory to the one of the current buffer
set autochdir

" better j, k motion
nnoremap j gj
nnoremap k gk

" c'mon use the 'normal' Y
nnoremap Y y$

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
set nrformats=hex,alpha

" :s/??/!!/g without g, to come back to default add g
set gdefault

" hide previous search results
nnoremap <leader><space> :noh<cr>

" when forget sudo...
cnoremap w!! %!sudo tee > /dev/null %

" list TODOs
nnoremap <leader>t :%g/TODO/<cr>

" make the current file executable
cnoremap chmox !chmod +x %<cr>

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

" remove all charact on the line but not the line!
nnoremap dD 0d$

" switch quickly between current and previous buffer
nnoremap <leader><leader> <C-^>

" provides _j to justify text: a-w-e-s-o-m-e
runtime macros/justify.vim

" TODOs!
ab todo <esc>:r!whoami<cr>I<bs>TODO(<esc>ea):

" open splits right & bottom, rather than left and top
set splitbelow
set splitright

" set the 'right' filetype for .md files
au BufRead,BufNewFile *.md set filetype=markdown

" use current project dir or current dir
let g:ctrlp_working_path_mode = 'ra'

" Let Pathogen magic happen
execute pathogen#infect()
