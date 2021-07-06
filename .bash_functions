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

# Archive extractor
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Creates ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Gets IP adress on ethernet.
function my_ip() {
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

# Executes the commands "cd" and "ls" simultaneously
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# Simple calculator 
calc() {
    echo "scale=3;$@" | bc -l
}
