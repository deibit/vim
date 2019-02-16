" Statusline configuration
" (https://medium.com/@kadek/the-last-statusline-for-vim-a613048959b2)
"------------------------------------------------------------------------------
" [MODE]
let g:currentmode={
            \ 'n'  : 'Normal ',
            \ 'no' : 'N·Operator Pending ',
            \ 'v'  : 'Visual ',
            \ 'V'  : 'V·Line ',
            \ '^V' : 'V·Block ',
            \ 's'  : 'Select ',
            \ 'S'  : 'S·Line ',
            \ '^S' : 'S·Block ',
            \ 'i'  : 'Insert ',
            \ 'R'  : 'Replace ',
            \ 'Rv' : 'V·Replace ',
            \ 'c'  : 'Command ',
            \ 'cv' : 'Vim Ex ',
            \ 'ce' : 'Ex ',
            \ 'r'  : 'Prompt ',
            \ 'rm' : 'More ',
            \ 'r?': 'Confirm ',
            \ '!'  : 'Shell ',
            \ 't'  : 'Terminal '
            \}
"
" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" [PASTE]
function! PasteForStatusline()
    let paste_status = &paste
    if paste_status == 1
        return " [paste] "
    else
        return ""
    endif
endfunction

set statusline=
set statusline+=\ %*
" Mode
set statusline+=%2*-\ %{ModeCurrent()}-
set statusline+=%*
" Buffer number
" set statusline+=\ Buf:\ %n
" Encoding
"set statusline+=\ %{(&fenc!=''?&fenc:&enc)}
" Current time, when buffer saved
" set statusline+=\ %{strftime('%R', getftime(expand('%')))}
set statusline+=\ %y
" Help file
"set statusline+=\ %h
set statusline+=\ %q
set statusline+=\ %w
" Filename
set statusline+=\ %f
set statusline+=\ %m
" Readonly
set statusline+=\ %r

set statusline+=%{PasteForStatusline()}
" Right justified
set statusline+=%=
"set statusline+=%1*\ %f
"set statusline+=\ >>
set statusline+=%1*\ %{tagbar#currenttag('%s','','f')}
" Line, lines, percentage
set statusline+=%*\ %l
set statusline+=\/%L\ \|\ %c\ \|
set statusline+=\ %p%%
set statusline+=\ %{FugitiveStatusline()}%*

" Orange
hi User1 guifg=#FF8000 guibg=#504945
" Green
hi User2 guifg=#DEE511 guibg=#504945
" Pink
hi User3 guifg=#EA7E93 guibg=#504945
