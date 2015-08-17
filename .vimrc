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
    autocmd BufRead,BufNewFile,BufWrite *.tsv setlocal filetype=tsv
    autocmd BufRead,BufNewFile,BufWrite *.pql setlocal filetype=haskell
    autocmd FileType tsv setlocal noexpandtab
    " autocmd BufWritePost *.py call Flake8()
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

" pwd = directory of current file
set autochdir

" disable entering ex mode through Q
nnoremap Q <nop>

" better j, k motion
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

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
    " ~, precedes/extends listchars, and showbreaks
    hi NonText term=bold ctermfg=12 gui=bold guifg=Blue
end

" usable diff colors...
" https://groups.google.com/forum/#!topic/vim_use/oW-yL49rv1o
highlight DiffAdd cterm=NONE ctermfg=bg ctermbg=Green
highlight DiffDelete cterm=NONE ctermfg=bg ctermbg=Red
highlight DiffChange cterm=NONE ctermfg=bg ctermbg=Yellow
highlight DiffText cterm=NONE ctermfg=bg ctermbg=DarkYellow

" highlight shell scripts as bash by default
let g:is_bash = 1

" no need for colorcolumn! display long lines with some red
" http://stackoverflow.com/a/235970/2813687
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
augroup overlength
    autocmd FileType java match OverLength /\%121v./
    autocmd FileType python,sh match OverLength /\%81v./
augroup END

" easy window cycling
nnoremap <S-Tab> <C-w>w

" used to maximise a window when switching to it
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-h> <C-w>h<C-w><bar>
nnoremap <C-l> <C-w>l<C-w><bar>

" snap! resizing w/o need for ^W
nnoremap <S-left> 3<C-w><
nnoremap <S-right> 3<C-w>>
nnoremap <S-up> 3<C-w>+
nnoremap <S-down> 3<C-w>-

" works in macvim at least
nnoremap <C-tab> :tabnext<cr>
nnoremap <C-S-tab> :tabprevious<cr>
inoremap <C-tab> <esc>:tabnext<cr>
inoremap <C-S-tab> <esc>:tabprevious<cr>

" no need for scrollbars
set guioptions-=rL

" also increment/decrement character with <C-a>, <C-x>
set nrformats=hex,alpha

" :s/??/!!/g without g, to come back to default add g
set gdefault

" red
hi User1 ctermfg=0 ctermbg=1

set statusline=
" filename
set statusline+=%F\ 
" git status
set statusline+=%{fugitive#statusline()}
" filetype
set statusline+=%y
" modified flag
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
set pastetoggle=<F5>
" must have : google for gundo.vim!
nnoremap <F3> :GundoToggle<cr>

" http://unix.stackexchange.com/a/156713/62710
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
noremap <F6> :call ToggleMouse()<cr>

" show tabs and trailing spaces
set list
" characters to use
set listchars=tab:→\ ,trail:·,extends:»,precedes:«

" hint that a line is to long
" set showbreak=»\ 

" show showbreak in number column
" set cpoptions+=n

" hide previous search results
nnoremap <silent> <leader><space> :noh<cr>

" show marks
nnoremap <silent> <leader>m :marks<cr>

" show buffers
nnoremap <silent> <leader>b :ls<cr>

" autocomplete list for command mode
set wildmenu
set wildcharm=<C-i>
set wildignore+=*.class,*.jar,*/.git/*,*/.hg/*,*.DS_Store,*/build/*,*/ecbuild/*

" access MRU files
nnoremap <C-s> :CtrlPMRUFiles<cr>

" provides _j to justify text: a-w-e-s-o-m-e
runtime macros/justify.vim

" smart %
runtime macros/matchit.vim

" man page inside vim
runtime ftplugin/man.vim

" TODOs!
ia todo TODO(<cr><esc>cc<cr><esc>cc):<esc>k!!whoami<cr>JVkJxh%la

" FIXMEs!
ia fixme FIXME(<cr><esc>cc<cr><esc>cc):<esc>k!!whoami<cr>JVkJxh%la

" open splits right & bottom, rather than left and top
set splitbelow
set splitright

" make J smart about joining comments
if version >= 704 " introduced in 7.3.541
    set formatoptions+=j
endif

" better comments format
set formatoptions+=c

" set the 'right' filetype for .md files
augroup markdowngroup
    autocmd!
    autocmd BufRead,BufNewFile,BufWrite *.md setlocal filetype=markdown
    autocmd FileType markdown setlocal spelllang=en_us
    autocmd FileType markdown setlocal complete+=kspell
    autocmd FileType markdown setlocal formatoptions+=n1
augroup END

" use current project dir or current dir
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_max = 1000
let g:ctrlp_root_markers=['.root']
let g:ctrlp_mruf_exclude = '.*\.fugitiveblame$'

if executable('ag')
    let g:ctrlp_user_command = 'ag --nogroup --nocolor -g "" %s'
    set grepprg=ag\ --nogroup\ --nocolor
endif

" temporarily disable stuff that clutter copy/pasted stuff
command! Clean set nonu! nornu! nolist!
nnoremap <backspace> :Clean<cr>

" grep from the root of a project
cnoreabbrev <expr> G ((getcmdtype() is# ':' && getcmdline() is# 'G')?('ProjectRootExe grep'):('G'))

" display all weird chars as a single char wide char
command! CleanUpBytes :%s/\v([^[:print:]]|[^\x00-\x7f])/×/

" readline-like motions for command mode
cnoremap <C-a> <home>
cnoremap <C-f> <right>
cnoremap <C-b> <left>
cnoremap <C-h> <bs>

" switch with the last tab (similar <C-^> for buffers)
" http://stackoverflow.com/a/2120168/2813687
let g:lasttab = 1
nnoremap <leader><leader> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" 'disable' netrw history
let g:netrw_home = '/dev/null'

" set program used by K in normal mode
augroup Kgroup
    autocmd!
    autocmd FileType vim setlocal keywordprg=:help
augroup END

augroup mangroup
    autocmd!
    autocmd FileType man setlocal nolist
augroup END

augroup palantirgroup
    autocmd!
    autocmd BufRead,BufNewFile,BufWrite *.po setlocal filetype=po
    autocmd FileType po setlocal noexpandtab
augroup END

augroup gradlegroup
    autocmd!
    autocmd BufRead,BufNewFile,BufWrite *.gradle setlocal filetype=groovy
augroup END

augroup fugitivegroup
    autocmd!
    " automatically get rid of fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

if version >= 703
    " when encrypting any file, use the much stronger blowfish algorithm
    set cryptmethod=blowfish
endif

" Let Pathogen magic happen
execute pathogen#infect()
