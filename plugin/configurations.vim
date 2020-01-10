" Auto-pairs
let g:AutoPairsShortcutFastWrap = '<C-e>'

" Gutentags
let g:gutentags_project_root = ['tags', '.git']
let g:gutentags_ctags_exclude = ['node_modules']
let g:gutentags_cscope_exclude = ['node_modules']
let g:gutentags_gtags_exclude = ['node_modules']

let mapleader = ","
let g:mapleader = ","

" Bdelete a buffer without closing Vim or window layout
nnoremap <leader>q :Bdelete<cr>

" vim-mode
"
let g:move_key_modifier = 'C'

"
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
" Show hidden files
" let NERDTreeShowHidden=1
" Do not open other files in a Nerdtree buffer
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif
"NerdTreeToggle
nnoremap <leader>n :NERDTreeToggle<CR>


" Devdocs
"-------------------------------------------------------------------------------
augroup plugin-devdocs
    autocmd!
    autocmd FileType c,cpp,python,js,go nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END


" Asyncrun
"------------------------------------------------------------------------------
let g:asyncrun_open = 6
"MAKE"
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
"CMAKE"
nnoremap <silent> <F8> :AsyncRun -cwd=<root> cmake . <cr>
"Single file compilation"
nnoremap <silent> <F9> :AsyncRun clang++ -std=c++1z -stdlib=libc++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>


" FZF
"------------------------------------------------------------------------------
nnoremap <silent><leader><leader> :Buffers<cr>
nnoremap <silent><leader>A :Ag! <c-r><c-w><cr>
nnoremap <silent><leader>B :BTags<cr>
nnoremap <silent><leader>F :GFiles<cr>
nnoremap <silent><leader>L :Lines<cr>
" Find is defined on functions.vim
nnoremap <leader>r :Find <C-R><C-W><CR>
" nnoremap <silent><leader>S :Snippets<cr>
nnoremap <silent><leader>a :Ag <c-r><c-w><cr>
nnoremap <silent><leader>c :Commands<cr>
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>h :Helptags<cr>
nnoremap <silent><leader>hh :History<cr>
nnoremap <silent><leader>l :BLines<cr>
nnoremap <silent><leader>m :Maps<cr>
nnoremap <silent><leader>ma :Marks<cr>
nnoremap <silent><leader>t :Tags<cr>
nnoremap <silent><leader>q :Quickfix<cr>

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

" fzf_quickfix
let g:fzf_quickfix_syntax_on = 0

" Vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_info_mode = 'guru'
let g:go_list_type = "locationlist"

augroup Golang_mappings
    autocmd!
    autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
    autocmd FileType go nmap <Leader>gdd <Plug>(go-doc-browser)
    autocmd FileType go nmap <Leader>ge <Plug>(go-rename)
    autocmd FileType go nmap <Leader>gi <Plug>(go-info)
    autocmd FileType go nmap <Leader>gm <Plug>(go-implements)
    autocmd FileType go nmap <Leader>gr <Plug>(go-rename)
    autocmd FileType go nmap <Leader>gs <Plug>(go-def-split)
    autocmd FileType go nmap <Leader>gv <Plug>(go-def-vertical)
    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    autocmd FileType go nmap <leader>gc <Plug>(go-coverage)
    autocmd FileType go nmap <leader>gr <Plug>(go-run)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
augroup END

"
" A (switch header/implementation)
"-------------------------------------------------------------------------------
nnoremap <silent><leader>H :A<CR>
nnoremap <silent><leader>HS :AS<CR>
nnoremap <silent><leader>HV :AV<CR>


" Vim-mundo
"-------------------------------------------------------------------------------
nnoremap <silent><leader>u :MundoToggle<cr>


" Python syntax
"-------------------------------------------------------------------------------
let g:python_highlight_all=1
let g:python_highlight_space_errors=0


" Markdown
"-------------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" Tagbar
"-------------------------------------------------------------------------------
nnoremap <leader>T :TagbarToggle<cr>

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" Illuminati
"-------------------------------------------------------------------------------
let g:Illuminate_ftblacklist = ['nerdtree']
let g:Illuminate_highlightUnderCursor = 0


" Vim-cool
"-------------------------------------------------------------------------------
let g:CoolTotalMatches = 1

" ALE
"-------------------------------------------------------------------------------

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

nnoremap <silent>gd :ALEGoToDefinition<cr>
nnoremap <silent>gD :ALEGoToDefinitionInVSplit<cr>
nnoremap <silent>gt :ALEGoToTypeDefinition<cr>
nnoremap <silent>gT :ALEGoToTypeDefinitionInVSplit<cr>
nnoremap <silent>gr :ALEFindReferences<cr>
nnoremap <silent>gn :ALENext<cr>
nnoremap <silent>gp :ALEPrevious<cr>

let g:ale_sign_error = '💩'
let g:ale_sign_warning = '😢'

let g:ale_close_preview_on_insert = 1
let g:ale_set_balloons = 1

" temp
let g:ale_virtualenv_dir_names = []

" Only run explicit linters
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Fixers
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'python': ['autopep8', 'black'],
\}
let g:ale_fix_on_save = 1

" Aliases for Vue
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

" Linters
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'css': ['eslint'],
\   'html': ['eslint'],
\   'python': ['pylint', 'pyls'],
\   'vue': ['eslint', 'vls'],
\   'cpp': ['ccls'],
\   'c': ['ccls']
\}
let g:ale_lint_on_save = 1

let g:ale_pattern_options_enabled = 1
" Do not lint or fix minified files
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
