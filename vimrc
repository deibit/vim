" PLUGINS {{{

call plug#begin('~/.vim/bundle')

Plug 'Chun-Yang/vim-action-ag'                          " Silver Searcher
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'maralla/completor.vim'
Plug 'airblade/vim-gitgutter'
Plug 'brookhong/cscope.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'hdima/python-syntax'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-slash'                               " Improved in-buffer search
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-sandwich'                           " Parents operations
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'neomake/neomake'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ternjs/tern_for_vim'
Plug 'tommcdo/vim-lion'                                 " Align text
Plug 'tpope/vim-fugitive'                               " Integrates Git
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'ryanoasis/vim-devicons'

" Themes
" Plug 'altercation/vim-colors-solarized'
" Plug 'sjl/badwolf'
" Plug 'sickill/vim-monokai'
" Plug 'w0ng/vim-hybrid'
" Plug 'jonathanfilip/vim-lucius'
" Plug 'nanotech/jellybeans.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.pyc

colorscheme gruvbox
set background=dark
" set guifont=Courier:h13
" set guifont=Literation\ Mono\ PowerLine:h13
" set guifont=ProggyCleanTT\ Nerd\ Font:h18
" set guifont=ProFontIIx\ Nerd\ Font:h10
set guifont=InconsolataForPowerline\ Nerd\ Font:h13
set encoding=utf-8

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

" Fast write
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

" Replaces a visual selected text to its base64 or reverse
vnoremap <leader>64 c<c-r>=system('base64', @")<cr><esc>
vnoremap <leader>46 c<c-r>=system('base64 --decode', @")<cr><esc>

" Closing quickfix quick
nnoremap <leader>c :ccl<CR>

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

" PLUGIN OPTIONS {{{

" vim-rust
let g:rustfmt_autosave = 1
let g:ycm_rust_src_path = '/Users/david/temp/rust/rust/src'

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>a :Ag <cword><cr>

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

" Ctrlp
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map = '<leader>p'
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPBufTag<cr>
nnoremap <leader>T :CtrlPBufTagAll<cr>

" Completor
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
let g:completor_node_binary = '/usr/local/bin/node'
let g:completor_racer_binary = '/Users/david/.cargo/bin/racer'
let g:completor_clang_binary = '/usr/bin/clang'
" In case Jedi does not work is probably the python version
" watch jedi is installed! (pip install jedi)
" let g:completor_python_binary = '/path/to/python/with/jedi/installed'

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
let g:used_javascript_libs = 'underscore,backbone,angularjs,jquery'

" }}}

" MISC {{{
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
" Back and forward in time
" :earlier 15m
" :later 15m
"
" Load an hex version of buffer and revert back
" :%!xxd
" :%!xxd -r
"
" YCM
" cd ~/.vim/bundle/YouCompleteMe
" ./install.sh --clang-completer
"
" Fast format a json file or chunk
" :%!python -m json.tool
"
" En/De/code base64 selected block text
" :echo system('base64 --decode', @")
" :vnoremap <leader>64 y:echo system('base64 --decode', @")<cr>
" :vnoremap <leader>64 c<c-r>=system('base64 --decode', @")<cr><esc>
" UPDATE: :.!base64 or <visualmode>:!base64

" FUNCTIONS
"
" Deletes trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType vim,c,cpp,java,javascript,php,ruby,python,css,haskell autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

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
