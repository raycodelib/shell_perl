#!/bin/sh

if test $# -lt 1
then
    echo "Usage: $0 <urls>"
    exit 1
else
    for url in $@
    do
        echo -n "$url"
        curl -I -s $url | egrep "^[S|s]erver" | sed -e "s/^[S|s]erver://"
    done
fi