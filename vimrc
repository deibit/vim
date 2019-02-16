if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/bundle')
endif

if !has('mac')
    Plug 'KabbAmine/zeavim.vim'
endif

" Golang
Plug 'fatih/vim-go'

" Javascript
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'elzr/vim-json'
" Plug 'othree/yajs.vim'

" Python
Plug 'hdima/python-syntax'

" C / C++
" YouCompleteMe
" https://github.com/Valloric/YouCompleteMe
Plug 'Valloric/YouCompleteMe'
" https://github.com/jansenm/vim-cmake
Plug 'jansenm/vim-cmake'
Plug 'bfrg/vim-cpp-modern'
" Change between header and implementation
Plug 'deibit/a.vim'
" Tags
" Plug 'ludovicchabant/vim-gutentags'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Better bookmarks
Plug 'MattesGroeger/vim-bookmarks'
" Better integration with tmux
" Plug 'christoomey/vim-tmux-navigator'
" Better undo
Plug 'mbbill/undotree'
" Async works
" https://github.com/skywind3000/asyncrun.vim
Plug 'skywind3000/asyncrun.vim'
" Visually remark word under cursor
Plug 'RRethy/vim-illuminate'
" Devdocs
" https://github.com/rhysd/devdocs.vim
Plug 'rhysd/devdocs.vim'
" AutoPairs
Plug 'jiangmiao/auto-pairs'
" Sneak
" https://github.com/justinmk/vim-sneak
Plug 'justinmk/vim-sneak'
" NERDtree
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
" NERDtree git plugin
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" EasyAlign
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Themes
Plug 'morhetz/gruvbox'

call plug#end()

source ~/.vim/startup/settings.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/configurations.vim
source ~/.vim/startup/statusline.vim
source ~/.vim/startup/functions.vim
