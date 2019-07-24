if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/bundle')
endif

if !has('mac')
    Plug 'KabbAmine/zeavim.vim'
endif
Plug 'rhysd/devdocs.vim'

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Completion, task, etc

Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-quickfix'
" Plug 'andymass/vim-matchup'

" Tag management
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/vim-preview'
Plug 'majutsushi/tagbar'

" Javascript
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'posva/vim-vue'

" C C++
Plug 'bfrg/vim-cpp-modern'
Plug 'deibit/a.vim'
Plug 'jansenm/vim-cmake'

" Python
Plug 'vim-python/python-syntax'

" Rust
Plug 'rust-lang/rust.vim'

" Go
" Plug 'fatih/vim-go'

" GUI
Plug 'RRethy/vim-illuminate'
Plug 'mbbill/undotree'
Plug 'romainl/vim-cool'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'matze/vim-move'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'airblade/vim-gitgutter'
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

" Themes
Plug 'morhetz/gruvbox'

call plug#end()

"~/.vim/plugin/settings.vim         Vim settings
"~/.vim/plugin/mappings.vim         Mappings (not plugins)
"~/.vim/plugin/configurations.vim   Plugin configuration and mappings
"~/.vim/plugin/functions.vim        Custom functions and autocommands
"~/.vim/plugin/statusline.vim       Statusline
"~/.vim/plugin/bbye.vim             Bdelete and Bwipeout buffer
