" Goto the last edited file with backspace
nnoremap <BS> <C-^>

" Leader
let mapleader = ","
let g:mapleader = ","

" Non-english keyboard tag navigation fix
nnoremap <silent><leader>g <c-]>

" Fast escape
inoremap jj <ESC>

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
nnoremap <leader>w :w<cr>

" Buffer unload
nnoremap <silent><leader>uu :bd<cr>

" Copy-paste Windows fashioned
inoremap <c-v> <esc>"*P}i
vnoremap <c-c> "*y<esc>

" Moving through wrapped lines
nnoremap j gj
nnoremap k gk

" Use tab and s-tab for indenting blocks in Visual Mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

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
nnoremap <silent><f12> :set invpaste<CR>

" Update plugins
nnoremap <silent><f11> :PlugUpdate<cr>

" Window manipulation
nnoremap <leader>" :vsplit<CR>
nnoremap <leader>% :split<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Replace this and next with .
" Press 2n to skip and n to move to the next one
nnoremap <leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" Fast search!
nnoremap <space> /

" Remapped U for redo ctrl-r
nnoremap U <c-r>

" Cheats file
nnoremap <leader>ch :vs ~/.vim/cheats.md<CR>
