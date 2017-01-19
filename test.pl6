use image;
# use experimental :pack;
# use experimental :cached;

my $img = image::read_image("lena.bmp");

say $img.get_pixel(511,511)[0];



say now - INIT now;
