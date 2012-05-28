# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
shopt -s cdspell

export PATH=$PATH:/home/wuyajun/bin

export PS1="[\u@\h][\e[0;34m\w\e[m][\d][\e[0;31m\t\e[m]\$\n"
#export PS1="[\u@\h][\e[0;34m\w\e[m][\e[0;31m\t\e[m]\$\n"
export PS2="continue-> "

export SVN_EDITOR=vim
export SVNROOT=svn://rdcm.ci-g.com/sw

# User specific aliases and functions
alias la="ls -a | sort"
alias vnc="vncserver -geometry 1200x920"
alias fin="find . -type f -name "
alias gvim='gvim -c "call Maximize_Window()" ' 
alias svndiff="svn diff | grep +++ | awk '{print \$2}' | xargs gvim"
alias linuxs="sudo mount.cifs -o username=CAMBRIDGEIG/wuyajun //172.20.1.61/linuxs /home/wuyajun/mnt/linuxs"

alias ..="cd .."  
alias ...="cd ../.."  
alias ....="cd ../../.."  
alias .....="cd ../../../.."  
alias ......="cd ../../../../.."

