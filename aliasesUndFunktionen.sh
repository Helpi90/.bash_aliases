#!/bin/bash

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

function newScript()
{
        file=$1
        if [ -a $file ];
        then
          nano $file
        else
          touch $file
          echo "#!/bin/bash" > $file
          echo "# Datum : $(date +%Y-%m-%d)" > $file
          echo
          chmod +x $file
          nano $file
        fi
}