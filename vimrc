if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/bundle')
endif

if !has('mac')
    Plug 'KabbAmine/zeavim.vim'
endif

" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'elzr/vim-json'
" Plug 'othree/yajs.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/ListToggle'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'RRethy/vim-illuminate'
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'bfrg/vim-cpp-modern'
Plug 'deibit/a.vim'
Plug 'fatih/vim-go'
Plug 'hdima/python-syntax'
Plug 'honza/vim-snippets'
Plug 'jansenm/vim-cmake'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'rhysd/devdocs.vim'
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

call plug#end()

source ~/.vim/startup/settings.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/configurations.vim
source ~/.vim/startup/functions.vim
source ~/.vim/startup/statusline.vim
