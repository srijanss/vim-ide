#!/bin/bash

set -e 


function vim_ide_packages
{
    apt-get install -y vim-gnome ruby-dev bash-completion 
    rm -rf /usr/bin/ctags
    rm -rf /usr/bin/etags
    apt-get install -y exuberant-ctags
    pip install dbgp vim-debug
    install-vim-debug.py
    cp -r vim/* $HOME/.vim
    cp -r vim/.vimrc $HOME
   
}

if [ $USER != "root" ];then
    echo -e "\t\t Root privilege Required."
else
    echo -e "\t\t Installing Vim IDE."
    vim_ide_packages
fi

