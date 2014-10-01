"""
" Dynamic Number Toggling
"""


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


