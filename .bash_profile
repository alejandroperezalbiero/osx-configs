# Bridge for AVT
alias avt-bridge='ssh root@10.80.11.88 -i $HOME/.ssh/id_prod'
alias amazon='ssh aws-bridge'
alias ls='ls -GFh'
alias ll='ls -la'

source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true


parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export comm=
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced
 
BOLD="\[\033[1m\]"
OFF="\[\033[m\]"


reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
 
prompt_style=$reset_style$BOLD"\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\e[0;37m "
 
# command_style=$reset_style'\[\033[1;29m\]' # bold black 
command_style=$reset_style
 
# Prompt variable:
 
 
PS1="$status_style"'$fill \t\n'"$prompt_style$command_style"
 

PS2="${BOLD}>${OFF} "


#DATA HOSTED WITH ♥ BY PASTEBIN.COM - DOWNLOAD RAW - SEE ORIGINAL
############################################
 
# Modified from emilis bash prompt script
 
# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
 
#
 
# Modified for Mac OS X by
 
# @corndogcomputer
 
###########################################
# Fill with minuses
 
# (this is recalculated every time the prompt is shown in function prompt_command):
 
fill="--- "
 
 
 
# Reset color for command output
 
# (this one is invoked every time before a command is executed):
 
trap 'echo -ne "\033[00m"' DEBUG
 
 
function prompt_command {
 
 
# create a $fill of all screen width minus the time string and a space:
 
let fillsize=${COLUMNS}-9
 
fill=""
 
while [ "$fillsize" -gt "0" ]
 
do
 
fill="-${fill}" # fill with underscores to work on
 
let fillsize=${fillsize}-1
 
done
 
 
# If this is an xterm set the title to user@host:dir
 
case "$TERM" in
 
xterm*|rxvt*)
 
bname=`basename "${PWD/$HOME/~}"`
 
echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
 
;;
 
*)
 
;;
 
esac
 
 
}
 
PROMPT_COMMAND=prompt_command


