# use lib ".";
use png;

my $file = slurp("/home/ahmed/Pictures/yao.png", :bin);

# say $file[8..40];
my $end = 120;
say Png::chunks.subparse(($file[8..$end]).map({$_.fmt('%02x')}).join);

say now - INIT now;

#
# say $file[8..140].map({$_.fmt('%02x')});
say ($file[8..$end]).map({$_.fmt('%02x')}).list;
# say $file[8..140];
