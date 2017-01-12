unit module image;
use png;
our @png_header = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];

sub read_image(Str path) {
    $image_file = slurp path, :bin;
    if ($image_file[0..7] == @png_header) {
        read_png($image_file);
    }
}

sub read_png(file) {

}
