
###
# Filename:          loadNewUpdate_aliases.sh
# Author:            Helpi
# Date:              2018-09-06
# Version:           1.0
# -----
# Last Modified: Tue Dec 31 2019
# Modified By: Helpi
# 
###

scriptFolder="/scripts"

# Datum : 2018-09-06
if [ ! -e $scriptFolder/update_aliases.sh ];
then
    curl https://raw.githubusercontent.com/Defjam121/.bash_aliases/master/update_aliases.sh > $scriptFolder/update_aliases.sh

fi

if [ -e $scriptFolder/update_aliases.sh ];
then
    $scriptFolder/update_aliases.sh
fi