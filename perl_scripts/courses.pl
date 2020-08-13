#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;

die "Usage: $0 <course code>\n" if @ARGV != 1;
my $course = $ARGV[0];
my $url = "http://www.timetable.unsw.edu.au/current/${course}KENS.html";
# print $url;

my $web_page = get($url) or die "Unable to get $url";
my @lines = $web_page =~ m/$course\d{4}.*\.html">.*</g;

my %course_dict;
my @keys;
foreach my $line (@lines) {
    if ($line =~ /$course\d{4}.html">$course\d{4}/) {
        next;
    }
    # (COMP9801).html">(Extended Design and Analysis of Algorithms)</a><
    $line =~ s/(.*)\.html">(.*)<\/a></$1 $2/g;
    # print "$line\n";
    my @temp = split(/ /, $line, 2);   ## splite by first space ' ', into 2 parts
    # print "$temp[0]\n";
    # print "$temp[1]\n";
    if (!$course_dict{$temp[0]}) {            ## if $temp[0] not in the dict, then create dict[temp[0]] = temp[1]
        $course_dict{$temp[0]} = $temp[1];
        push @keys, $temp[0];
    }
}
# foreach $x (keys %course_dict) {
#     print "$x ==> $course_dict{$x}\n";
# }

my @sorted_keys = sort(@keys);
# print "@sorted_keys";
foreach my $sort_key (@sorted_keys) {
    print "$sort_key $course_dict{$sort_key}\n";
}



