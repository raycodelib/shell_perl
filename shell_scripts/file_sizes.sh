#!/bin/sh

smallfiles=""
mediumfiles=""
largefiles=""
for filename in *
do
    linenumber=`cat "$filename" | wc -l`
    # echo $linenumber
    if [ "$linenumber" -lt 10 ]
    then
        smallfiles="$smallfiles $filename"
    elif test $linenumber -lt 100
    then
        mediumfiles="$mediumfiles $filename"
    else
        largefiles="$largefiles $filename"
    fi
done
echo "Small files: $smallfiles"
echo "Medium-sized files: $mediumfiles"
echo "Large files: $largefiles"