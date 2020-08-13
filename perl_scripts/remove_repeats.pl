#!/usr/bin/perl -w

my @uniq;
my %seen;

foreach my $word (@ARGV) {
    # print "$word\n";
    if (! $seen{$word}) {
        $seen{$word}++;
        push @uniq, $word
    }
}
print "@uniq\n";

# my @sorted_uniq = sort @uniq;
# print "@sorted_uniq\n"

