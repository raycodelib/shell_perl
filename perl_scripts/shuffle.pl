#!/usr/bin/perl -w

@input = <STDIN>;
@res = ();

$i = 0;
$length = @input;
# print $length, "\n";
if ($length > 1) {
    while ($i < $length ) {
        $newindex = rand($length);
        if (! $res[$newindex]) {
            my $var = shift @input;
            $res[$newindex] = $var;
            $i++;
        }
    }
} else {
    @res = @input;
}

print @res;
