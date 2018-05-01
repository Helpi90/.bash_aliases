#
# Filename:          update_aliases
# Author:            Helpi
# Date:              2018-04-30
# Version:           1.0
# -----
# Last Modified:
# Modified By:
#
#
# Backupnr #
backupnr=1
host="$(hostname)"
DIR="$(realpath .)"
# Download new bash_aliases #
curl https://raw.githubusercontent.com/Defjam121/.bash_aliases/master/.bash_aliases > $DIR/.newAliases
file=".bash_aliases"
if [ ! -f $DIR/$file 1>&2 ]
then
    touch $DIR/$file
    source $DIR/.bashrc
fi
filedir="$(cat $DIR/$file | wc -l)"
filenew="$(cat $DIR/.newAliases | wc -l)"
customaliases="$DIR/._bash_aliases"
filecustom="$(cat $customaliases | wc -l)"
filedir=$(($filedir - $filecustom))
date=$(date +%Y-%m-%d)

echo "#########################################################"  >> /var/log/bash_aliases
echo $date >> /var/log/bash_aliases
echo "#########################################################"  >> /var/log/bash_aliases
echo $filedir  >> /var/log/bash_aliases
echo $filenew  >> /var/log/bash_aliases

if [ ! -f $customaliases 1>&2 ]
then
    touch $customaliases
    echo "#################################" >> $customaliases
    echo "## Aliaszusatz von"  >> $customaliases
    echo "## $host" >> $customaliases
    echo "#################################" >> $customaliases
    echo "._bash_aliases wurde erstellt für " >> /var/log/bash_aliases
    echo $host >>  /var/log/bash_aliases
fi

# Prüfe ob unterschiedliche Zeilenanzahlen sind #
if [ $filenew -eq $filedir ]
then
    echo "Dateien sind gleich" >> /var/log/bash_aliases
else
    # Backupdatei erstellen
    set -- .bash_aliases.backup-$date'_'???
    lastname=${!#}
    backupnr=${lastname##*backup-$date'_'}
    backupnr=${backupnr%%.*}
    backupnr=${backupnr//\?/0}

    ### Backupdateinummer automatisch um +1 bis maximal 30 erhoehen ##
    if [ "$[backupnr++]" -ge 30 ]; then
            echo "test"
    fi
    backupnr=000${backupnr}
    backupnr=${backupnr: -3}

    if [ $backupnr -gt 001 ]
    then
        backupnr=$(($backupnr))
        backupnr=00${backupnr}
        filename=backup-$date'_'${backupnr}
        backupfile=$(echo  $file.$filename)
    else
        filename=backup-$date
        backupfile=$(echo  $file.$filename)
    fi
        cp $DIR/.bash_aliases $DIR/$backupfile
        cp $DIR/.newAliases $DIR/.bash_aliases
        cat $customaliases >> $DIR/.bash_aliases
        rm $DIR/.newAliases
        find $DIR/.bash_aliases.backup-* -mtime +5 -exec echo {}>> /var/log/bash_aliases \;
        find $DIR/.bash_aliases.backup-* -mtime +5 -exec rm {}>> /var/log/bash_aliases \;
        echo "bash_aliases wurde geändert"  >> /var/log/bash_aliases
        source $DIR/.bash_aliases
fi
#
# Filename:          update_aliases
# Author:            Helpi
# Date:              2018-04-30
# Version:           1.0
# -----
# Last Modified:
# Modified By:
#
#
# Backupnr #
backupnr=1
host="$(hostname)"
DIR="$(realpath .)"
# Download new bash_aliases #
curl https://raw.githubusercontent.com/Defjam121/.bash_aliases/master/.bash_aliases > $DIR/.newAliases
file=".bash_aliases"
if [ ! -f $DIR/$file 1>&2 ]
then
    touch $DIR/$file
    source $DIR/.bashrc
fi
filedir="$(cat $DIR/$file | wc -l)"
filenew="$(cat $DIR/.newAliases | wc -l)"
customaliases="$DIR/._bash_aliases"
filecustom="$(cat $customaliases | wc -l)"
filedir=$(($filedir - $filecustom))
date=$(date +%Y-%m-%d)

echo "#########################################################"  >> /var/log/bash_aliases
echo $date >> /var/log/bash_aliases
echo "#########################################################"  >> /var/log/bash_aliases
echo $filedir  >> /var/log/bash_aliases
echo $filenew  >> /var/log/bash_aliases

if [ ! -f $customaliases 1>&2 ]
then
    touch $customaliases
    echo "#################################" >> $customaliases
    echo "## Aliaszusatz von"  >> $customaliases
    echo "## $host" >> $customaliases
    echo "#################################" >> $customaliases
    echo "._bash_aliases wurde erstellt für " >> /var/log/bash_aliases
    echo $host >>  /var/log/bash_aliases
fi

# Prüfe ob unterschiedliche Zeilenanzahlen sind #
if [ $filenew -eq $filedir ]
then
    echo "Dateien sind gleich" >> /var/log/bash_aliases
else
    # Backupdatei erstellen
    set -- .bash_aliases.backup-$date'_'???
    lastname=${!#}
    backupnr=${lastname##*backup-$date'_'}
    backupnr=${backupnr%%.*}
    backupnr=${backupnr//\?/0}

    ### Backupdateinummer automatisch um +1 bis maximal 30 erhoehen ##
    if [ "$[backupnr++]" -ge 30 ]; then
            echo "test"
    fi
    backupnr=000${backupnr}
    backupnr=${backupnr: -3}

    if [ $backupnr -gt 001 ]
    then
        backupnr=$(($backupnr))
        backupnr=00${backupnr}
        filename=backup-$date'_'${backupnr}
        backupfile=$(echo  $file.$filename)
    else
        filename=backup-$date
        backupfile=$(echo  $file.$filename)
    fi
        cp $DIR/.bash_aliases $DIR/$backupfile
        cp $DIR/.newAliases $DIR/.bash_aliases
        cat $customaliases >> $DIR/.bash_aliases
        rm $DIR/.newAliases
        find $DIR/.bash_aliases.backup-* -mtime +5 -exec echo {}>> /var/log/bash_aliases \;
        find $DIR/.bash_aliases.backup-* -mtime +5 -exec rm {}>> /var/log/bash_aliases \;
        echo "bash_aliases wurde geändert"  >> /var/log/bash_aliases
        source $DIR/.bash_aliases
fi