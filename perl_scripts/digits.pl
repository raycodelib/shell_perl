#!/usr/bin/perl -w

while ($line = <STDIN>) {
    # $line=`echo "$line" | sed "s/[0-4]/</g"`
    # $line=`echo "$line" | sed "s/[6-9]/>/g"`
    $line =~ s/[0-4]/</g;
    $line =~ s/[6-9]/>/g;
    print "$line";
}