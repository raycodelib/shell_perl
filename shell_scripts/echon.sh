#!/bin/sh

if test $# = 2
then
    number=$1
    echoContent=$2
else
    echo "Usage: $0 <number of lines> <string>" 1>&2
    exit 1
fi

if echo "$number"| egrep -v '^[0-9]+$' >/dev/null
then
    echo "$0: argument 1 must be a non-negative integer" 1>&2
    exit 1
fi

times=$number
while test $times -gt 0
do
    echo "$echoContent"
    times=$(($times-1))
done


