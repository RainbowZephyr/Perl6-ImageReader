use image;
use matrix;
# use NativeCall;
# use bmp;
# use Test::META;
# use experimental :pack;
# use experimental :cached;

# my $path ="/home/ahmed/Pictures/3.jpg";
my $path ="resources/Umarbles.bmp";

my $img = read_image($path);

# my $file = open "resources/Umarbles.bmp", :bin;
# for 'huge-csv'.IO.lines -> $line {
#     # Do something with $line
# }

# say $file.read(2) == @bmp_header;

# my $image_file = open $path, :bin;
# say $image_file.read(2).Array eqv @bmp_header;

# sub library {
    # return ~(%?RESOURCES{'lib/libdemo.so'});
# }
# say sprintf($*VM.config<dll>, "demo");
# say $*CWD;
# sub demo() returns int32 is native($*CWD~'/lib/libdemo.so') is symbol('_Z4demov') { * }

# our sub linenoise(Str $prompt) returns Str  is native(%?RESOURCES{'lib/linenoise.so'}) { * }
# sub read_png_file(CArray[int8]) is native("png") {...}
# say $*VM.config<dll>;
# say library;
# say meta-ok();
# my $x = demo();
# say $x;
# say %?RESOURCES{};
# read_image($path);
say "Finished reading";
# while True {}




say now - INIT now;
