let s:vim_config_dir = expand('~/.vim')
let s:vim_plug_script = s:vim_config_dir . '/autoload/plug.vim'
if !filereadable(s:vim_plug_script)
  execute '!curl -fL https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim --create-dirs -o' shellescape(s:vim_plug_script)
  augroup AUGPlugInstall
    autocmd VimEnter * PlugInstall --sync
    augroup END
endif

if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/bundle')
endif

if !has('mac')
    Plug 'KabbAmine/zeavim.vim'
endif

" Completion, task, etc
" Plug 'jiangmiao/auto-pairs'
Plug 'Krasjet/auto.pairs'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-quickfix'
Plug 'andymass/vim-matchup'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'


" Tag management
" Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
" Plug 'skywind3000/vim-preview'
Plug 'majutsushi/tagbar'

" Javascript
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'posva/vim-vue'
Plug 'jelera/vim-javascript-syntax'

" C C++
Plug 'bfrg/vim-cpp-modern'
Plug 'deibit/a.vim'
Plug 'jansenm/vim-cmake'

" Python
Plug 'vim-python/python-syntax'

" Go
Plug 'fatih/vim-go'

" Swift
Plug 'keith/swift.vim'

" GUI
Plug 'RRethy/vim-illuminate'
Plug 'simnalamburt/vim-mundo'
Plug 'romainl/vim-cool'
Plug 'dense-analysis/ale'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'
Plug 'rhysd/git-messenger.vim'

" Text Transformation
" Plug 'tmsvg/pear-tree'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

" Themes
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'

" Fonts
Plug 'ryanoasis/vim-devicons'

call plug#end()

" <<< SETTINGS >>>

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
set cursorline
set cmdheight=2
" Indent, case, tabs
set backspace=indent,eol,start
set autoindent
set expandtab
set shiftwidth=4
set smartcase
set smarttab
" set tabstop=4
" set softtabstop=4
" Windows
set number
set completeopt-=preview
set completeopt=menu,menuone,noinsert,noselect
set lazyredraw
set splitbelow
set splitright
" Terminal
set encoding=utf-8
set termencoding=utf-8
set timeoutlen=500
set title
set titleold=0
set ttimeoutlen=0
set termguicolors

