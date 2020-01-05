nmap <c-s> :w<cr>
"Goto the last edited file with backspace
nnoremap <BS> <C-^>

" Leader
let mapleader = ","
let g:mapleader = ","

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

" Fast search!
nnoremap <space> /

" Remapped U for redo ctrl-r
nnoremap U <c-r>

" Cheats file
nnoremap <leader>ch :vs ~/.vim/cheats.md<CR>
