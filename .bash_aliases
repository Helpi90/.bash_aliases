
#######################################
##      Aliases Directory            ##
#######################################
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias gohome="cd ~"
alias helpi="cd /home/helpi"
alias pi="cd /home/pi"
#######################################
##      GitHub commandos             ##
#######################################
alias gp='git pull'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

gsend () {
    git commit -am "$1" && git push
}

#######################################
##      Setup commandos      ##
#######################################
alias update="sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove -y "
alias auto='sudo apt-get autoremove -y'
alias upgrade='sudo apt dist-upgrade -y'
alias pi-up="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo rpi-update && sudo apt-get autoclean && sudo apt-get autoremove"
# edit this file
alias editbash="nano $HOME/.bash_aliases"
# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
  alias reboot='sudo reboot'
  alias nano='sudo nano'
  alias vi='sudo nano'
  alias edit='sudo nano'
  alias apt-get='sudo apt-get'
  alias update='sudo apt-get update && sudo apt-get upgrade'
  alias aptitude='sudo apt-get'
  alias service='sudo service'
  alias 7="chmod 777 -R ."
alias s7="sudo chmod 777 -R ."

fi
function ps? () {
        echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND"
        ps aux | grep $1
}
# Gibt die Größen der Ordner an
alias getsize="sudo /scripts/getbackupsize.sh $1"
alias ping='ping -c 8'
#######################################
## Find
#######################################
alias findall="find . -name "*lua*" -type f -exec du -ch {} + | grep $1"
#######################################
##      LS commandos         ##
#######################################
# show hidden files only
# print the last ten modified files in the specified directory
function last {
    ls -lt $1 | head
}
alias lstree='ls -R | grep ":$" | sed -e '"'"'s/:$//'"'"' \
                -e '"'"'s/[^-][^\/]*\//--/g'"'"' -e '"'"'s/^/   /'"'"' \
                -e '"'"'s/-/|/'"'"''
alias ls.='ls -d .* --color=auto'

# show extra options
alias dir='ls -alv'

# go to directory and execute 'ls'
function cdl() {
    if [ "$*" = "" ]
    then
        cd
    else
        cd "$*";
    fi
        dir;
}
alias ls="ls --color -h --group-directories-first -I '*.pyc' -I '__*__'"
alias ll='ls -alF'
alias l="ls -l"
alias lszeigen="ls -lh" # Dateien + Rechte + Größe
alias llab='ls -laFh --time-style="+%d-%m-%y"'
showHome() {
    ls -ls $HOME
}
# show extra options
alias dir='ls -alv'
#######################################
##                Docker             ##
#######################################

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

alias dops="docker ps -a"
alias dop="docker ps"
alias doi="docker images"
alias doirm='docker rmi $(docker images -q)'
alias dost='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias doc='docker-compose'
function docker-clean() {
  docker rmi -f $(docker images -q -a -f dangling=true)
}
# Stop all containers
docker-stop-all() { docker stop $(docker ps -a -q); }
alias dstopall=docker-stop-all
alias dockps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
#######################################
##      tar commandos        ##
#######################################
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ./$1    ;;
          *.tar.gz)    tar xvzf ./$1    ;;
          *.tar.xz)    tar xvJf ./$1    ;;
          *.lzma)      unlzma ./$1      ;;
          *.bz2)       bunzip2 ./$1     ;;
          *.rar)       unrar x -ad ./$1 ;;
          *.gz)        gunzip ./$1      ;;
          *.tar)       tar xvf ./$1     ;;
          *.tbz2)      tar xvjf ./$1    ;;
          *.tgz)       tar xvzf ./$1    ;;
          *.zip)       unzip ./$1       ;;
          *.Z)         uncompress ./$1  ;;
          *.7z)        7z x ./$1        ;;
          *.xz)        unxz ./$1        ;;
          *.exe)       cabextract ./$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}
#######################################
##      Zip commandos        ##
#######################################
# One COMPRESS method to rule them all
# examples: $ compress <file.tar> <./path>
# ___________________________________________________________________
compress() {
  if [[ -n "$1" ]]; then
    FILE=$1
    case $FILE in
      *.tar ) shift && tar cf $FILE $* ;;
      *.tar.bz2 ) shift && tar cjf $FILE $* ;;
      *.tar.gz ) shift && tar czf $FILE $* ;;
      *.tgz ) shift && tar czf $FILE $* ;;
      *.zip ) shift && zip $FILE $* ;;
      *.rar ) shift && rar $FILE $* ;;
    esac
  else
    echo "Usage: compress <foo.tar.gz> ./foo ./bar"
  fi
}
alias makezip="/usr/bin/zip -rq "  # /usr/bin/zip -rq /backup/test_`date "+%Y-%m-%d"`.zip ./
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
mkcd () {
    mkdir -pv -p "$@" && cd $_
}

