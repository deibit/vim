set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Plugin 'fatih/vim-go'
"Plugin 'mattn/emmet-vim'
"Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
"Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-markdown'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'gabesoft/vim-ags'
Plugin 'haya14busa/incsearch.vim'
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'klen/python-mode'
"Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'

" Themes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'

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
set timeoutlen=1000
set ttimeoutlen=0
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
    "set guifont=Envy\ Code\ R\ for\ Powerline:h16
    "set guifont=PragmataPro\ for\ Powerline:h16
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    "set guifont=Courier:h14
    "set guifont=Liberation\ Mono\ for\ Powerline:h14
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    "set guifont=Courier\ Final\ Draft\ for\ Powerline:h14
else
    set term=xterm-256color
    colorscheme molokai
    set background=dark
endif

" }}}

" MAPPINGS {{{ 

" Some irritating maps
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap q: <nop>

let mapleader = ","
let g:mapleader = ","

" Some tricks...
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 ddp

" Get rid of ^M
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Turn off Highlight
nmap <silent><leader>h :noh<cr>

" Fast Spanish Insert Scapeout
noremap ñ :
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

" Lightline
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ }


"NERDTree
 nnoremap <F1> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 let NERDTreeIgnore=['\.pyd$', '\.pyc$']

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <F2> :TagbarToggle<CR>
let tlist_ctags_cmd='/usr/local/bin/ctags'

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-z>"

" DelimitMate
let delimitMate_expand_cr = 1
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"

" python-mode
let g:pymode_folding=0
let g:pymode_rope_completion=0
let g:pymode_lint_on_write=0
nmap <leader>L :PymodeLintToggle<CR>
nmap <leader>l :PymodeLint<CR>

" Vimgo
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-def)
au FileType go nmap <leader>gf :GoFmt<CR>
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>go <Plug>(go-doc)
au FileType go nmap <leader>gk <Plug>(go-doc-browser)
au FileType go nmap <leader>ge <Plug>(go-rename)
au FileType go nmap <leader>gm <Plug>(go-implements)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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
nmap <leader>a <Plug>(EasyAlign)

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,angularjs,jquery'

" YouCompleteMe
let g:ycm_warning_symbol = '>'
let g:ycm_error_symbol = '>>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/Dropbox/codigo/cpp/.ycm_extra_conf.py'
nnoremap <leader>gd :YcmCompleter GoTo<cr>

" EasyMotion
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase=1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

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
autocmd FileType c,cpp autocmd BufWritePre <buffer> :ClangFormat

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
