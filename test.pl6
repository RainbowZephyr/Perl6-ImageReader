# use lib ".";
use png;

my $file = slurp("/home/ahmed/Pictures/yao.png", :bin);

# say $file[8..40];
# say "bytes " ~ $file.bytes;
my $end = $file.bytes;
my @a = $file;
my $string =  (@a).hyper.map({$_.Int.fmt('%02x')}).join;
# say "file " ~ $string;
# say Png::chunks.subparse($string);
#
#`(
IHDR -> 8 - 32
SBIT -> 33 - 48
TEXT -> 49 - 85)
my $mat;
my $c = 8;
$end = 15;
# say $file[$c..$end].map({$_.Int.fmt('%02x')}).join;
my $zeft = Png::chunks.subparse($file[49..85].map({$_.Int.fmt('%02x')}).join);
say $zeft<Format><Length>;
while $end <= $file.bytes {
    $mat = Png::chunks.subparse($file[$c..$end].map({$_.Int.fmt('%02x')}).join);
    if ($mat) {
        say $mat;
        say "start " ~ $c ~ " end " ~ $end;
        $c = $c + :16($mat<Format><Length>.Str).Int + 12 ;
        $end = $c + 1;
        say "new start " ~ $c ~ " new end " ~ $end;
        say "";
        say "=====================";
        say "";
    } else {
        $end +=1;
    }
}

say now - INIT now;

#
# say $file[8..140].map({$_.fmt('%02x')});
# say ($file[8..$end]).map({$_.fmt('%02x')}).list;
# say $file[8..140];
