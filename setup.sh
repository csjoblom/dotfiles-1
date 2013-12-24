#! /bin/sh


$DOTFILES=`pwd`

mkdir -p ~/.vim/bundle/

# checkout other things
git clone git@github.com:sorin-ionescu/prezto.git ~/.zprezto
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# setup symlinks
ln -s $DOTFILES/.vimrc ~/.vimrc
ln -s $DOTFILES/.zshrc ~/.zshrc
ln -s $DOTFILES/.zpreztorc ~/.zprestorc
ln -s $DOTFILES/.zprofile ~/.zprofile
ln -s $DOTFILES/.zshenv ~/.zshenv
ln -s $DOTFILES/.zsh ~/.zsh
ln -s $DOTFILES/.zlogin ~/.zlogin
ln -s $DOTFILES/.zlogout ~/.zlogout
ln -s $DOTFILES/.zsh/themes/prompt_agnoster_setup ~/.zprezto/modules/prompt/functions/prompt_agnoster_setup
ln -s $DOTFILES/.agrc ~/.agrc
ln -s $DOTFILES/.ackrc ~/.ackrc
ln -s $DOTFILES/.jshintrc ~/.jshintrc
ln -s $DOTFILES/.gitignore_global ~/.gitignore_global
ln -s $DOTFILES/.inputrc ~/.inputrc
ln -s $DOTFILES/.tmux ~/.tmux
ln -s $DOTFILES/.tmux.conf ~/.tmux.conf

# copy things
cp $DOTFILES/.gitconfig ~/.gitconfig
echo "github key must be manually set in ~/.gitconfig"

# install bundle stuff
# vim +BundleInstall +qall
# need to update .vimrc for different os's

# need to install ack/ag/node/python and virtualenv/virtualenvwrapper/ipython

# compile bundle stuff
# TODO: this, obviously
