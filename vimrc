set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'fatih/vim-go' 
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
Plugin 'justinmk/vim-sneak'
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'jaxbot/browserlink.vim'

call vundle#end()

" Settings {{{

filetype on
filetype indent on
filetype plugin on
syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=/tmp
set cmdheight=2
set colorcolumn=80
set copyindent
set cot-=preview
set cursorline
set enc=utf-8
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
set splitright
set t_Co=256
set tabstop=4
set termencoding=utf-8
set title
set titleold=0
set ttyfast
set undolevels=1000
set wildmenu
set wildmode=longest,list

if has('gui_running')
    colorscheme molokai
    set background=dark
    set mouse=a
    set guioptions-=TmrlL
    set guioptions+=c
    set lines=60
    set columns=180
    set guifont=Envy\ Code\ R\ for\ Powerline:h15
    "set guifont=PragmataPro\ for\ Powerline:h16
    "set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    "set guifont=Courier:h14
    "set guifont=Liberation\ Mono\ for\ Powerline:h14
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    "set guifont=Courier\ Final\ Draft\ for\ Powerline:h14
else
    set term=xterm-256color
    set guifont=Fira\ Mono\ for\ Powerline:h14
endif

" }}}

" MAPPINGS {{{ 

" Some irritating maps
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap q: <nop>

let mapleader = ","
let g:mapleader = ","

" Moving a la SBT2
nnoremap <silent><c-j> :m .+1<CR>==
nnoremap <silent><c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Some tricks...
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 ddp
"
" Fast searching
nmap <space> /
nmap <c-space> ?

" Get rid of ^M
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Turn off Highlight
nmap <silent><leader><leader> :noh<cr>

" Fast Spanish Insert Scapeout
nmap ñ :
inoremap ññ <esc>

" Fast write
noremap<leader>w :w<cr>

" Delete a buffer
map <silent><leader>bd :bdelete<cr>
map <silent><leader>bD :bdelete!<cr>

" Move between buffers
nmap <silent><c-right> :bn!<CR>
nmap <silent><c-left> :bp!<CR>
imap <silent><c-right> <esc>:bn!<CR>
imap <silent><c-left> <esc>:bp!<CR>

" Copy-paste win fashioned
imap <c-v> <esc>"*P}i
vmap <c-c> "*y<esc>

" Moving through wrapped lines
nmap j gj
nmap k gk

" Use tab and s-tab for indenting blocks in Visual Mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" vimrc editing and sourcing
noremap <leader>v :e! $MYVIMRC<CR>
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null
" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j
" Relative numbers toggle
nnoremap <leader>rn :set relativenumber!<cr>
" Toggle paste
nnoremap <silent><leader>p :set invpaste<CR>

" Location list mappings
nmap <silent><leader>z :lnext<CR>
nmap <silent><leader>x :lprevious<CR>

"}}}

"   Plugin options {{{

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <F2> :TagbarToggle<CR>
let tlist_ctags_cmd='/usr/local/bin/ctags'

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsJumpForwardTrigger="<C-z>"
let g:UltiSnipsJumpBackwardTrigger="<C-Z>"

" Airline
let g:airline_powerline_fonts = 1
let g:rehash256 = 1

" DelimitMate
let delimitMate_expand_cr = 1
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"

" python-mode
let g:pymode_folding=0
let g:pymode_rope_completion=0
let g:pymode_lint_cwindow=0
let g:pymode_lint_on_write=0
nmap <leader>L :PymodeLintToggle<CR>
nmap <leader>l :PymodeLint<CR>

" Vimgo
au FileType go nmap <Leader>gd <Plug>(go-def)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <leader>gc <Plug>(go-build)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gf :GoFmt<CR>

" Vim Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" }}}

" VIM Secrets {{{
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
"
" Extract text from lines
"
" Fast format a json file or chunk
" :%!python -m json.tool
"
" En/De/code base64 selected block text
" :echo system('base64 --decode', @")
" :vnoremap <leader>64 y:echo system('base64 --decode', @")<cr>
" :vnoremap <leader>64 c<c-r>=system('base64 --decode', @")<cr><esc>

"}}}

" Functions {{{
" Deletes trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType go,c,cpp,java,javascript,php,ruby,python,css,haskell autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

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

"}}}
