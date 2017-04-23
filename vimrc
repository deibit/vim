" PLUGINS {{{

call plug#begin('~/.vim/bundle')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dominikduda/vim_current_word'
Plug 'majutsushi/tagbar'
" Plug 'mileszs/ack.vim'
 Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-repeat'
" Plug 'matze/vim-move'                                   " Move lines and blocks
Plug 'vhdirk/vim-cmake'
" Plug 'tommcdo/vim-exchange'
Plug 'luochen1990/rainbow'
Plug 'elzr/vim-json'
Plug 'scrooloose/nerdtree'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/nerdcommenter'
Plug 'Chun-Yang/vim-action-ag'                          " Silver Searcher
Plug 'jiangmiao/auto-pairs'                             " Autoclosing parents
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'brookhong/cscope.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'hdima/python-syntax'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-slash'
Plug 'jelera/vim-javascript-syntax'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-sandwich'                           " Parents operations
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'w0rp/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'tommcdo/vim-lion'                                 " Align text
Plug 'tpope/vim-fugitive'                               " Integrates Git
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'

" Themes
Plug 'jacoborus/tender.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'sickill/vim-monokai'
Plug 'w0ng/vim-hybrid'
Plug 'jonathanfilip/vim-lucius'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'rhysd/vim-color-spring-night'

call plug#end()

" }}}

" SETTINGS {{{

filetype on
filetype indent on
filetype plugin on
syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=/tmp
set clipboard^=unnamed
set clipboard^=unnamedplus
set cmdheight=2
set colorcolumn=80
set copyindent
set cot-=preview
set cursorline
set encoding=utf-8
set expandtab
set foldmethod=marker
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set indentkeys-=0#
set laststatus=2
set lazyredraw
set magic
set matchpairs+=<:>
set matchtime=1
set mouse=a
set nobackup
set noerrorbells
set noshowmode
set noswapfile
set novisualbell
set nowritebackup
set number
set shiftwidth=4
set shortmess+=I
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set termencoding=utf-8
set timeoutlen=500
set title
set titleold=0
set ttimeoutlen=0
set ttyfast
set undolevels=1000
set wildmenu
set wildmode=longest,list
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.pyc,node_modules

colorscheme gruvbox
" let macvim_skip_colorscheme=1
set background=dark
set guifont=Envy\ Code\ R\ For\ PowerLine:h13
" set guifont=Literation\ Mono\ PowerLine:h13
" set guifont=InconsolataForPowerline\ Nerd\ Font\ Mediana:h13
" set guifont=Anonymous\ Pro:h13

" }}}

" MAPPINGS {{{

nnoremap <silent><c-k> :m .-2<CR>==
nnoremap <silent><c-j> :m .+1<CR>==
inoremap <silent><c-j> <Esc>:m .+1<CR>==gi
inoremap <silent><c-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><c-j> :m '>+1<CR>gv=gv
vnoremap <silent><c-k> :m '<-2<CR>gv=gv>

" Leader

let mapleader = ","
let g:mapleader = ","

" Fast escape
inoremap jj <ESC>

" Nop some keys
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap gQ <nop>

" Turn off Highlight
nmap <silent><leader><cr> :noh<cr>

" Some tricks...
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 ddp

" Get rid of ^M
noremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Fast saving
nnoremap<leader>w :w<cr>

" Copy-paste win fashioned
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

" Splitting windows a la tmux
nnoremap <leader>% :split<CR>
nnoremap <leader>" :vsplit<CR>
nnoremap <leader>x <c-w>c

" Moving windows
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j

" Fast search!
nnoremap <space> /
nnoremap <leader><space> ?

" Remapped U for redo ctrl-r
nnoremap U <c-r>

" }}}

" {{{ PLUGINS

" Rainbow
let g:rainbow_active = 1

" NERDTree
nnoremap <silent><leader>z :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Ale
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" if (has("termguicolors"))
"  set termguicolors
" endif
"
" vim-rust
"
let g:rustfmt_autosave = 1
let g:ycm_rust_src_path = '/Users/david/temp/rust/rust/src'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" Cscope
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Remapped because of vim-sandwich
nmap s <Nop>
xmap s <Nop>

" Clangformat
autocmd FileType c,cpp ClangFormatAutoEnable

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>a :Ag <cword><cr>
nnoremap <leader>r :History<cr>
nnoremap <leader>s :Snippets<cr>



" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostic_ui = 0
let g:ycm_global_ycm_extra_conf = '~/GoogleDrive/.ycm_extra_conf.py'
nnoremap <leader>o :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>O :YcmCompleter GoToDefinition<cr>
nnoremap <leader>h :YcmCompleter GoToInclude<cr>

" Python syntax
let python_highlight_all=1

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-z>"

" Vim incsearch
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
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
autocmd VimEnter * hi CurrentWordTwins ctermbg=11,guibg=#444444


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
