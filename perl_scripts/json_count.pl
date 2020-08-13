#!/usr/bin/perl -w

use JSON;
# use Data::Dumper;

die "Usage: $0 <species> <file>\n" if @ARGV != 2;

open ('F', '<', $ARGV[1]) or die "cannot open file: $ARGV[1]\n";
my @lines = <F>;
close(F);

my $sum = 0;
my $num = 0;
foreach my $line (@lines) {
    if ($line =~ /^\s*"how_many": /) {
        $num = $line =~ s/\"how_many\": (.*),/$1/r;
    }
    my $species = "";
    if ($line =~ /^\s*"species": /) {
        $species = $line =~ s/\"species\": \"(.*)\"/$1/r;
    }
    chomp $species;
    $species =~ s/^ *//;
    $species =~ s/ *$//;    
    
    if ($species eq $ARGV[0]) {
        # print "+++$num+++$species+++\n";
        $sum += $num;
        $num = 0;
    }
}

print "$sum\n";

