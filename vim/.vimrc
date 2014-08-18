" Identify platform ------------------------------------------------------- {{{
    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
        return  (has('win16') || has('win32') || has('win64'))
    endfunction
" }}}

set nocompatible
filetype off

" load ~/.vim files
set runtimepath=~/.vim,$VIMRUNTIME

" load bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" load matchit (OS X)
source $VIMRUNTIME/macros/matchit.vim


" Enable filetype plugin
filetype on
filetype plugin indent on

" Basic options ----------------------------------------------------------- {{{
set encoding=utf-8
set modelines=0
set backspace=indent,eol,start	" make backspace behave like normal
set history=1000
set scrolloff=3		" start scrolling 3 lines from top/bottom
set autoread		" auto read file when changed from the outside
set relativenumber	" line numbers show how far away from current line
set nu
set splitright
set splitbelow
set cursorline
set ttyfast
set fileformats=unix,dos,mac
set noerrorbells
set novisualbell
set t_vb=

" Save when losing focus
au FocusLost * :wa

" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" }}}

" wildmenu ---------------------------------------------------------------- {{{
set wildmenu
set wildmode=list:full
" }}}

" UI / Color scheme ------------------------------------------------------- {{{
syntax on

set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" }}}

" Tabs, wrapping ---------------------------------------------------------- {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent smartindent
set expandtab

set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1		" show wrap column
" }}}

" Folding ----------------------------------------------------------------- {{{
set foldmethod=indent
set foldlevel=99
set foldenable
" }}}

" Backups ----------------------------------------------------------------- {{{
set backup
set noswapfile
set undofile
set undodir=$HOME/.vim/undo
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
" }}}

" Statusline -------------------------------------------------------------- {{{
if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
" }}}

" Leader ------------------------------------------------------------------ {{{
let mapleader = ","
" }}}

" Search ------------------------------------------------------------------ {{{
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set gdefault		" replace multiple items per line by default
nnoremap <leader><space> :noh<cr>
" }}}

" Movement ---------------------------------------------------------------- {{{
map <tab> %
" }}}

" Key bindings ------------------------------------------------------------ {{{
" NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>

" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>
" }}}

" Plugins {
    " NERDTree {
        let g:nerdtree_tabs_open_on_gui_startup = 0
    " }
" }

" GUI settings ------------------------------------------------------------ {{{
if has('gui_running')
    set lines=55 columns=90
    set guioptions-=T           " disable the toolbar

    if LINUX()
        set guifont=Source\ Code\ Pro\ Regular\ 10,Ubuntu\ Mono\ 12,Monospace\ 12
    elseif OSX()
        set guifont=Source\ Code\ Pro\ Regular:h10,Ubuntu\ Mono:h12,Monaco:h12
    elseif WINDOWS()
        set guifont=Source_Code_Pro:h10,Ubuntu_Mono:h12,Consolas:h12
    endif
endif
" }}}

" Local config files ------------------------------------------------------ {{{
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

if has('guirunning')
    if filereadable(expand("~/.gvimrc.local"))
        source ~/.gvimrc.local
    endif
endif
" }}}
