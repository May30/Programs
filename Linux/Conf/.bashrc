PATH=$PATH:~/bin

SCALA_HOME=/usr/local/scala/scala-2.11.8
export SCALA_HOME
PATH=$PATH:$SCALA_HOME/bin

PATH=$PATH:~/ext_software/activator-dist-1.3.7

alias vi=vim
alias ls='ls --color'
alias l='ls -lh --color'
alias pstree="pstree -pla $USER"
alias grep='grep --color'

# avoid tmux change vim colors
alias tmux="tmux -2"
TERM="screen-256color-bce"

# Disable Ctrl-S ctrl-Q in terminals:
stty -ixon

if [ $TERM != "dumb" ] #if run via cron, ignore this block
then
	# Terminal formatting
	# make mounted directories look better
	export LS_COLORS="$LS_COLORS:ow=01;32:di=01;94";
	set completion-ignore-case on

	# prompt
	bold=$(tput bold)
	blue=$(tput setaf 4)
	magenta=$(tput setaf 5)
	none=$(tput sgr0)
	PS1='\[$bold\]\[$blue\]\h:\[$magenta\]\w\[$none\]\$ '
fi
