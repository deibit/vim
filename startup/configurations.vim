" NERDtree
"-------------------------------------------------------------------------------

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Close Vim if nerdtree is the only one page remainded
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open nerdtree when Vim starts
" autocmd vimenter * NERDTree
" Show hidden files
let NERDTreeShowHidden=1
" Do not open other files in a Nerdtree buffer
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

" Devdocs
"-------------------------------------------------------------------------------
augroup plugin-devdocs
    autocmd!
    autocmd FileType c,cpp,python,js,go nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END


" YouCompleteMe
"-------------------------------------------------------------------------------
if has('mac')
    let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
else
    " Here just for virtual enviroment of thethe
    if hostname() == 'thethe'
        let g:ycm_server_python_interpreter = '/home/david/thethe/thethe_env/bin/python3'
    else
        let g:ycm_server_python_interpreter = '/usr/bin/python3'
    endif
endif


let g:ycm_confirm_extra_conf = 1
augroup YouCompleteMe
    autocmd!
    autocmd FileType c,cpp nnoremap gd :YcmCompleter GoToDeclaration<cr>
    autocmd FileType c,cpp nnoremap gD :YcmCompleter GoToDefinition<cr>
    autocmd FileType c,cpp nnoremap gt :YcmCompleter GetType<cr>
    autocmd FileType c,cpp nnoremap gp :YcmCompleter GetParent<cr>
augroup END

" let g:UltiSnipsExpandTrigger       = "<c-j>"
" let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
" let g:UltiSnipsListSnippets        = "<c-k>"

" Gutentags
"------------------------------------------------------------------------------


" Asyncrun
"------------------------------------------------------------------------------
let g:asyncrun_open = 6
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
nnoremap <silent> <F8> :AsyncRun -cwd=<root> cmake . <cr>
nnoremap <silent> <F9> :AsyncRun clang++ -std=c++1z -stdlib=libc++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>

" vim-bookmarks
"-------------------------------------------------------------------------------
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" FZF
"------------------------------------------------------------------------------
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>a :Ag <c-r><c-w><cr>
nnoremap <silent><leader>A :Ag! <c-r><c-w><cr>
nnoremap <silent><leader>F :Files<cr>
nnoremap <silent><leader>f :GFiles<cr>
nnoremap <silent><leader>L :Lines<cr>
nnoremap <silent><leader>l :BLines<cr>
nnoremap <silent><leader>t :Tags<cr>
nnoremap <silent><leader>B :BTags<cr>
nnoremap <silent><leader>ma :Marks<cr>
nnoremap <silent><leader>m :Maps<cr>
nnoremap <silent><leader>C :Commands<cr>
nnoremap <silent><leader>hh :History<cr>
nnoremap <silent><leader>h :Helptags<cr>
nnoremap <silent><leader>S :Snippets<cr>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Similarly, we can apply it to fzf#vim#grep:
command! -bang -nargs=* Ag
            \ call fzf#vim#grep(
            \   'ag --column --line-number --no-heading --color '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)


" Vim-go
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_info_mode = 'guru'
let g:go_list_type = "locationlist"

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gdd <Plug>(go-doc-browser)
au FileType go nmap <Leader>ge <Plug>(go-rename)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gm <Plug>(go-implements)
au FileType go nmap <Leader>gr <Plug>(go-rename)
au FileType go nmap <Leader>gs <Plug>(go-def-split)
au FileType go nmap <Leader>gv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gt <Plug>(go-test)

"
" A (switch header/implementation)
nnoremap <silent><leader>H :A<CR>
nnoremap <silent><leader>HS :AS<CR>
nnoremap <silent><leader>HV :AV<CR>

" Ale
nnoremap <silent><leader>e :ALEToggle<cr>
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
map <silent><c-p> <Plug>(ale_previous_wrap)
map <silent><c-n> <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 1
let g:ale_lint_on_enter = 0
let g:ale_enabled = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_cpp_cpplint_options = "--filter=legal"
let g:ale_sign_column_always = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_fix_on_save = 1
hi ALEErrorSign    ctermfg=167 guifg=#fb4934 ctermbg=237
hi ALEWarningSign  ctermfg=214 guifg=#fabd2f ctermbg=237
let g:ale_linters = {
            \   'cpp': ['clang', 'cppcheck', 'cpplint', 'clangcheck', 'clangtidy'],
            \}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Python syntax
let python_highlight_all=1
let python_highlight_space_errors=0

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Tagbar
nnoremap <leader>T :TagbarToggle<cr>
