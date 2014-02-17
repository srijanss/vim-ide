#!/bin/bash
#VIM installation script for Ubuntu
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
        sudo rm -rf /usr/bin/ctags
        sudo rm -rf /usr/bin/etags
        touch d_ctags
        sleep 20
        vim_ide_packages
    else
        exit 0
    fi
}
function vim_ide_packages
{
    sudo apt-get install -y vim-gnome ruby-dev bash-completion python-pip exuberant-ctags
    sudo pip install dbgp vim-debug
    install-vim-debug.py
    config_rc_files
}
function config_rc_files
{
    cp -r ./* $HOME/.vim
    cp -r ./.vimrc $HOME
    echo "setting bashrc"
    cat git_prompt >> $HOME/.bashrc
    sleep 5
    source ~/.bashrc
    command_t
   
}

echo -e "\t\t Installing Vim IDE."
run_once
echo -e "\t\t Vim IDE Installed Successfully"
