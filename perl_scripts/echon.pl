#!/usr/bin/perl -w

if ($#ARGV == 1) {
    $round = $ARGV[0];
    $content = $ARGV[1];
} else {
    die "Usage: $0 <number of lines> <string>\n";
}

if ($round =~ /^[0-9]+$/) {
    for (my $i=0; $i<$round; $i++){
        print "$content\n";
    }    
} else {
    die "$0: argument 1 must be a non-negative integer\n";
}


