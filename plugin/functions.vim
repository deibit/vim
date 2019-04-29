" Deletes trailing whitespaces on save
"------------------------------------------------------------------------------
fun! <SID>StripTrailingWhitespaces()
    let l:saved_winview = winsaveview()
    " let l = line(".")
    " let c = col(".")
    keeppatterns %s/\s\+$//e
    call winrestview(l:saved_winview)
    " call cursor(l, c)
endfun
autocmd! FileType * autocmd! BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Return to last edit position when opening files (You want this!)
"------------------------------------------------------------------------------
autocmd! BufReadPost *
            \ if line("'\"-") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Autosaving when leaving insert mode
"------------------------------------------------------------------------------
" autocmd! InsertLeave * if expand('%') != '' | update | endif

" Make preview window close when leaving insert mode
"------------------------------------------------------------------------------
autocmd! CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" HTML Config
"------------------------------------------------------------------------------
autocmd! BufNewFile,BufReadPost *.html set filetype=html
autocmd! FileType html set omnifunc=htmlcomplete#CompleteTags

" cppreference (will open a browser with a search in www.cppreference.com)
"------------------------------------------------------------------------------
fun! CppRef()
    let s:keyword = expand("<cword>")
    let s:url = "http://en.cppreference.com/mwiki/index.php?title=Special:Search&search=std::" . s:keyword
    if s:url != ""
        silent exec "!open '".s:url."'"
    endif
    redraw!
endfun
nnoremap <leader>x :call CppRef()<CR>

" Auto Relative Numbers Toggle
"------------------------------------------------------------------------------
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Ag integration
"-------------------------------------------------------------------------------

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('ag --column --numbers --noheading --fixed-strings --ignore-case --hidden --follow --ignore ".git/*" --color '.shellescape(<q-args>), 1, <bang>0)

if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
else
    set grepprg=grep\ -rn\ $*\ *
endif
set grepformat=%f:%l:%c:%m

nnoremap <leader>r :Find <C-R><C-W><CR>

" Clang-format
"-------------------------------------------------------------------------------
if executable('clang-format')
    function! ClangFormatOnSave()
        let l = line(".")
        let c = col(".")
        silent execute '%! clang-format'
        call cursor(l, c)
    endfunction
    autocmd! BufWritePre *.cpp call ClangFormatOnSave()
endif

" Yaml
"-------------------------------------------------------------------------------
augroup yaml-config
    autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
    autocmd! FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Smarter cursorline
"-------------------------------------------------------------------------------
autocmd! InsertLeave,WinEnter * set cursorline
autocmd! InsertEnter,WinLeave * set nocursorline

"
"-------------------------------------------------------------------------------
" close if final buffer is netrw or the quickfix
augroup finalcountdown
 au!
 autocmd WinEnter * if winnr('$') == 1 && \
 getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || \
 &buftype == 'quickfix' |q|endif
 "autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && \
 "b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
 nmap - :Lexplore<cr>
 "nmap - :NERDTreeToggle<cr>
augroup END
