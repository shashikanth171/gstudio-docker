#!/bin/bash

# Ref : http://stackoverflow.com/questions/17998763/sed-commenting-a-line-matching-a-specific-string-and-that-is-not-already-comme
#       http://unix.stackexchange.com/questions/89913/sed-ignore-line-starting-whitespace-for-match
#sed -e '/Used for postgres db/ s/^#*/#/' -i  confs/local_settings.py.default 

echo -e 'Please select the database for storing the users credentials: \n   1. sqlite \n   2. postgresql';
read OPTION ;
echo -e "USER input : $OPTION";
if [[ "$OPTION" == "" ]]; then
    echo "No input";
elif [[ "$OPTION" == "1" ]]; then
    echo "Used for sqlite db";
    sed -e '/Used for sqlite3 db/ s/^\s*#*//' -i  confs/local_settings.py.default; 
    sed -e '/Used for postgres db/ s/^\s*#*/#/' -i  confs/local_settings.py.default; 
    sed -e '/Used for postgres db/ s/^\s*#*/#/' -i  scripts/initialize.sh;
    sed -e '/echo[[:space:]]\+"psql*/,+7 s/^\s*#*/#/' -i scripts/initialize.sh;
#    sed -e '/echo[[:space:]]\+"psql*/,+7 s/^\s*#*/#/' -i scripts/initialize.sh;
#    sed -e '/echo[[:space:]]\+"from[[:space:]]\+django.contrib.auth.models[[:space:]]\+import[[:space:]]\+User*/,+3 s/^\s*#*//' -i scripts/initialize.sh ;
#    sed -e '/[[:space:]]\+User.objects.create_superuser*/ s/^\s*#*/    /' -i scripts/initialize.sh;
elif [[ "$OPTION" == "2" ]]; then
    echo "Used for postgres db";
    sed -e '/Used for sqlite3 db/ s/^\s*#*/#/' -i  confs/local_settings.py.default; 
    sed -e '/Used for postgres db/ s/^\s*#*//' -i  confs/local_settings.py.default; 
    sed -e '/Used for postgres db/ s/^\s*#*//' -i  scripts/initialize.sh;
    sed -e '/echo[[:space:]]\+"psql*/,+7 s/^\s*#*//' -i scripts/initialize.sh;
#    sed -e '/echo[[:space:]]\+"from[[:space:]]\+django.contrib.auth.models[[:space:]]\+import[[:space:]]\+User*/,+3 s/^\s*#*/#/' -i scripts/initialize.sh;
#    sed -e '/echo[[:space:]]\+"psql*/,+7 s/^\s*#*//' -i scripts/initialize.sh;
#    sed -e '/[[:space:]]\+User.objects.create_superuser*/ s/^\s*#*/#    /' -i scripts/initialize.sh;
else
    echo "Invalid input";
fi
exit;
