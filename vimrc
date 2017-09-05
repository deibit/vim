" PLUGINS----------------------------------------------------------------------

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/bundle')
endif

Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'rhysd/vim-clang-format'
Plug 'lyuts/vim-rtags'
Plug 'deibit/a.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git related plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'                               " Integrates Git

" Temporaly deactivated (or not) plugins
Plug 'fatih/vim-go'
Plug 'davidhalter/jedi-vim'

" Plugins related to save moves
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
" Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'                             " Autoclosing parents
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'tommcdo/vim-lion'                                 " Align text
Plug 'tpope/vim-commentary'

" Plugins related to improved the interface
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-sandwich'                           " Parents operations
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'w0rp/ale'

" Syntax related plugins
Plug 'hdima/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'jansenm/vim-cmake'

" Misc. Plugins
Plug 'xolox/vim-misc'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'hzchirs/vim-material'

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
set clipboard^=unnamed
set clipboard^=unnamedplus
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
set noerrorbells
set novisualbell
set noshowmode
set laststatus=2
set shortmess+=I
set showmatch
set showcmd
set cmdheight=2
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
set cot-=preview
set lazyredraw
set splitbelow
set splitright
" Terminal
set encoding=utf-8
set t_Co=256
set termencoding=utf-8
set timeoutlen=500
set title
set titleold=0
set ttimeoutlen=0
set ttyfast
if (has("termguicolors"))
set termguicolors
endif

" Wildmenu options
set wildmenu
set wildmode=longest,list,full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.pyc,node_modules
set wildignore+=*/tmp/,*.swp,*.zip
set wildignorecase

" Fold
set foldmethod=marker

" Colorscheme
colorscheme gruvbox
set background=dark

" Macvim zone
if has("gui_macvim")
" set guifont=Envy\ Code\ R\ For\ PowerLine:h13
" let macvim_skip_colorscheme=1
" set guifont=Literation\ Mono\ PowerLine:h13
set guifont=InconsolataForPowerline\ Nerd\ Font\ Mediana:h13
" set guifont=Anonymous\ Pro:h13
endif

" MAPPINGS---------------------------------------------------------------------

" Goto the last edited file
nnoremap <BS> <C-^>

" Move lines and blocks
nnoremap <silent><c-k>   :<C-u>move-2<CR>==
nnoremap <silent><c-j>   :<C-u>move+<CR>==
xnoremap <silent><c-k>   :move-2<CR>gv=gv
xnoremap <silent><c-j>   :move'>+<CR>gv=gv

" Leader
let mapleader = ","
let g:mapleader = ","

" Non-english keyboard tag navigation fix
nnoremap <silent><leader>g <c-]>

" tselect convenient shortcut
nnoremap <leader>e :exec 'tselect' expand('<cword>')<cr>

" Fast escape
inoremap jj <ESC>

" Nop some keys
nnoremap Q <nop>
nnoremap gQ <nop>

" Turn off Highlight
nmap <silent><leader><cr> :noh<cr>

" Some convenient shortcuts
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

" Get rid of ^M
noremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Fast saving
nnoremap<leader>w :w<cr>

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

" Toggle relative numbers
nnoremap <silent><f11> :set relativenumber!<CR>

" Window manipulation
nnoremap <leader>% :split<CR>
nnoremap <leader>" :vsplit<CR>
nnoremap <leader>x <c-w>c

" Moving through windows
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j

" Fast search!
nnoremap <space> /
nnoremap <leader><space> ?

" Remapped U for redo ctrl-r
nnoremap U <c-r>

" ); shortcut for C family languages
au FileType c,cpp,js inoremap ;; <esc>A;<cr>

" Fast buffer browsing
nnoremap <silent><c-h> :bp<cr>
nnoremap <silent><c-l> :bn<cr>

command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis
nnoremap <leader>O :DiffOrig<cr>

" PLUGINS-CONFIG---------------------------------------------------------------

" FZF
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>a :Ag <c-r><c-w><cr> 
nnoremap <silent><leader>A :Ag! <c-r><c-w><cr> 
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>L :Lines<cr>
nnoremap <silent><leader>l :BLines<cr>
nnoremap <silent><leader>t :Tags<cr>
nnoremap <silent><leader>s :BTags<cr>
nnoremap <silent><leader>m :Marks<cr>
nnoremap <silent><leader>C :Commands<cr>
nnoremap <silent><leader>h :History<cr>
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

" Augmenting Ag with a preview window
command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>,
\                 <bang>0 ? fzf#vim#with_preview('up:60%')
\                         : fzf#vim#with_preview('right:50%:hidden', '?'),
\                 <bang>0)

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

" YCM
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_always_populate_location_list = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '/Users/david/temp/cpp/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" A (switch header/implementation)
nnoremap <silent><leader>H :A<CR>
nnoremap <silent><leader>HS :AS<CR>
nnoremap <silent><leader>HV :AV<CR>

" EasyMotion
nmap <leader>- <Plug>(easymotion-s2)
nmap <leader>. <Plug>(easymotion-t2)

" clang-completer
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
" <Plug>(clang_complete_goto_declaration_preview)
au FileType c,cpp  nmap gd <Plug>(clang_complete_goto_declaration_preview)

" Ack
if executable('ag')
let g:ackprg = 'ag --vimgrep'
endif
" nnoremap <leader>a :Ack! <cword><space>

" Completion
" This prevents CR from feed a new line when selecting an option in popup menu
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Rainbow
let g:rainbow_active = 1

" Ale
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
map <silent><c-p> <Plug>(ale_previous_wrap)
map <silent><c-n> <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_enabled = 0
let g:ale_set_loclist = 1
let g:ale_cpp_cpplint_options = "--filter=legal"
let g:ale_sign_column_always = 1
nnoremap <silent><leader>c :lcl<cr>
nnoremap <silent><leader>o :lop<cr>
let g:ale_linters = {
\   'cpp': ['clang', 'cppcheck', 'cpplint', 'clangcheck', 'clangtidy'],
\}

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Remapped because of vim-sandwich
nmap s <Nop>
xmap s <Nop>

" Clangformat
autocmd FileType c,cpp ClangFormatAutoEnable

" Python syntax
let python_highlight_all=1

" Airline
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

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

" MISC-------------------------------------------------------------------------
"
" Delete all ^M Windows line endings
" :%s/^M$//g
" But ^M has to be entered by Ctrl+v+Ctrl+m
"
" Yank all matches regex with grouping in a register
" :%s/regex/\=setreg('A', submatch(0), 'V')/n
" :%s/regex <--- possibly with grouping \(regex\)
" .../\=setreg('register name', select group (number), 'V' = linewise
" ... ... /n <--- sandbox, it won't actually make changes
"
" Write as sudo
" :w !sudo tee %
"
" Load an hex version of buffer and revert back
" :%!xxd
" :%!xxd -r
"
" Fast format a json file or chunk
" :%!python -m json.tool
"
" FUNCTIONS
"
" Deletes trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
let l = line(".")
let c = col(".")
%s/\s\+$//e
call cursor(l, c)
endfun
autocmd FileType c,cpp,java,javascript,php,ruby,python,css,rust autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
"
" Autosaving when leaving insert mode
autocmd InsertLeave * if expand('%') != '' | update | endif

" Make preview window close when leaving insert mode
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" HTML Config
autocmd BufNewFile,BufReadPost *.html set filetype=html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
