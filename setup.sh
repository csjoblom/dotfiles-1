#! /bin/sh

DOTFILES=`pwd`

mkdir -p ~/.vim/bundle/

# checkout other things
git clone git@github.com:sorin-ionescu/prezto.git ~/.zprezto
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# setup symlinks
ln -s -f $DOTFILES/.vimrc ~/.vimrc
ln -s -f $DOTFILES/.zshrc ~/.zshrc
ln -s -f $DOTFILES/.zpreztorc ~/.zprestorc
ln -s -f $DOTFILES/.zprofile ~/.zprofile
ln -s -f $DOTFILES/.zshenv ~/.zshenv
ln -s -f $DOTFILES/.zsh ~/.zsh
ln -s -f $DOTFILES/.zlogin ~/.zlogin
ln -s -f $DOTFILES/.zlogout ~/.zlogout
ln -s -f $DOTFILES/.agrc ~/.agrc
ln -s -f $DOTFILES/.ackrc ~/.ackrc
ln -s -f $DOTFILES/.jshintrc ~/.jshintrc
ln -s -f $DOTFILES/.gitignore_global ~/.gitignore_global
ln -s -f $DOTFILES/.inputrc ~/.inputrc
ln -s -f $DOTFILES/.tmux ~/.tmux
ln -s -f $DOTFILES/.tmux.conf ~/.tmux.conf

# copy things
# cp $DOTFILES/.gitconfig ~/.gitconfig
# echo "github key must be manually set in ~/.gitconfig"

# install bundle stuff
# vim +BundleInstall +qall
# need to update .vimrc for different os's

# need to install ack/ag/node/python and virtualenv/virtualenvwrapper/ipython

# compile bundle stuff
# TODO: this, obviously
