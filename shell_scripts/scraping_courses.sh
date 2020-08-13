#!/bin/sh

if test $# = 1
then 
    arg1=$1
else
    echo "Usage: $0 <coursecode>"
    exit 1
fi
# echo "$arg1"

if echo $arg1 | egrep "[A-Z]{4}"  >/dev/null
then
    courseCode=$arg1
else
    echo "courseCode should contain 4 capital letters. (e.g. COMP/MECH)"
    exit 1
fi

url_postgrad="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr="
url_undergrad="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr="
# echo "$url_postgrad$courseCode"

curl -s "$url_postgrad$courseCode" "$url_undergrad$courseCode" | sed -e "s/.*\($courseCode[0-9]\{4\}\).html[^>]*>*\([^<]*\).*/\1 \2/" 
# | sed "s/[ ]$//" | egrep "$courseCode[0-9]{4}.html" | sort | uniq

