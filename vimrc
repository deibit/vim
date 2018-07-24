" PLUGINS----------------------------------------------------------------------
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/bundle')
endif

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'zchee/deoplete-clang'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-jedi'
" Plug 'lifepillar/vim-mucomplete'
" Plug 'davidhalter/jedi-vim'
Plug 'Rip-Rip/clang_complete'
set completeopt-=preview
set completeopt+=menuone,noselect
let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_user_options = '-std=c++1z'
let g:clang_complete_auto = 1
" let g:mucomplete#enable_auto_at_startup = 1
" imap <expr> <down> pumvisible() ? "\<plug>(MUcompleteExtendFwd)" : "\<down>"


Plug 'majutsushi/tagbar'
Plug 'deibit/a.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Temporaly deactivated (or not) plugins
Plug 'fatih/vim-go'
" Plug 'haya14busa/incsearch.vim'

" Plugins related to save moves
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'tommcdo/vim-lion'                                 " Align text
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'                           " Parents operations

" Plugins related to improved the interface
" Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'deibit/scratch.vim'
Plug 'airblade/vim-gitgutter'

" Syntax related plugins
Plug 'elzr/vim-json'
Plug 'hdima/python-syntax'
Plug 'jansenm/vim-cmake'
"Plug 'leafgarland/typescript-vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'

" Misc. Plugins
Plug 'xolox/vim-misc'

" Themes
Plug 'morhetz/gruvbox'
" Plug 'sickill/vim-monokai'
" Plug 'joshdick/onedark.vim'

call plug#end()

" SETTINGS--------------------------------------------------------------------

filetype on
filetype indent on
filetype plugin on
syntax enable

" Behaviour
set autoread
set noautochdir
set hidden
set tags=./tags;,tags;
" Mouse
set clipboard+=unnamed
set clipboard+=unnamedplus
set mouse=a
" Search
set nohlsearch
set ignorecase
set incsearch
set indentkeys-=0#
set magic
set matchpairs+=<:>
set matchtime=1
" Backup
set noswapfile
set backupdir=/tmp
set copyindent
set history=1000
set nobackup
set nowritebackup
set undolevels=1000
" Verbosity
set noshowmode
set noerrorbells
set novisualbell
set laststatus=2
set shortmess+=I
set showmatch
set showcmd
set cmdheight=1
set colorcolumn=80
set cursorline
" Indent, case, tabs
set backspace=indent,eol,start
set autoindent
set expandtab
set shiftwidth=4
set smartcase
set smartindent
set smarttab
set tabstop=4
set softtabstop=4
" Windows
set number
" set cot-=preview
set lazyredraw
set splitbelow
set splitright
" Terminal
set encoding=utf-8
set t_Co=256
set termencoding=utf-8
set timeoutlen=1000
set title
set titleold=0
set ttimeoutlen=0
set ttyfast
if (has("termguicolors"))
    set termguicolors
endif

" Wildmenu options
set wildmenu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.vscode/*
set wildignore+=*/tmp/,*.swp,*.zip
set wildignore=*.a,*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.orig " Merge resolution file
set wildignore+=*.pdf,*.zip,*.so " binaries
set wildignore+=*.pyc,*.pyo " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.swp,*.bak " ignore these
set wildignore+=*.sw? " Vim swap files
set wildignore+=**/vendor " Ignore vendor directory
set wildignorecase
set wildmode=longest,list,full

" Fold
set foldmethod=marker

" Colorscheme
set background=dark
colorscheme gruvbox

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undofile
set undodir=/tmp/.vim-undo-dir

" MAPPINGS---------------------------------------------------------------------

" Goto the last edited file with backspace
nnoremap <BS> <C-^>

" Leader
let mapleader = ","
let g:mapleader = ","

" Non-english keyboard tag navigation fix
nnoremap <silent><leader>g <c-]>

" Fast escape
inoremap jj <ESC>

" Nop some keys
nnoremap Q <nop>
nnoremap gQ <nop>

" Turn off Highlight (although, is not needed if nohl is set)
nmap <silent><leader><cr> :noh<cr>

" Some convenient shortcuts
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 o<esc>0i" <esc>79i-<esc>j

" Get rid of ^M
noremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Fast saving
nnoremap <leader>w :w<cr>

" Buffer unload
nnoremap <silent><leader>uu :bd<cr>

" Copy-paste Windows fashioned
imap <c-v> <esc>"*P}i
vmap <c-c> "*y<esc>

" Moving through wrapped lines
nnoremap j gj
nnoremap k gk

" Use tab and s-tab for indenting blocks in Visual Mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" vimrc editing and sourcing
noremap <leader>v :e! $MYVIMRC<CR>
noremap <silent><leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

" Toggle paste
nnoremap <silent><f12> :set invpaste<CR>

" Update plugins
nnoremap <silent><f11> :PlugUpdate<cr>

