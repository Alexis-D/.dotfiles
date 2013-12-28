let mapleader = ','

" no need to be compatible with vim
set nocompatible

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
if version >= 704
    set relativenumber
endif
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

augroup indentgroup
    autocmd!
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
    autocmd BufWritePost *.py call Flake8()
augroup END

" :h hidden
set hidden

" show matching brackets
set showmatch

" change the title of the term
set title

" show the current line in a different color
augroup cursorlinegroup
    autocmd!
    autocmd WinEnter * setlocal cursorline
    autocmd BufEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" go to home by default
cd
" use vim-rooter for 'smart' cwd
let g:rooter_patterns = ['.git/', '.hg/']
let g:rooter_change_directory_for_non_project_files = 1
augroup rootergroup
    autocmd!
    autocmd BufEnter * :Rooter
augroup END

" disable entering ex mode through Q
nnoremap Q <nop>

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

" red
hi User1 ctermfg=0 ctermbg=1

set statusline=
" filename
set statusline+=%F\ 
" filetype
set statusline+=%y
" filename
set statusline+=%1*%m%*
" readonly
set statusline+=%1*%r%*
" align right
set statusline+=%=
" position
set statusline+=%2v×%-3l\ 
" number of lines
set statusline+=(%L\ loc)\ 
" position in file in percentage
set statusline+=%P

" always show
set laststatus=2

function! StatusLineDefaultHighlight()
    hi StatusLine ctermfg=0 ctermbg=10 gui=bold
endfunction

augroup statuslinegroup
    autocmd!
    autocmd BufEnter * call StatusLineDefaultHighlight()
    autocmd InsertEnter * hi StatusLine ctermbg=13 gui=bold
    autocmd InsertLeave * call StatusLineDefaultHighlight()
augroup END

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

" hide previous search results
nnoremap <silent> <leader><space> :noh<cr>

" show marks
nnoremap <silent> <leader>m :marks<cr>

" show buffers
nnoremap <silent> <leader>b :ls<cr>

" autocomplete list for command mode
set wildmenu
set wildcharm=<C-i>

" easy buffer switching
nnoremap <silent> <leader><leader> :CtrlPBuffer<cr>

" easy file opening
nnoremap <silent> <leader>e :CtrlP<cr>

" open a file relative to current file directory
cnoremap <expr> E getcmdtype() ==# ':' && getcmdpos() ==# 1 ? 'e %:p:h<C-i>' : 'E'
cnoremap <expr> Vs getcmdtype() ==# ':' && getcmdpos() ==# 1 ? 'vs %:p:h<C-i>' : 'Vs'
cnoremap <expr> Sp getcmdtype() ==# ':' && getcmdpos() ==# 1 ? 'sp %:p:h<C-i>' : 'Sp'

" provides _j to justify text: a-w-e-s-o-m-e
runtime macros/justify.vim

" smart %
runtime macros/matchit.vim

" TODOs!
ia todo TODO(<cr><cr>):<esc>k!!whoami<cr>JVkJxh%la

" open splits right & bottom, rather than left and top
set splitbelow
set splitright

" set the 'right' filetype for .md files
augroup markdowngroup
    autocmd!
    autocmd BufRead,BufNewFile,BufWrite *.md setlocal filetype=markdown
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal spelllang=en_us
    autocmd FileType markdown setlocal complete+=kspell
augroup END

" use current project dir or current dir
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

" use <C-space> for completion
let g:jedi#popup_on_dot = 0
" use buffers rather than tabs:wq
let g:jedi#use_tabs_not_buffers = 0

" readline-like motions for command mode
cnoremap <C-a> <home>
cnoremap <C-f> <right>
cnoremap <C-b> <left>
cnoremap <C-h> <bs>

augroup closepreviewgroup
    autocmd!
    " close omnicomplete preview window
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

" set program used by K in normal mode
augroup Kgroup
    autocmd!
    autocmd FileType python setlocal keywordprg=pydoc
    autocmd FileType vim setlocal keywordprg=:help
augroup END

if version >= 703
    " when encrypting any file, use the much stronger blowfish algorithm
    set cryptmethod=blowfish
endif

" Let Pathogen magic happen
execute pathogen#infect()
