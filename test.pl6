use image;
use matrix;
# use experimental :pack;
# use experimental :cached;

# my $img = image::read_image("lena.bmp");

# say $img.get_pixel(0,0);
# $img.set_pixel(0,0,[1,1,1]);
# say $img.get_pixel(0,0);
#
my @a[5;4];

for 0..^5 -> $x {
    for 0..^4 -> $y {
        @a[$x;$y] = 1;
    }
}

say @a;

my $m = matrix::Matrix.new(5,4);
$m.copy_from_array(@a);
say $m.data;
image::write_bmp("hamada", $m , 0);

say now - INIT now;
