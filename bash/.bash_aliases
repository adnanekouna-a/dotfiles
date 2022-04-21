#!/bin/bash
#	            _                            _     
#	           | |                          ( )    
#	  __ _   __| | _ __    __ _  _ __    ___|/ ___ 
#	 / _` | / _` || '_ \  / _` || '_ \  / _ \ / __|
#	| (_| || (_| || | | || (_| || | | ||  __/ \__ \
#	 \__,_| \__,_||_| |_| \__,_||_| |_| \___| |___/
#	     _         _     __  _  _            
#	    | |       | |   / _|(_)| |           
#	  __| |  ___  | |_ | |_  _ | |  ___  ___ 
#	 / _` | / _ \ | __||  _|| || | / _ \/ __|
#	| (_| || (_) || |_ | |  | || ||  __/\__ \
#	 \__,_| \___/  \__||_|  |_||_| \___||___/
#
#  Last Updated : 21/04/2022

# Confirmation requirement
alias cp="cp -i"						# Requires confirmation before overwriting a file.
alias rm="rm -i"						# Requires confirmation before deleting a file.
alias mv="mv -i"						# Requires confirmation before moving a file.

# Frequently used shortcuts
alias ..="cd .."
alias ls="exa"
alias ll="ls -lv --group-directories-first"	      # Directories first + alphanumeric sorting.
alias lr="ls -R"							                    # Recursive ls.
alias la="exa -la"							                    # Shows hidden files.
alias mkdir="mkdir -p"											# Create parent directory first, if it doesn't exist. 

# Disk managing readability
alias df="df -kTh"						# Human-readable sizes + disk type.
alias du="du -kh"						  # Human-readable sizes.
alias free="free -m"					# Shows sizes in MB.


alias np="nano -w PKGBUILD"				# Opens the "PKGBUILD" in Nano.
alias more=less							      # Combines more and less
