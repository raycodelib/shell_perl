#!/bin/sh

if test $# = 0
then
    echo "Usage: $0 <attachment1> <attachment2> <attachment3> <>  --- at least one attachment"
fi

for file in "$@"
do
    if test -e "$file"
    then 
        subject=${file:0:-4}
        echo -n "Address to e-mail this image to? "
        read addr
        echo -n "Message to accompany image? "
        read msg
        #    message          subject    no copy at sentbox  attachment target address
        echo "$msg" | mutt -s "$subject!" -e 'set copy=no' -a $file -- $addr
        echo "$file send to $addr"
    else
        echo "$file does not exist"
    fi
done

