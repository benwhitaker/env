set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
"Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
"Plugin 'matthewtodd/vim-twilight'
Plugin 'chriskempson/base16-vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'nvie/vim-flake8'
Plugin 'sjl/gundo.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"end Vundle Junk

syntax enable
set nonumber
set norelativenumber
set list
filetype on
set autoindent
set smartindent
set nowrap
set modeline
set ts=4 sw=4 et
set encoding=utf-8



"Cool Mappings
map tt <plug>NERDTreeTabsToggle<CR>
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tu :GundoToggle<CR>

" Always show statusline
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
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
        eventignore InsertEnter *
        eventignore InsertLeave *
    else
        set relativenumber
        "au FocusLost * :set number
        autocmd InsertEnter * :set number
        autocmd InsertLeave * :set relativenumber
    endif
endfunction

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
"Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
"Plugin 'matthewtodd/vim-twilight'
Plugin 'chriskempson/base16-vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'nvie/vim-flake8'
Plugin 'sjl/gundo.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"end Vundle Junk
"
"execute pathogen#infect()
"plugins
"runtime plugin/c.vim
"runtime plugin/supertab.vim
"runtime plugin/a.vim
"runtime plugin/taglist.vim

syntax enable
set nonumber
set norelativenumber
set list
filetype on
set autoindent
set smartindent
set nowrap
set modeline
set ts=4 sw=4 et
set encoding=utf-8

"Cool Mappings
map tt <plug>NERDTreeTabsToggle<CR>
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tu :GundoToggle<CR>

" Always show statusline
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
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

