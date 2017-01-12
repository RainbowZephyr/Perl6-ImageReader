# use lib ".";
use png;

my $file = slurp("/home/ahmed/Pictures/yao.png", :bin);

say $file[8..40];

say Png::chunks.subparse($file[8..28].hyper.map({$_.fmt('%02x')}).join);



say $file[8..15].map({$_.fmt('%02x')});
say $file[8..15].join;
