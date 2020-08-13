#!/usr/bin/perl

use strict;
use warnings;

die "Usage: $0 <numbers>\n" if @ARGV < 1;

my @sorted_arr = sort {$a <=> $b} @ARGV;
# print "@sorted_arr\n";

if (@ARGV % 2 == 0) {
    my $middle = @ARGV/2;
    my $median = ($sorted_arr[$middle] + $sorted_arr[$middle - 1]) / 2;
    print "$median\n";
} else {
    my $middle = (@ARGV - 1)/2;
    my $median = $sorted_arr[$middle];
    print "$median\n";
}
