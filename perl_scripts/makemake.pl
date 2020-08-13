#!/usr/bin/perl -w

die "Usage: $0\n" if @ARGV != 0;


my @files = glob('*');

# foreach my $file (glob "./*") {
#     print "$file\n";
# }

# my @files = `ls`;
# print "@files\n";

my %dependecies;
my $mainfile;
my @output;
foreach my $file (@files) {
    my $mainflag = 0;
    if ($file =~ /.*\.c/) {
        # print "$file\n";
        ## change example.c --> example.o
        my $tempo = $file;  
        $tempo =~ s/\.c/\.o/;
        push @output, $tempo;

        open (F, '<', $file) or die "cannot open file: $file\n";
        my @lines = <F>;
        close F;
        my @temph;
        foreach my $line (@lines) {          
            if ($line =~ /^\s*(int|void)\s*main\s*\(/) {
                $mainflag = 1;
            }
            if ($line =~ /^\s*#include [^<]/) {
                $line =~ s/^\s*#include\s*"(.*)"/$1/;
                # print "$line";
                chomp $line;
                push @temph, $line;
            }
        }
        push @temph, $file;
        if ($mainflag) {
            $mainfile = $file;
            $mainfile =~ s/\.c//;
        }
        $dependecies{$tempo} = "@temph";
    }
    
}



## create Makefile
my $date = `date`;
print "# Makefile generated at $date\n";
print "CC = gcc\n";
print "CFLAGS = -Wall -g\n\n";
print "$mainfile:   @output\n";

print "\t\$(CC) \$(CFLAGS) -o \$\@ @output\n\n";

foreach my $key (keys %dependecies) {
    # print "$key ==> $dependecies{$key}\n";
    print "$key: $dependecies{$key}";
    print "\n";
}