" Window manipulation
nnoremap <leader>" :vsplit<CR>
nnoremap <leader>% :split<CR>
nnoremap <c-left> <c-w>h
nnoremap <c-down> <c-w>j
nnoremap <c-up> <c-w>k
nnoremap <c-right> <c-w>l

" Replace this and next with .
" Press 2n to skip and n to move to the next one
nnoremap <leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" Fast search!
nnoremap <space> /
nnoremap <leader><space> ?

" Remapped U for redo ctrl-r
nnoremap U <c-r>

" ); shortcut for C family languages
au FileType c,cpp,js inoremap ;; <esc>A;<cr>

" DiffOrig
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis
nnoremap <leader>O :DiffOrig<cr>

" Cheats file
nnoremap <leader>ch :vs ~/.vim/cheats.md<CR>

" PLUGINS-CONFIG---------------------------------------------------------------

" Deoplete
"-------------------------------------------------------------------------------
"
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" YouCompleteMe
"-------------------------------------------------------------------------------
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_python_binary_path = '/usr/local/bin/python2'
"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
"let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
"let g:ycm_complete_in_comments = 1 " Completion in comments
"let g:ycm_complete_in_strings = 1 " Completion in string
"nnoremap <leader>yt :YcmCompleter GetType<cr>
"nnoremap <leader>yp :YcmCompleter GetParent<cr>
"nnoremap <leader>yd :YcmCompleter GoToDeclaration<cr>
"nnoremap <leader>yi :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>yy :YcmCompleter GoTo<cr>
"nnoremap <leader>yh :YcmCompleter GoToInclude<cr>
"nnoremap <leader>yD :YcmCompleter GoToDoc<cr>
"nnoremap <leader>yf :FixIt<cr>

let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" Completion-manager
"------------------------------------------------------------------------------

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" FZF
"------------------------------------------------------------------------------
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>a :Ag <c-r><c-w><cr>
nnoremap <silent><leader>A :Ag! <c-r><c-w><cr>
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>L :Lines<cr>
nnoremap <silent><leader>l :BLines<cr>
nnoremap <silent><leader>t :Tags<cr>
nnoremap <silent><leader>B :BTags<cr>
nnoremap <silent><leader>ma :Marks<cr>
nnoremap <silent><leader>m :Maps<cr>
nnoremap <silent><leader>C :Commands<cr>
nnoremap <silent><leader>h :History<cr>
nnoremap <silent><leader>hh :Helptags<cr>
nnoremap <silent><leader>S :Snippets<cr>

"' Customize fzf colors to match your color scheme
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

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
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
hi ALEErrorSign    ctermfg=167 guifg=#fb4934 ctermbg=237
hi ALEWarningSign  ctermfg=214 guifg=#fabd2f ctermbg=237
let g:ale_linters = {
\   'cpp': ['clang', 'cppcheck', 'cpplint', 'clangcheck', 'clangtidy'],
\}

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Python syntax
let python_highlight_all=1
let python_highlight_space_errors=0

" Vim incsearch
" let g:incsearch#auto_nohlsearch = 1
" let g:incsearch#do_not_save_error_message_history = 1
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,react,jquery'

" Tagbar
nnoremap <leader>T :TagbarToggle<cr>

" FUNCTIONS------------------------------------

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
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Return to last edit position when opening files (You want this!)
"------------------------------------------------------------------------------
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

" Autosaving when leaving insert mode
"------------------------------------------------------------------------------
autocmd InsertLeave * if expand('%') != '' | update | endif

" Make preview window close when leaving insert mode
"------------------------------------------------------------------------------
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" HTML Config
"------------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.html set filetype=html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" cppreference (will open a browser with a search in www.cppreference.com)
"------------------------------------------------------------------------------
fun! CppRef()
    let s:keyword = expand("<cword>")
    let s:url = "http://en.cppreference.com/mwiki/index.php?title=Special:Search&search=" . s:keyword
    if s:url != ""
        silent exec "!open '".s:url."'"
    endif
endfun
nmap <leader>q :call CppRef()<CR>

" Auto Relative Numbers Toggle
"------------------------------------------------------------------------------
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

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

" [ALE]
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
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
set statusline+=%2*\ %{LinterStatus()}
" Line, lines, percentage
set statusline+=%*\ %l
set statusline+=\/%L\ \|\ %c\ \|
set statusline+=\ %p%%
set statusline+=\ %*

" Orange
hi User1 guifg=#FF8000 guibg=#504945
" Green
hi User2 guifg=#DEE511 guibg=#504945
" Pink
hi User3 guifg=#EA7E93 guibg=#504945

" Ripgrep integration
"-------------------------------------------------------------------------------

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" set grepprg=rg\ --vimgrep

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
    autocmd BufWritePre *.cpp call ClangFormatOnSave()
endif
