#?	            _                            _     
#?	           | |                          ( )    
#?	  __ _   __| | _ __    __ _  _ __    ___|/ ___ 
#?	 / _` | / _` || '_ \  / _` || '_ \  / _ \ / __|
#?	| (_| || (_| || | | || (_| || | | ||  __/ \__ \
#?	 \__,_| \__,_||_| |_| \__,_||_| |_| \___| |___/
#?	     _         _     __  _  _            
#?	    | |       | |   / _|(_)| |           
#?	  __| |  ___  | |_ | |_  _ | |  ___  ___ 
#?	 / _` | / _ \ | __||  _|| || | / _ \/ __|
#?	| (_| || (_) || |_ | |  | || ||  __/\__ \
#?	 \__,_| \___/  \__||_|  |_||_| \___||___/
#?
#?  Last Updated : 06/07/2021

#	Imports functions from 
if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi

#	Checks if the interactive flag is set.
[[ $- != *i* ]] && return	


#	Uses .bash_aliases for aliases.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#	Auto-completion functions.
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion	


#	Changes the window title of X terminals.
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac


#	?	Terminal-specific color customizations (unchanged, by default in Manjaro)
use_color=true
# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true
if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi
	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi
	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi
unset use_color safe_term match_lhs sh


# Shell settings (shopt)
shopt -s cdspell			#Autocorrects cd.
shopt -s dirspell			#Autocorrects dir.
shopt -s checkwinsize		#Checks the window size after each command.
shopt -s cmdhist			#Counts multiple line commands as one command.
shopt -s expand_aliases
shopt -s histappend			#History appending instead of overwriting.
shopt -s no_empty_cmd_completion	#Prevents autocompletion when nothing is entered.
shopt -s nocaseglob			#Matches filenames in a case-insensitive way.
