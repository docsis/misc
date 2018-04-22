# .bashrc


function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
shopt -s cdspell

export TEXMF=/usr/share/texmf


#export PS1="[\u@\h][\e[1;34m\w\e[m][\e[1;31m\t\e[m] ~ ->\n"
#export PS1="[\u@\h][\e[0;34m\w\e[m][\e[0;31m\t\e[m]\$\n"
export PS1='`a=$?;if [[ $a -ne 0 ]]; then echo -ne "[\e[1;41m\u\e[m\e[1;32m"; else echo -ne "[\e[1;31m\u\e[m\e[1;32m"; fi`@\e[m\e[1;35m\h\e[m][\e[1;34m\w\e[m][\e[1;31m\A\e[m] ~ ->\n'
export PS2="continue-> "

export SVN_EDITOR=vim

# User specific aliases and functions
alias la="ls -a | sort"
alias vnc="vncserver -geometry 1200x920"
alias fin="find . -type f -name "
alias gvim='gvim -c "call Maximize_Window()" ' 
alias svndiff="svn diff | grep +++ "
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias ll="ls -la --color=always"
alias tree="tree --charset ascii"
alias mrxvt='mrxvt -stt -sl 65535'
alias vnc='vncserver -geometry 1280x1024'


alias ..="cd .."  
alias ...="cd ../.."  
alias ....="cd ../../.."  
alias .....="cd ../../../.."  
alias ......="cd ../../../../.."

if [ `uname` == "Darwin" ]; then
	export CLICOLOR=1
	export TERM=xterm-color
	export LSCOLORS=exfxcxdxbxegedabagacad
fi

export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

