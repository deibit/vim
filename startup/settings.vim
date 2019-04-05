filetype on
filetype indent on
filetype plugin on
syntax enable

" Behaviour
set autoread
set hidden
set tags=./tags;,tags;
" Mouse
set clipboard^=unnamed
if !has('mac')
    set clipboard+=unnamedplus
endif
set mouse=a
" Search
set hlsearch
set ignorecase
set incsearch
set magic
set matchpairs+=<:>
" Backup
set noswapfile
set backupdir=/tmp
set copyindent
set history=1000
set nobackup
set nowritebackup
set undolevels=1000
" Verbosity
set noshowmode
set noerrorbells
set novisualbell
set laststatus=2
set shortmess+=I
set showmatch
set showcmd
set colorcolumn=80
set cursorline
" Indent, case, tabs
set backspace=indent,eol,start
set autoindent
set expandtab
set shiftwidth=4
set smartcase
set smarttab
set tabstop=4
set softtabstop=4
" Windows
set number
" set cot-=preview
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
if (has("termguicolors"))
    set termguicolors
endif

" Wildmenu options
set wildmenu
set wildmode=list:longest,full
set wildignorecase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.vscode/*
set wildignore+=*/tmp/,*.swp,*.zip
set wildignore+=*.a,*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.orig " Merge resolution file
set wildignore+=*.pdf,*.zip,*.so " binaries
set wildignore+=*.pyc,*.pyo,*/__pycache__/* " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.swp,*.bak " ignore these
set wildignore+=*.sw? " Vim swap files
set wildignore+=**/vendor " Ignore vendor directory
set wildignore+=tags " tag files

" Fold
set foldmethod=marker

" Colorscheme
set background=dark
colorscheme gruvbox
if has('mac')
    set termguicolors
endif

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undofile
set undodir=/tmp/
