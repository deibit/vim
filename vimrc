set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'SirVer/ultisnips'
Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'endel/vim-github-colorscheme'
Plugin 'fatih/vim-go' 
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
Plugin 'justinmk/vim-sneak'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mbbill/undotree'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
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
"set clipboard+=unnamed
set colorcolumn=80
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
set encoding=utf-8
set termencoding=utf-8
set tabstop=4
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
    set lines=48
    set columns=160
    "set guifont=Envy\ Code\ R\ for\ Powerline:h14
    set guifont=PragmataPro\ for\ Powerline:h16
    "set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    "set guifont=Courier:h14
    "set guifont=Liberation\ Mono\ for\ Powerline:h14
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    "set guifont=Courier\ Final\ Draft\ for\ Powerline:h14
else
    set term=xterm-256color
endif

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

" Fast Spanish Access To Command
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

""""""""""""""""""""""""""""""""""""""""""""""
"
"
"   PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <F2> :TagbarToggle<CR>
let tlist_ctags_cmd='/usr/local/bin/ctags'

" CtrlP
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" NERDTree
autocmd StdinReadPre * let s:std_in=1
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$']

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsJumpForwardTrigger="<C-z>"
let g:UltiSnipsJumpBackwardTrigger="<C-Z>"

" Syntastic
map <silent><leader>e :Errors<CR>
map <leader>s :SyntasticToggleMode<CR>
nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprevious<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1

" Airline
let g:airline_powerline_fonts = 1
let g:rehash256 = 1

" Tabularize
if exists(":Tabularize")
  nmap <silent><Leader>a= :Tabularize /=<CR>
  vmap <silent><Leader>a= :Tabularize /=<CR>
  nmap <silent><Leader>a: :Tabularize /:\zs<CR>
  vmap <silent><Leader>a: :Tabularize /:\zs<CR>
endif

" DelimitMate
let delimitMate_expand_cr = 1
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"

" Jedi
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration = 0

" Neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Multiple Cursors
" Default mapping - Multiple Cursors plugin
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Vimgo
au FileType go nmap <Leader>gd <Plug>(go-def)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <leader>gc <Plug>(go-build)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gf :GoFmt<CR>

" Vim Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
" En/De/code base64 selected block text
" :echo system('base64 --decode', @")
" :vnoremap <leader>64 y:echo system('base64 --decode', @")<cr>
" :vnoremap <leader>64 c<c-r>=system('base64 --decode', @")<cr><esc>


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

