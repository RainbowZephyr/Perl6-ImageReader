# use lib ".";
use png;

my $file = slurp("/home/ahmed/Pictures/yao.png", :bin);

# say $file[8..40];

say Png::chunks.subparse(($file[8..71]).hyper.map({$_.fmt('%02x')}).flat.join);

say now - INIT now;

#
# say $file[8..140].map({$_.fmt('%02x')});
say ($file[8..$file.bytes]).hyper.map({$_.fmt('%02x')}).list;
# say $file[8..140];
