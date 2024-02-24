#!/bin/bash
# spec : change_tag.sh <environment> <property> <new value> <file.yml>

case ${#} in [!4] ) 
    echo "usage: change_tag.sh <environment> <property> <new value> <file.yaml>" 1>&2
    exit 1 
   ;; 
esac

env="$1" prop="$2" new="$3" file="$4"
bakFile="${file}".bak
mv "$file" "$bakFile"
sed '/^'"${env}"'/,/^[   ]*$/{  # [ spaceChar tabChar ]
        /'"${prop}"'/s/\('"${prop}: "'\)\(.*$\)/\1'"${new}"'/
    }' "$bakFile" > "$file"
