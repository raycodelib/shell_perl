#!/usr/bin/perl -w

die "Usage: $0 <integer>\n" if @ARGV != 1;

my $i = 0;
my %seen;
my $totalread = 0;
my $succeed = 0;

while (<STDIN>) {
    chomp $_;
    $_ =~ s/ +/ /g;
    $_ =~ s/^ *//;
    $_ =~ s/ *$//;
    $_ = lc($_);   ## transfer characters to lower case
    # print "$_\n"; 
    if (! $seen{$_}) {
        $seen{$_}++;
        $i++;
    }
    $totalread++;
    
    if ($i >= $ARGV[0]) {
        $succeed = 1;
        last;
    } 
}


if ($succeed) {
    print "$i distinct lines seen after $totalread lines read.\n";
} else {
    print "End of input reached after $totalread lines read - $ARGV[0] different lines not seen.\n";
}
