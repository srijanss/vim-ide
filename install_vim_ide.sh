#!/bin/bash

set -e 


function vim_ide_packages
{
    apt-get install -y vim-gnome ruby-dev bash-completion 
    rm -rf /usr/bin/ctags
    rm -rf /usr/bin/etags
    sleep 20
    pip install dbgp vim-debug
    install-vim-debug.py
    cp -r ./* $HOME/.vim
    cp -r ./.vimrc $HOME
    apt-get install -y exuberant-ctags
    sed -i "$ aexport GIT_PS1_SHOWDIRTYSTATE=1" >> $HOME/.bashrc
    sed -i "$ aexport PS1='\[\033[0;34m\]\u@\w\[\033[0;32m\]$(__git_ps1)\[\033[0;34m\]\$\[\033[0m\] '" >> $HOME/.bashrc
   
}

if [ $USER != "root" ];then
    echo -e "\t\t Root privilege Required."
else
    echo -e "\t\t Installing Vim IDE."
    vim_ide_packages
fi

