#! /bin/sh


$DOTFILES=`pwd`

# checkout other things
git clone git@github.com:sorin-ionescu/prezto.git ~/.zprezto

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
ln -s $DOTFILES/.gitignore_global ~/.gitignore_global
ln -s $DOTFILES/.inputrc ~/.inputrc
ln -s $DOTFILES/.tmux ~/.tmux
ln -s $DOTFILES/.tmux.conf ~/.tmux.conf

# copy things
cp $DOTFILES/.gitconfig ~/.gitconfig
echo "github key must be manually set in ~/.gitconfig"
