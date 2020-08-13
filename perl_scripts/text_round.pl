#!/usr/bin/perl -w

while (<STDIN>) {
    # $_ =~ s/([0-9]+)\.([0-9]+)/($2 <0.5) ? $1 : $1+1/g;
    # ( ($_-int($_))<0.5) ? int($_) : int($_)+1 
    
    $_ =~ s/([0-9]+\.[0-9]+|[0-9]+)/sprintf('%.0f', $1)/gex;
    print;
    
    # @nums = $_ =~ m/([0-9]+\.[0-9]+|[0-9]+)/g;
    # foreach $num (@nums) {
    #     $num = sprintf('%.0f', $num); 
    # }
    # print "@nums\n";
}