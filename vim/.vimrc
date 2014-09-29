set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'slim-template/vim-slim.git'
Plugin 'nvie/vim-flake8'
Plugin 'sjl/gundo.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'spolu/dwm.vim'

"ColorScheme
Plugin 'chriskempson/base16-vim'
"Plugin 'matthewtodd/vim-twilight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"end Vundle Junk
"

syntax enable
filetype on

" Settings for generic stuff
set autochdir
set encoding=utf-8
set list
set modeline "Don't use on untrusted systems/files
set nonumber
set norelativenumber

"""""""""""
" Editing
""""""""""
    set backspace=indent,eol,start
    set foldenable foldmethod=syntax
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



"Tabs and Trees mappings
map tt <plug>NERDTreeTabsToggle<CR>
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tu :GundoToggle<CR>

""""""""""""""""""""""""""""""
" airline
" """"""""""""""""""""""""""""""
    set laststatus=2
    set cmdheight=1
    let g:airline_theme             = 'powerlineish'
    let g:airline_enable_branch     = 1
    let g:airline_enable_syntastic  = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 0
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""""""""""""""""""
" DWM
""""""""""""""""""""""""""""""""
    "Make current window master and resuffle others
    nnoremap <C-m> :call DWM_Focus() <CR>
    " Use mouse for awesome stuff
    set mouse=a
    set ttymouse=xterm2

"""""""""""""""""""""""""""
" Colors and scheme
"""""""""""""""""""""""""""

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
"set t_Co=256
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-3024
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme twilight256

"Formatting Stuff
set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:&
set colorcolumn=80

"nnoremap <F2> :set nonumber!<CR>
nnoremap <F2> :call NumberToggle()<CR>
"au FocusLost * :set number
"au FocusGained * :set relativenumber
"autocmd InsertEnter * :set norelativenumber
"autocmd InsertLeave * :set relativenumber
"
function! NumberToggle()
    if &l:number == 1 || &l:relativenumber == 1
        set nonumber
        set norelativenumber
        autocmd InsertEnter * :set nonumber
        autocmd InsertLeave * :set norelativenumber
    else
        set relativenumber
        "au FocusLost * :set number
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertEnter * :set number
        autocmd InsertLeave * :set relativenumber
        autocmd InsertLeave * :set nonumber
    endif
endfunction

