" PLUGINS {{{

call plug#begin('~/.vim/bundle')

" Symbols, completions and language related plugins
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rhysd/vim-clang-format'
Plug 'gabesoft/vim-ags'

" Git related plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'                               " Integrates Git

" Deactivated plugins
"Plug 'rust-lang/rust.vim'
"Plug 'fatih/vim-go'

" Plugins related to save moves
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'wellle/targets.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'                             " Autoclosing parents
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'tommcdo/vim-lion'                                 " Align text
Plug 'scrooloose/nerdcommenter'

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
Plug 'jelera/vim-javascript-syntax'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'vhdirk/vim-cmake'

" Misc. Plugins
Plug 'junegunn/vim-slash'
Plug 'xolox/vim-misc'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'

call plug#end()

" }}}

" SETTINGS {{{

filetype on
filetype indent on
filetype plugin on
syntax enable

" Behaviour
set autoread
set hidden
" Mouse
set clipboard^=unnamed
set clipboard^=unnamedplus
set mouse=a
" Search
set hlsearch
set ignorecase
set noincsearch
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
set relativenumber
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
" Wildmenu options
set wildmenu
set wildmode=longest,list,full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.pyc,node_modules
set wildignorecase
" Fold
set foldmethod=marker
" Colorscheme
colorscheme gruvbox
set background=dark

" Netrw
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_list_hide=netrw_gitignore#Hide()

" Macvim zone
if has("gui_macvim")
    set guifont=Envy\ Code\ R\ For\ PowerLine:h13
    " let macvim_skip_colorscheme=1
    " set guifont=Literation\ Mono\ PowerLine:h13
    " set guifont=InconsolataForPowerline\ Nerd\ Font\ Mediana:h13
    " set guifont=Anonymous\ Pro:h13
endif

" }}}

" MAPPINGS {{{

" Move lines and blocks
nnoremap <silent><c-k> :m .-2<CR>==
nnoremap <silent><c-j> :m .+1<CR>==
inoremap <silent><c-j> <Esc>:m .+1<CR>==gi
inoremap <silent><c-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><c-j> :m '>+1<CR>gv=gv
vnoremap <silent><c-k> :m '<-2<CR>gv=gv>

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

" Easy buffer browsing
nnoremap <leader>b :ls<cr> :b<space>

" Netrw shorcut
nnoremap <leader>f :edit .<cr>

" tselect convenient shortcut
nnoremap <leader>t :exec 'tselect' expand('<cword>')<cr>

" }}}

" {{{ PLUGINS

" Ags
nnoremap <leader>a :Ags <cword><cr>

" Rainbow
let g:rainbow_active = 1

" Ale
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
map <silent> <leader>p <Plug>(ale_previous_wrap)
map <silent> <leader>n <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" if (has("termguicolors"))
"  set termguicolors
" endif

" vim-rust
let g:rustfmt_autosave = 1
let g:ycm_rust_src_path = '/Users/david/temp/rust/rust/src'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Remapped because of vim-sandwich
nmap s <Nop>
xmap s <Nop>

" Clangformat
autocmd FileType c,cpp ClangFormatAutoEnable

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostic_ui = 0
let g:ycm_global_ycm_extra_conf = '~/GoogleDrive/.ycm_extra_conf.py'
nnoremap <leader>o :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>O :YcmCompleter GoToDefinition<cr>
nnoremap <leader>h :YcmCompleter GoToInclude<cr>
nnoremap <leader>y :YcmCompleter GetType<cr>

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

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-z>"

" Vim incsearch
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#do_not_save_error_message_history = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,react,jquery'

" Tagbar
nnoremap <leader>S :TagbarToggle<cr>

" Vim-current-word
let g:vim_current_word#highlight_current_word = 0
autocmd VimEnter * hi CurrentWordTwins guibg=#444444


" }}}

" MISC {{{
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
autocmd FileType vim,c,cpp,java,javascript,php,ruby,python,css,rust autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

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

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" HTML Config
autocmd BufNewFile,BufReadPost *.html set filetype=html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"}}}
