#
# ~/.bashrc
#
#needed for __git_ps1 to work
source /usr/share/git/completion/git-prompt.sh
export PATH=/home/srijan/bin:$PATH
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias pitstop='cd $HOME/xp-dev/adminweb'
alias kiosk='cd $HOME/xp-dev/kiosk'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias gitdiff='git diff --color'

#PS1='[\u@\h \W]\$ '

#commandLine prompt 
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[0;94m\]\u@\w\[\033[0;32m\]$(__git_ps1)\[\033[0;94m\]\$\[\033[0m\] '

#Virtualenvironment related
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
alias grep='grep --color'

#autocompletion when using sudo 
complete -cf sudo
