# Since Vim 7.4 and above the $HOME/.vimrc can be used as $HOME/.vim/vimrc
# which is a more portable solution
# execute from $HOME/vim when you are done with git clone
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#Neovim
#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

