#!/bin/bash

set -e 

function command_t
{
    vim -c 'so%' -c 'q' -c 'q' command-t-1.4.vba
    cd $HOME/.vim/ruby/command-t
    $(whereis ruby | awk '{print $2}' | sed -n 's/\/usr\/bin\///p') extconf.rb
    make
}
function run_once
{
    if [ -f !d_ctags ];then
        vim_ide_packages
        sudo rm -rf /usr/bin/ctags
        sudo rm -rf /usr/bin/etags
        touch d_ctags
        sleep 20

    fi
}
function vim_ide_packages
{
    sudo apt-get install -y vim-gnome ruby-dev bash-completion python-pip 
    run_once
    sudo pip install dbgp vim-debug
    install-vim-debug.py
    cp -r ./* $HOME/.vim
    cp -r ./.vimrc $HOME
    sudo apt-get install -y exuberant-ctags
    echo "setting bashrc"
    cat git_prompt >> $HOME/.bashrc
    sleep 5
    source ~/.bashrc
   
}

echo -e "\t\t Installing Vim IDE."
vim_ide_packages
command_t
echo -e "\t\t Vim IDE Installed Successfully"
