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
set autoindent smartindent
set foldenable foldmethod=syntax
set encoding=utf-8
set hlsearch
set incsearch
set list
set modeline
set nonumber
set norelativenumber
set switchbuf=useopen,usetab
set ts=4 sw=4 et
set nowrap


"""""""""""""
" Command Auto Compelte Junk
"""""""""""" 
    set wildmenu
    set wildmode=list:longest:full
    " List of file extensions with lower priority
    set suffixes=".o,.info,.obj,.pdf,.bak,.log,.svn.out"
    set wildignore="*.o,.svn,.git,*.swp,*.class,obj*/**, *.bak, *.obj"

""""""""""""""
" Tab Completion
""""""""""""""
    let g:SuperTabDefaultCompletionType = "context"
    set completeopt=longest,menuone
    set omnifunc=syntaxcomplete#Complete

"""""""""""""""
" Search Stuff
"""""""""""""""
    set ignorecase
    set incsearch
    set magic
    set smartcase

" FileType Specific Stuff, a bunch of these are the same as above
au FileType python setl sw=4 ts=4 sts=4 et
au FileType java setl sts=4 sw=4 et
au FileType c,cpp setl sw=4 ts=4 sts=4 et


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

