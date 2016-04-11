call plug#begin('~/.vim/bundle')

" PLUGINS {{{

" Plug 'Shougo/vimproc.vim'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'
Plug 'junegunn/vim-emoji'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Chun-Yang/vim-action-ag'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'deibit/A.vim'
Plug 'easymotion/vim-easymotion'
" Plug 'fatih/vim-go'
" Plug 'garyburd/go-explorer'
Plug 'haya14busa/incsearch.vim'
Plug 'hdima/python-syntax'
Plug 'honza/vim-snippets'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-plug'
Plug 'kana/vim-operator-user'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-clang-format'
Plug 'rking/ag.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vhdirk/vim-cmake'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'sickill/vim-monokai'
Plug 'w0ng/vim-hybrid'
Plug 'jonathanfilip/vim-lucius'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'

"}}}

call plug#end()

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
    colorscheme monokai
    set background=dark
    set mouse=a
    set guioptions-=TmrlL
    set guioptions+=c
    set lines=60
    set columns=170
    "set guifont=Envy\ Code\ R\ for\ Powerline:h16
    " set guifont=PragmataPro\ for\ Powerline:h13
    "set guifont=Source\ Code\ Pro\ for\ Powerline:h12
    "set guifont=Courier:h14
    set guifont=Liberation\ Mono\ for\ Powerline:h13
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    "set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
    "set guifont=Courier\ Final\ Draft\ for\ Powerline:h14
else
    "set term=xterm-256color
    colorscheme monokai
    set background=dark
endif


" MAPPINGS

let mapleader = ","
let g:mapleader = ","

" Fast escape
inoremap jk <ESC>

" Nop some keys
nnoremap <F1> <nop>
nnoremap Q <nop>

" Some tricks...
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 ddp

" Get rid of ^M
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Turn off Highlight
nnoremap <silent><leader>h :noh<cr>

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
noremap <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

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
nnoremap <silent><c-p> :bp<cr>

" Fast search!
nnoremap <space> /
nnoremap <leader><space> ?

" }}}

" PLUGIN OPTIONS {{{

" Bufexplorer
nnoremap <silent> <leader><leader> :BufExplorer<CR>

" Neco-GHC
" let g:haskellmode_completion_ghc = 0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" let g:ycm_semantic_triggers = {'haskell' : ['.']}

" YouCompleteMe
if emoji#available()
    let g:ycm_warning_symbol = emoji#for('exclamation')
    let g:ycm_error_symbol = emoji#for('boom')
endif
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/GoogleDrive/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 1
nnoremap <leader>d :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>D :YcmCompleter GoToDefinition<cr>
nnoremap <leader>t :YcmCompleter GetType<cr>
nnoremap <leader>T :YcmCompleter GetParent<cr>
let g:ycm_filetype_blacklist = {
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'markdown' : 1,
  \ 'unite' : 1,
  \ 'vimwiki' : 1,
  \ 'pandoc' : 1,
  \ 'infolog' : 1,
  \ 'mail' : 1
  \}

" Python syntax
let python_highlight_all = 1

" Vim-go
" let g:go_highlight_interfaces = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" let g:go_fmt_command = "goimports"

" au FileType go nmap <leader>gr <Plug>(go-run)
" au FileType go nmap <leader>gb <Plug>(go-build)
" au FileType go nmap <leader>gt <Plug>(go-test)
" au FileType go nmap <leader>gc <Plug>(go-coverage)
" au FileType go nmap <Leader>ge <Plug>(go-def-split)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gD <Plug>(go-doc-browser)
" au FileType go nmap <Leader>gi <Plug>(go-implements)
" au FileType go nmap <Leader>gI <Plug>(go-info)
" au FileType go nmap <Leader>gR <Plug>(go-rename)

" Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" A - Change header/implementation h/cpp
nnoremap <leader>H :A<cr>

" FZF
nnoremap <leader>f :FZF<cr>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'zenburn'

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

" FZF Buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" FZF Jump to tags
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

"}}}

