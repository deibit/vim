set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"{{{ Plugin list

Plugin 'gmarik/Vundle.vim'

Plugin 'Chiel92/vim-autoformat'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'deibit/A.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'gabesoft/vim-ags'
Plugin 'haya14busa/incsearch.vim'
Plugin 'honza/vim-snippets'
"Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-airline'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-operator-user'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vhdirk/vim-cmake'
Plugin 'wellle/targets.vim'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'

" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()"}}}

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
set splitright
set t_Co=256
set tabstop=4
set termencoding=utf-8
set timeoutlen=1000
set ttimeoutlen=0
set title
set titleold=0
set ttyfast
set undolevels=1000
set wildmenu
set wildmode=longest,list

if has('gui_running')
    colorscheme jellybeans
    set background=dark
    set mouse=a
    set guioptions-=TmrlL
    set guioptions+=c
    set lines=60
    set columns=170
    "set guifont=Envy\ Code\ R\ for\ Powerline:h16
    "set guifont=PragmataPro\ for\ Powerline:h16
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    "set guifont=Courier:h14
    "set guifont=Liberation\ Mono\ for\ Powerline:h14
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    "set guifont=Courier\ Final\ Draft\ for\ Powerline:h14
else
    set term=xterm-256color
    colorscheme jellybeans
    set background=light
endif

" }}}

" Mappings {{{ 

let mapleader = ","
let g:mapleader = ","

" Nop some keys
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap q: <nop>

" Some tricks...
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 ddp

" Get rid of ^M
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Turn off Highlight
nmap <silent><leader><space> :noh<cr>

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
nnoremap <silent><leader>p :set invpaste<CR>

" Location list mappings
nmap <silent><leader>z :lnext<CR>
nmap <silent><leader>x :lprevious<CR>

" Replaces a visual selected text to its base64 or reverse
vnoremap <leader>64 c<c-r>=system('base64', @")<cr><esc>
vnoremap <leader>46 c<c-r>=system('base64 --decode', @")<cr><esc>

"}}}

"   Plugin options {{{

" vim-autoformat
au BufWrite * :Autoformat<cr>

" Lightline
"let g:lightline = {
"\ 'colorscheme': 'solarized',
"\ 'component': {
"\   'readonly': '%{&readonly?"⭤":""}',
"\ },
"\ }

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'

" Ags
nnoremap <leader>a :Ags 

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-z>"

" DelimitMate
let delimitMate_expand_cr = 1
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"

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

" Vim Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap <leader>A <Plug>(EasyAlign)

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,angularjs,jquery'

" YouCompleteMe
let g:ycm_warning_symbol = '>'
let g:ycm_error_symbol = '>>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/Dropbox/codigo/cpp/.ycm_extra_conf.py'
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gD :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gt :YcmCompleter GetType<cr>
nnoremap <leader>gT :YcmCompleter GetParent<cr>

" EasyMotion
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase=1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" Syntastic
nnoremap <leader>c :SyntasticCheck<cr>
nnoremap <leader>C :SyntasticToggleMode<cr>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive"}

" Tagbar
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
let g:tagbar_expand = 1
nnoremap <leader>t :TagbarToggle<cr>

" Gutentags
let g:gutentags_ctags_executable = "/usr/local/bin/ctags"

" NERDTree
autocmd StdinReadPre * let s:std_in=1
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']

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
"autocmd FileType c,cpp autocmd BufWritePre <buffer> :call <Plug>(operator-clang-format)

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

"}}}

augroup filetype                                                     
    au BufRead,BufNewFile *.lex,*.jlex    set filetype=jlex         
augroup END                                                          
au Syntax jlex    so ~/.vim/syntax/jflex.vim  
