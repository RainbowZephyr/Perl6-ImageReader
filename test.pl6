use image;
use matrix;
# use experimental :pack;
# use experimental :cached;

# my $img = image::read_image("lena.bmp");
# my $f = slurp "lena.bmp", :bin;
# say $img.get_pixel(0,0);
# $img.set_pixel(0,0,[1,1,1]);
# say $img.get_pixel(0,0);
#
my @a[5;4];
#
for 0..^5 -> $x {
    for 0..^4 -> $y {
        @a[$x;$y] = 255;
    }
}
#
# say @a;
#
my $m = matrix::Matrix.new(5,4);
$m.copy_from_array(@a);
say $m.data;
# say "total bytes " ~ $f.bytes;
# say "image bytes " ~ $img.data.elems;
# say "size " ~ $mat.data.elems;

# image::dump("dump", $img.data);

image::write_bmp("hamada.bmp", $m , 0);

say now - INIT now;
