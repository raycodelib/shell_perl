#!/bin/sh

if test $# = 0
then 
    echo "Usage: $0 <pictureName>"
    exit 1
fi

for file in "$@"
do
    if test -e "$file"
    then
        date=`ls -l | egrep "$file" | sed -E "s/.*(...) (..) (..):(..).*/\1 \2 \3:\4/"`
        # echo "$date"
        convert -gravity south -pointsize 36 -draw "text 0,10 '$date'" $file $file
    else
        echo "$file does not exist"
    fi
done

