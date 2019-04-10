if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/bundle')
endif

if !has('mac')
    Plug 'KabbAmine/zeavim.vim'
endif
Plug 'rhysd/devdocs.vim'

" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Completion, task, etc
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-quickfix'
Plug 'skywind3000/asyncrun.vim'

" Javascript
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'

" C C++
Plug 'bfrg/vim-cpp-modern'
Plug 'deibit/a.vim'
Plug 'jansenm/vim-cmake'

" Python
Plug 'vim-python/python-syntax'

" Go
Plug 'fatih/vim-go'

" GUI
Plug 'RRethy/vim-illuminate'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'romainl/vim-cool'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'matze/vim-move'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Text Transformation
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Themes
Plug 'morhetz/gruvbox'

call plug#end()

source ~/.vim/startup/settings.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/configurations.vim
source ~/.vim/startup/functions.vim
source ~/.vim/startup/statusline.vim
