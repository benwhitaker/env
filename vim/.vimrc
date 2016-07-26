set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'slim-template/vim-slim.git'
Plugin 'sjl/gundo.vim'

" Python Stuff"
" Be sure to easy_install jedi"
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'


"ColorScheme
Plugin 'chriskempson/base16-vim'
"Plugin 'matthewtodd/vim-twilight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"end Vundle Junk
"

""""""""""""""""""""""""""""""
" Settings for generic stuff
"""""""""""""""""""""""""""""
    syntax enable
    filetype on
    set autochdir
    set encoding=utf-8
    " Danger! """"""""
    " set modeline "Don't use on untrusted systems/files
    "  DANGER ! """"""
    set nonumber
    set norelativenumber

"""""""""""
" Editing
""""""""""
    set backspace=indent,eol,start
    " Folding is fun but can be bothersome"
    " set foldenable foldmethod=syntax
    set smartindent
    set smarttab
    set switchbuf=useopen,usetab
    set ts=4 sw=4 et
    set nowrap

"""""""""""""
" Command Stuff
"""""""""""" 
    set showcmd                            "show typed command
    set wildmenu                           "Auto completion
    set wildmode=list:longest:full         "somewhat bash style"
    " List of file extensions with lower priority
    set suffixes=".o,.info,.obj,.pdf,.bak,.log,.svn.out"
    set wildignore="*.pyc,*.o,.svn,.git,*.swp,*.class,obj*/**, *.bak, *.obj"

""""""""""""""
" Tab Completion
""""""""""""""
    let g:SuperTabDefaultCompletionType = "context"
    set completeopt=longest,menuone
    set omnifunc=syntaxcomplete#Complete

"""""""""""""""
" Search Stuff
"""""""""""""""
    set hlsearch
    set incsearch
    set ignorecase
    set incsearch
    "set magic
    set smartcase

""""""""""""""
"  System Stuff
""""""""""""""
    set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
    "viminfo=!,'100,<50,s10,h
    set hidden              " remember undo after quitting
    set history=2000        " keep 2000 lines of command history

"""""""""""""
" Auto Stuff
""""""""""""
    if has("autocmd")

    " FileType Specific Stuff, a bunch of these are the same as above
    au FileType python setl sw=4 ts=4 sts=4 et
    au FileType java setl sts=4 sw=4 et
    au FileType c,cpp setl sw=4 ts=4 sts=4 et


    " Always jump to the last known cursor position. 
    " Don't do it when the position is invalid or when inside
    " an event handler (happens when dropping a file on gvim). 
    autocmd BufReadPost * 
        \ if line("'\"") > 0 && line("'\"") <= line("$") | 
        \   exe "normal g`\"" | 
        \ endif 

endif " has("autocmd")


""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""
    set laststatus=2
    set cmdheight=1
    let g:airline_theme             = 'powerlineish'
    let g:airline_enable_branch     = 1
    let g:airline_enable_syntastic  = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 0
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""""""""""""
" Colors and scheme
"""""""""""""""""""""""""""
    set background=dark
    let base16colorspace=256  " Access colors present in 256 colorspace
    colorscheme base16-3024
    set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:&
    set colorcolumn=80
    set list

"""""""""""""""""""""""""""""""""
" Included scripts
"""""""""""""""""""""""""""""""""
" None for now "
" source ~/.vim/functions.vim
" source ~/.vim/bhammond.vim

