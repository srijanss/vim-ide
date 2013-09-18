#!/bin/bash

#set -e 
deleted=`pwd`/d_ctags

function run_once
{
    if [ -f !d_ctags ];then
        rm -rf /usr/bin/ctags
        rm -rf /usr/bin/etags
        touch d_ctags
        sleep 20
    fi
}
function vim_ide_packages
{
    apt-get install -y vim-gnome ruby-dev bash-completion 
    run_once
    
    pip install dbgp vim-debug
    install-vim-debug.py
    cp -r ./* $HOME/.vim
    cp -r ./.vimrc $HOME
    apt-get install -y exuberant-ctags
    sleep 5
    echo "setting bashrc"
    cat git_prompt >> $HOME/.bashrc
    sleep 5
    source ~/.bashrc
   
}

if [ $USER != "root" ];then
    echo -e "\t\t Root privilege Required."
else
    echo -e "\t\t Installing Vim IDE."
    vim_ide_packages
fi

