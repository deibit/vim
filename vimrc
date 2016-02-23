set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" PLUGINS {{{

Plugin 'gmarik/Vundle.vim'

Plugin 'mattn/emmet-vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Shougo/neocomplete'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'deibit/A.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'fatih/vim-go'
Plugin 'gabesoft/vim-ags'
Plugin 'haya14busa/incsearch.vim'
Plugin 'honza/vim-snippets'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'junegunn/fzf'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-operator-user'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'
Plugin 'xolox/vim-misc'

" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'nanotech/jellybeans.vim'
Plugin 'joshdick/onedark.vim'

"}}}

call vundle#end()

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
set splitright
set t_Co=256
set tabstop=4
set termencoding=utf-8
set timeoutlen=1000
set title
set titleold=0
set ttimeoutlen=0
set ttyfast
set undolevels=1000
set wildmenu
set wildmode=longest,list

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.pyc

if has('gui_macvim')
    colorscheme badwolf
    set background=dark
    set clipboard+=unnamed
    set mouse=a
    set guioptions-=TmrlL
    set guioptions+=c
    set lines=60
    set columns=170
    let g:rehash256=1
    "set guifont=Envy\ Code\ R\ for\ Powerline:h16
    "set guifont=PragmataPro\ for\ Powerline:h13
    set guifont=Source\ Code\ Pro\ for\ Powerline:h13
    "set guifont=Courier:h14
    "set guifont=Liberation\ Mono\ for\ Powerline:h14
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    "set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
    "set guifont=Courier\ Final\ Draft\ for\ Powerline:h14
else
    "set term=xterm-256color
    colorscheme solarized
    set background=light
endif

" MAPPINGS

let mapleader = ","
let g:mapleader = ","

" Fast escape
inoremap jk <ESC>

" Nop some keys
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap q: :q

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

" Replaces a visual selected text to its base64 or reverse
vnoremap <leader>64 c<c-r>=system('base64', @")<cr><esc>
vnoremap <leader>46 c<c-r>=system('base64 --decode', @")<cr><esc>

" Splitting windows a la tmux
nnoremap <leader>% :split<CR>
nnoremap <leader>" :vsplit<CR>
nnoremap <leader>x <c-w>c
nnoremap <leader><left> <c-w>h
nnoremap <leader><right> <c-w>l
nnoremap <leader><up> <c-w>k
nnoremap <leader><down> <c-w>j

" Move between buffers
nnoremap <silent><c-n> :bn<cr>
nnoremap <silent><c-m> :bp<cr>

" }}}

" PLUGIN OPTIONS {{{

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        " return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" Vim-emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>ge <Plug>(go-def-split)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gD <Plug>(go-doc-browser)
au FileType go nmap <Leader>gi <Plug>(go-implements)
au FileType go nmap <Leader>gI <Plug>(go-info)
au FileType go nmap <Leader>gR <Plug>(go-rename)


" Tagbar
nnoremap <silent> <leader>c :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'


" A - Change header/implementation h/cpp
nnoremap <leader>H :A<cr>

" FZF
nnoremap <leader>f :FZF<cr>
let g:fzf_launcher="open_fzf_in_iterm2 %s"

" Airline
let g:airline_powerline_fonts = 1
"if has('gui_running')
    "let g:airline_theme='badwolf'
"else
    "let g:airline_theme='badwolf'
"endif

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
" former conflicts with :A <- header/impl changer

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,angularjs,jquery'

" EasyMotion
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase=1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" }}}

" VIM SECRETS {{{
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

" FUNCTIONS
"
" Deletes trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,javascript,php,ruby,python,css,haskell autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
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

