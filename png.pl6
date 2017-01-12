my $file = slurp("/home/ahmed/Pictures/3840x2400-earth_space-13219.png", :bin);

my $png_header = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];

if ($png_header == $file[0..7]) {
    say 1;
}

say 2;

# grammar Gram {
#     regex TOP { <Header> }
#     rule Header {137 80 78 71 13 10 26 10}
# }
# my $string = "";
# for 0..$file.elems -> $i {
#     $string ~= $file[$i] ~ " ";
# }