#######################################
##      Borg-Backup          ##
#######################################
alias borg_check="sudo borg check" # borg check /pfad/zum/repo
alias borg_list="sudo borg list" # borg list /pfad/zum/repo
alias borg_mount="sudo borg mount" # borg mount /pfad/zum/repo /mnt/repo
alias borg_prune="sudo borg prune –dry-run –keep-daily=7 –keep-weekly=4" # + /pfad/zum/repo
alias borg_info="sudo borg info" # borg info /pfad/zum/repo::ARCHIV
#######################################
##      Grep commandos       ##
#######################################
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#######################################
##      System       ##
#######################################
# skript         Erstellt eine Datei, führt chmod +x aus und öffnet nano
newScript()
{
        title=$1
        title=${title// /_}
        # Add .sh to the end of the title if it is not there already.
        [ "${title: -3}" != '.sh' ] && title=${title}.sh
        if [ -a $title ];
        then
          nano $title
        else
          touch $title
          echo "#!/bin/bash" > $title
          echo "# Datum : $(date +%Y-%m-%d)" > $title
          echo
          chmod +x $title
          nano $title
        fi
}
alias exe='chmod +x'
rechte()
{
  sudo chmod -cR $1 ~/.
  sudo chmod -cR $1 /var/log/
}

alias gping='ping google.com -c 1'
#copy and go to dir
cpg (){
  if [ -d "$2" ];then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

#move and go to dir
mvg (){
  if [ -d "$2" ];then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}
# git clone https://github.com/martialblog/cheatsheet.git ~/.cheat.d
alias cheatpy="python3 ~/.cheat.d/cheat/cheat.py"
alias mkdir="mkdir -p"
alias wget="wget -c"
alias mv="mv -i"
alias rd="rmdir"
alias remac='ifdown wlan0 && sleep 3 && macchanger -r wlan0 && sleep 3 && ifup wlan0'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
#######################################
##      Openhab      ##
#######################################
alias logoh="tail -f /opt/openhab/userdata/logs/openhab.log -f /opt/openhab/userdata/logs/events.log"
alias logohrule="tail -f /opt/openhab/userdata/logs/rules.log"
alias rroh="docker restart openhab"
alias ohrefresh="docker stop openhab && docker rm openhab && /docker/containers/openhab/custom/openhabdocker"
alias ohexec="docker exec -it openhab bash"
#######################################
##      Netzwerk commandos        ##
#######################################
alias pingg='ping 192.168.2.$1'
#######################################
##      Cat commandos        ##
#######################################
alias ali="cat /home/$USER/.bash_aliases | grep '^alias' | sed 's/alias //g' | grep -e '^[^=]*' "

# IsNewer 1 als 2
IsNewer() {
     if [ $# -ne 2 ]; then
          echo "Usage: IsNewer file1 file2" 1>&2
          exit 1
     fi

     if [ ! -f $1 -o ! -f $2 ]; then
          return 1       # No
     fi

     if [ -n "`find $1 -newer $2 -print`" ]; then
          return 0       # Yes
     else
          return 1       # No
     fi
}
# find something in the current directory
function llfind { ll -A -h | grep -i $1; }
# #find something in chosen directory
function cdllfind { cd $1 && ll -A -h | grep -i $2; }
#----------------------------------------------------------------------
#   SSH Copy
#----------------------------------------------------------------------
#Back Up and date
#scp -r Quelldatei.bsp Benutzer@Host:Verzeichnis/Zieldatei.bsp
function sshcopy() {
  scp -r $1 $2;
}
#######################################
##      Copy         ##
#######################################
#Back Up and date
function bkdate() {
  cp $1 $1.`date +%Y%m%d`;
}
alias cp="cp -arv"

function ck {
    # colors
    c1=256
    c2=117
    color_alternation=true
    PIDS=$(ps aux | grep $1  | grep -v "grep" | awk '{print $2}')
    printf "%-25s %-25s %-25s %-25s %-25s %-25s\n" "PID" "PROCESSO" "%CPU" "MEM" "RUN TIME" "PATH"
    for pid in $PIDS
    do
        path="$(pwdx $pid | awk '{print $2}')/$(ps aux | grep -v "grep" | grep " $pid " | awk '{print $NF}')"
        process=$(echo $path | sed -e 's/.*\///g')
        runing_time=$(ps -p $pid -o etime=)
        cpu_usage=$(ps aux | grep " $pid " | grep -v "grep" | awk  '{print $3}' )
        #mem_usage=$(ps aux | grep $pid | grep -v "grep" | awk  '{print $4}' )
        mem_usage=$(ps aux | grep " $pid " | awk '{sum+=$6} END {print sum / 1024}')

        if [[ $path =~ /home/sefaz/ror.*$ ]]; then
            process=$(echo $path | sed -e 's/.*\/ror\///g' | sed -e 's/\/.*//g')
        fi
        if $color_alternation; then
            printf "$(tput setaf $c2)%-25s %-25s %-25s %-25s %-25s %-25s$(tput sgr0)\n" $pid $process $cpu_usage $(printf '%.0f' $mem_usage) $runing_time $path
            color_alternation=false
        else
            printf "$(tput setaf $c1)%-25s %-25s %-25s %-25s %-25s %-25s$(tput sgr0)\n" $pid $process $cpu_usage $(printf '%.0f' $mem_usage) $runing_time $path
            color_alternation=true
        fi
    done
}

#----------------------------------------------------------------------
#   NEU 26,10,2017
#----------------------------------------------------------------------
alias checkmm="npm run config:check"
##------------------------------------------------------------------------
##    NEU 24.04.2018
##------------------------------------------------------------------------
function backupfile()
{
    backupnr=1
    file=$1

    ### Alle Variablen einlesen und letzte Backupdateinummer herausfinden ##
    set -- $1.backup-???
    lastname=${!#}
    backupnr=${lastname##*backup-}
    backupnr=${backupnr%%.*}
    backupnr=${backupnr//\?/0}

    ### Backupdateinummer automatisch um +1 bis maximal 30 erhoehen ##
    if [ "$[backupnr++]" -ge 30 ]; then
            echo "test"
    fi

    backupnr=000${backupnr}
    backupnr=${backupnr: -3}
    filename=backup-${backupnr}
    backupfile=$(echo  $file.$filename)

    # Backupdatei erstellen
    cp $file $backupfile
}