" Wildmenu options
set wildmenu
" set wildmode=list:longest,full
set wildignorecase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.vscode/*,*/.ccls-cache/*
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
set foldmethod=syntax
set foldlevelstart=20

" Colorscheme
colorscheme warlock
if has('mac')
    set termguicolors
endif

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undofile
set undodir=/tmp/

" Match-it
runtime macros/matchit.vim

" <<< MAPPINGS (not plugins) >>>

nmap <c-s> :w<cr>
"
"Goto the last edited file with backspace
nnoremap <BS> <C-^>
nnoremap <silent><tab> :bn<cr>

" Leader
let mapleader = ","
let g:mapleader = ","

nnoremap <space> <nop>

" Non-english keyboard tag navigation fix
nnoremap <silent><leader>g <c-]>

" Fast escape
inoremap jk <ESC>

" Nop some keys
nnoremap Q <nop>
nnoremap gQ <nop>

" Turn off Highlight (although, is not needed if nohl is set)
nnoremap <silent><leader><cr> :noh<cr>

" Some convenient shortcuts
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

" Get rid of ^M
noremap <leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Fast saving
nnoremap <nowait><leader>w :w<cr>

" Buffer unload
nnoremap <silent><leader>uu :bd<cr>

" Copy-paste Windows fashioned
inoremap <c-v> <esc>"*P}i
vnoremap <c-c> "*y<esc>

" Moving through wrapped lines
nnoremap j gj
nnoremap k gk

" Use tab and s-tab for indenting blocks in Visual Mode
xnoremap <  <gv
xnoremap >  >gv

" vimrc editing and sourcing
noremap <leader>v :e! $MYVIMRC<CR>
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" This command will allow us to save a file we don't have permission to save
" *after* we have already opened it. Super useful.
cnoremap w!! w !sudo tee % >/dev/null

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j

" Toggle paste
nnoremap <silent><f12> :set invpaste<CR>

" Window manipulation
nnoremap <leader>" :vsplit<CR>
nnoremap <leader>% :split<CR>
nnoremap <c-left> <c-w>h
nnoremap <c-down> <c-w>j
nnoremap <c-up> <c-w>k
nnoremap <c-right> <c-w>l

" Open a terminal
nnoremap <leader>e :vert terminal<CR>

" Move lines ala Sublime Text
if has('mac')
    nnoremap [B :m .+1<CR>==
    nnoremap [A :m .-2<CR>==
    inoremap [B <Esc>:m .+1<CR>==gi
    inoremap [A <Esc>:m .-2<CR>==gi
    vnoremap [B :m '>+1<CR>gv=gv
    vnoremap [A :m '<-2<CR>gv=gv
else
    nnoremap <A-down> :m .+1<CR>==
    nnoremap <A-up> :m .-2<CR>==
    inoremap <A-down> <Esc>:m .+1<CR>==gi
    inoremap <A-up> <Esc>:m .-2<CR>==gi
    vnoremap <A-down> :m '>+1<CR>gv=gv
    vnoremap <A-up> :m '<-2<CR>gv=gv
endif

" Remapped U for redo ctrl-r
nnoremap U <c-r>

" Cheats file
nnoremap <leader>ch :vs ~/.vim/cheats.md<CR>

" <<< PLUGINS CONFIGURATION >>>

" vim-vue
let g:vue_pre_processors = []

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'

" Supertab
" Reverse the reversed direction in completion
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "context"

" Auto-pairs
let g:AutoPairsShortcutFastWrap = '<C-e>'

" Gutentags
let g:gutentags_project_root = ['tags', '.git']
let g:gutentags_ctags_exclude = ['node_modules']
let g:gutentags_cscope_exclude = ['node_modules']
let g:gutentags_gtags_exclude = ['node_modules']

let mapleader = ","
let g:mapleader = ","

" Bdelete a buffer without closing Vim or window layout
nnoremap <silent><leader>d :Bdelete<cr>

" vim-mode
"
let g:move_key_modifier = 'C'


" Devdocs
"-------------------------------------------------------------------------------
augroup plugin-devdocs
    autocmd!
    autocmd FileType c,cpp,python,js,go nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END


" Asyncrun
"------------------------------------------------------------------------------
let g:asyncrun_open = 6
"MAKE"
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
"CMAKE"
nnoremap <silent> <F8> :AsyncRun -cwd=<root> cmake . <cr>
"Single file compilation"
nnoremap <silent> <F9> :AsyncRun clang++ -std=c++1z -stdlib=libc++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <F10> :call asyncrun#quickfix_toggle(10)<cr>


" FZF
"------------------------------------------------------------------------------
nnoremap <silent><leader>b :Buffers<cr>
nnoremap <silent><leader>A :Ag! <c-r><c-w><cr>
nnoremap <silent><leader>B :BTags<cr>
nnoremap <silent><leader>F :GFiles<cr>
nnoremap <silent><leader>L :Lines<cr>
" Find is defined on functions.vim
nnoremap <leader>r :Find <C-R><C-W><CR>
" nnoremap <silent><leader>S :Snippets<cr>
nnoremap <silent><leader>a :Ag <c-r><c-w><cr>
nnoremap <silent><leader>c :Commands<cr>
nnoremap <silent><leader>f :Files<cr>
nnoremap <silent><leader>h :Helptags<cr>
nnoremap <silent><leader>hh :History<cr>
nnoremap <silent><leader>l :BLines<cr>
nnoremap <silent><leader>m :Maps<cr>
nnoremap <silent><leader>ma :Marks<cr>
nnoremap <silent><leader>t :Tags<cr>
nnoremap <silent><leader>q :Quickfix<cr>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Similarly, we can apply it to fzf#vim#grep:
command! -bang -nargs=* Ag
            \ call fzf#vim#grep(
            \   'ag --column --line-number --no-heading --color '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)

" fzf_quickfix
" let g:fzf_quickfix_syntax_on = 0

" Vim-go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_info_mode = 'gopls'
let g:go_doc_popup_window = 1

" Does not open a window with GoLint output (good for having ALE)
let g:go_metalinter_autosave = 0

augroup Golang_mappings
    autocmd!
    autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
    autocmd FileType go nmap <Leader>gdd <Plug>(go-doc-browser)
    autocmd FileType go nmap <Leader>ge <Plug>(go-rename)
    autocmd FileType go nmap <Leader>gi <Plug>(go-info)
    autocmd FileType go nmap <Leader>gm <Plug>(go-implements)
    autocmd FileType go nmap <Leader>gr <Plug>(go-rename)
    autocmd FileType go nmap <Leader>gs <Plug>(go-def-split)
    autocmd FileType go nmap <Leader>gv <Plug>(go-def-vertical)
    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    autocmd FileType go nmap <leader>gc <Plug>(go-coverage)
    autocmd FileType go nmap <leader>gr <Plug>(go-run)
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
augroup END

"
" A (switch header/implementation)
"-------------------------------------------------------------------------------
nnoremap <silent><leader>H :A<CR>
nnoremap <silent><leader>HS :AS<CR>
nnoremap <silent><leader>HV :AV<CR>


" Vim-mundo
"-------------------------------------------------------------------------------
nnoremap <silent><leader>u :MundoToggle<cr>


" Python syntax
"-------------------------------------------------------------------------------
let g:python_highlight_all=1
let g:python_highlight_space_errors=0


" Markdown
"-------------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" Tagbar
"-------------------------------------------------------------------------------
nnoremap <leader>T :TagbarToggle<cr>

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" Illuminati
"-------------------------------------------------------------------------------
let g:Illuminate_ftblacklist = ['nerdtree']
let g:Illuminate_highlightUnderCursor = 0


" Vim-cool
"-------------------------------------------------------------------------------
let g:CoolTotalMatches = 1

" ALE
"-------------------------------------------------------------------------------

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

nnoremap <silent>gd :ALEGoToDefinition<cr>
nnoremap <silent>gD :ALEGoToDefinitionInVSplit<cr>
nnoremap <silent>gt :ALEGoToTypeDefinition<cr>
nnoremap <silent>gT :ALEGoToTypeDefinitionInVSplit<cr>
nnoremap <silent>gr :ALEFindReferences<cr>
nnoremap <silent>gn :ALENext<cr>
nnoremap <silent>gp :ALEPrevious<cr>

let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=None
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=None


let g:ale_close_preview_on_insert = 1
let g:ale_set_balloons = 1

" temp
let g:ale_virtualenv_dir_names = []

" Only run explicit linters
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Fixers
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'css': ['eslint'],
\   'html': ['eslint'],
\   'python': ['autopep8', 'black'],
\   'rust': ['rustfmt']
\}
let g:ale_fix_on_save = 1

" Aliases for Vue
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

" Linters
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'css': ['eslint'],
\   'html': ['eslint'],
\   'python': ['pylint', 'pyls'],
\   'vue': ['eslint', 'vls'],
\   'cpp': ['ccls'],
\   'c': ['ccls'],
\   'rust': ['cargo', 'rls', 'rustc'],
\   'go': ['gopls', 'gofmt', 'golint'],
\   'swift': ['sourcekitlsp']
\}

let g:ale_sourcekit_lsp_executable = "~/Repos/sourcekit-lsp/.build/x86_64-apple-macosx/debug/sourcekit-lsp"

let g:ale_lint_on_save = 1

let g:ale_pattern_options_enabled = 1
" Do not lint or fix minified files
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" <<< OWN FUNCTIONS >>>

" Deletes trailing whitespaces on save
"------------------------------------------------------------------------------
fun! <SID>StripTrailingWhitespaces()
    let l:saved_winview = winsaveview()
    " let l = line(".")
    " let c = col(".")
    keeppatterns %s/\s\+$//e
    call winrestview(l:saved_winview)
    " call cursor(l, c)
endfun
augroup AUGStripTrailWhiteSpaces
    autocmd! FileType * autocmd! BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END

" Return to last edit position when opening files (You want this!)
"------------------------------------------------------------------------------
augroup AUGReturnLastPosition
    autocmd! BufReadPost *
            \ if line("'\"-") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
augroup END

" Autosaving when leaving insert mode
"------------------------------------------------------------------------------
" autocmd! InsertLeave * if expand('%') != '' | update | endif

" Make preview window close when leaving insert mode
"------------------------------------------------------------------------------
augroup AUGPumVisible
    autocmd! CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup END

" HTML Config
"------------------------------------------------------------------------------
augroup AUGHTML
    autocmd! BufNewFile,BufReadPost *.html set filetype=html
    autocmd! FileType html set omnifunc=htmlcomplete#CompleteTags
augroup END

" cppreference (will open a browser with a search in www.cppreference.com)
"------------------------------------------------------------------------------
fun! CppRef()
    let s:keyword = expand("<cword>")
    let s:url = "http://en.cppreference.com/mwiki/index.php?title=Special:Search&search=std::" . s:keyword
    if s:url != ""
        silent exec "!open '".s:url."'"
    endif
    redraw!
endfun
nnoremap <leader>x :call CppRef()<CR>

" Auto Relative Numbers Toggle
"------------------------------------------------------------------------------
" augroup numbertoggle
"     autocmd!
"     autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
"     autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
" augroup END

" Ag integration
"-------------------------------------------------------------------------------

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('ag --column --numbers --noheading --fixed-strings --ignore-case --hidden --follow --ignore ".git/*" --color '.shellescape(<q-args>), 1, <bang>0)

if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
else
    set grepprg=grep\ -rn\ $*\ *
endif
set grepformat=%f:%l:%c:%m

" Clang-format
"-------------------------------------------------------------------------------
if executable('clang-format')
    function! ClangFormatOnSave()
        let l = line(".")
        let c = col(".")
        silent execute '%! clang-format'
        call cursor(l, c)
    endfunction
    autocmd! BufWritePre *.{h,hpp,hxx,c,cpp} call ClangFormatOnSave()
endif

" Yaml
"-------------------------------------------------------------------------------
augroup yaml-config
    autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
    autocmd! FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Smarter cursorline
"-------------------------------------------------------------------------------
augroup AUGCursorLine
    autocmd! InsertLeave,WinEnter * set cursorline
    autocmd! InsertEnter,WinLeave * set nocursorline
augroup END

"
"-------------------------------------------------------------------------------
" close if final buffer is netrw or the quickfix
augroup AUGFinalCountdown
 au!
 autocmd WinEnter * if winnr('$') == 1 &&
    \ getbufvar(winbufnr(winnr()), "&filetype") == "netrw" ||
    \ &buftype == 'quickfix' |q|endif
 "autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && \
    "\ b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
 nmap - :Lexplore<cr>
 "nmap - :NERDTreeToggle<cr>
augroup END


" <<< bbye >>>

if exists("g:loaded_bbye") || &cp | finish | endif
let g:loaded_bbye = 1

function! s:bdelete(action, bang, buffer_name)
	let buffer = s:str2bufnr(a:buffer_name)
	let w:bbye_back = 1

	if buffer < 0
		return s:error("E516: No buffers were deleted. No match for ".a:buffer_name)
	endif

	if getbufvar(buffer, "&modified") && empty(a:bang)
		let error = "E89: No write since last change for buffer "
		return s:error(error . buffer . " (add ! to override)")
	endif

	" If the buffer is set to[<0;79;14M[<0;79;14m delete and it contains changes, we can't switch
	" away from it. Hide it before eventual deleting:
	if getbufvar(buffer, "&modified") && !empty(a:bang)
		call setbufvar(buffer, "&bufhidden", "hide")
	endif

	" For cases where adding buffers causes new windows to appear or hiding some
	" causes windows to disappear and thereby decrement, loop backwards.
	for window in reverse(range(1, winnr("$")))
		" For invalid window numbers, winbufnr returns -1.
		if winbufnr(window) != buffer | continue | endif
		execute window . "wincmd w"

		" Bprevious also wraps around the buffer list, if necessary:
		try | exe bufnr("#") > 0 && buflisted(bufnr("#")) ? "buffer #" : "bprevious"
		catch /^Vim([^)]*):E85:/ " E85: There is no listed buffer
		endtry

		" If found a new buffer for this window, mission accomplished:
		if bufnr("%") != buffer | continue | endif

		call s:new(a:bang)
	endfor

	" Because tabbars and other appearing/disappearing windows change
	" the window numbers, find where we were manually:
	let back = filter(range(1, winnr("$")), "getwinvar(v:val, 'bbye_back')")[0]
	if back | exe back . "wincmd w" | unlet w:bbye_back | endif

	" If it hasn't been already deleted by &bufhidden, end its pains now.
	" Unless it previously was an unnamed buffer and :enew returned it again.
	"
	" Using buflisted() over bufexists() because bufhidden=delete causes the
	" buffer to still _exist_ even though it won't be :bdelete-able.
	if buflisted(buffer) && buffer != bufnr("%")
		exe a:action . a:bang . " " . buffer
	endif
endfunction

function! s:str2bufnr(buffer)
	if empty(a:buffer)
		return bufnr("%")
	elseif a:buffer =~# '^\d\+$'
		return bufnr(str2nr(a:buffer))
	else
		return bufnr(a:buffer)
	endif
endfunction

function! s:new(bang)
	exe "enew" . a:bang

	setl noswapfile
	" If empty and out of sight, delete it right away:
	setl bufhidden=wipe
	" Regular buftype warns people if they have unsaved text there.  Wouldn't
	" want to lose someone's data:
	setl buftype=
	" Hide the buffer from buffer explorers and tabbars:
	setl nobuflisted
endfunction

" Using the built-in :echoerr prints a stacktrace, which isn't that nice.
function! s:error(msg)
	echohl ErrorMsg
	echomsg a:msg
	echohl NONE
	let v:errmsg = a:msg
endfunction

command! -bang -complete=buffer -nargs=? Bdelete
	\ :call s:bdelete("bdelete", <q-bang>, <q-args>)

command! -bang -complete=buffer -nargs=? Bwipeout
	\ :call s:bdelete("bwipeout", <q-bang>, <q-args>)
