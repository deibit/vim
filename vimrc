set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'justinmk/vim-sneak'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'

call vundle#end()

filetype on
filetype indent on
filetype plugin on
syntax enable

set autochdir
set autoindent
set autoread
set backspace=indent,eol,start
set cmdheight=2
set copyindent
set cot-=preview
set cursorline
set enc=utf-8
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
set backupdir=/tmp
set nobackup
set noerrorbells
set noshowmode
set noswapfile
set novisualbell
set nowritebackup
set number
set scrolloff=2
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
set title
set titleold=0
set ttyfast
set undolevels=1000
set wildmenu
set wildmode=longest,list

"
"       MAPPINGS
"
""""""""""""""""""""""""""""""""""""""""""""""
"
" Some irritating maps
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap q: <nop>

let mapleader = ","
let g:mapleader = ","

" Moving a la SBT2
nnoremap <c-s-j> :m+<CR>==
nnoremap <c-s-k> :m-2<CR>==
inoremap <c-s-j> <Esc>:m+<CR>==gi
inoremap <c-s-k> <Esc>:m-2<CR>==gi
vnoremap <c-s-j> :m'>+<CR>gv=gv
vnoremap <c-s-k> :m-2<CR>gv=gv

" Some Jedi tricks...
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

" Fast Spanish Access To Command
nmap ñ :
inoremap ññ <esc>

" Fast write
noremap<leader>w :w<cr>

" A buffer for scribble
map <leader>e :e ~/buffer<cr>

" Delete a buffer
map <silent><leader>bd :bdelete<cr>
map <silent><leader>bD :bdelete!<cr>

" Manage windows
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move between buffers
nmap <silent><c-right> :bn!<CR>
nmap <silent><c-left> :bp!<CR>
imap <silent><c-right> <esc>:bn!<CR>
imap <silent><c-left> <esc>:bp!<CR>

" Copy-paste win fashioned
imap <c-v> <esc>"*P}i
vmap <c-c> "*y<esc>

" Make preview window close when leaving insert mode
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

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
nnoremap <silent><leader>P :set invpaste<CR>
"
"   PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme molokai
let g:rehash256 = 1

let g:tagbar_usearrows = 1
nnoremap <leader>t :TagbarToggle<CR>

let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

nnoremap <leader>u :UndotreeToggle<cr>

autocmd StdinReadPre * let s:std_in=1
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']

if has('gui_running')
    set mouse=a
    set guioptions-=TmrlL
    set guioptions+=c
    let tlist_ctags_cmd='/usr/local/bin/ctags'
    set lines=48
    set columns=160
    set guifont=Envy\ Code\ R\ for\ Powerline:h14
endif

" Deletes trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType go,c,cpp,java,javascript,php,ruby,python,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

let g:UltiSnipsExpandTrigger="<C-x>"
let g:UltiSnipsJumpForwardTrigger="<C-x>"
let g:UltiSnipsJumpBackwardTrigger="<C-X>"

"map <silent> <leader>e :Errors<CR>
"map <leader>s :SyntasticToggleMode<CR>
"let g:syntastic_aggregate_errors = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if exists(":Tabularize")
  nmap <silent><Leader>a= :Tabularize /=<CR>
  vmap <silent><Leader>a= :Tabularize /=<CR>
  nmap <silent><Leader>a: :Tabularize /:\zs<CR>
  vmap <silent><Leader>a: :Tabularize /:\zs<CR>
endif

let delimitMate_expand_cr = 1

" VIM Secrets
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
let g:ycm_global_ycm_extra_conf = '/Users/david/Dropbox/codigo/cpp/ycm_extra_conf.py'
