#!/usr/bin/perl

use strict;
use warnings;
use File::Compare;

die "Usage: $0 <>\n" if @ARGV != 2;

my $dir1 = $ARGV[0];
my $dir2 = $ARGV[1];

for my $file1 (glob "$dir1/*") {

    my $filename = $file1 =~ s/.*\///r;
    my $file2 = "$dir2/$filename";

    if (-e $file2 && compare($file1, $file2) == 0 ) {
        print "$filename\n"; 
    }
}