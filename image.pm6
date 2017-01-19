unit module image;
# use png;
use matrix;
use experimental :cached;

our @png_header = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
our @bmp_header = [0x42, 0x4D] ;
our %png_chunk_headers = ("49484452" => "IHDR", "504c5445" => "PLTE", "49444154" => "IDAT", "49454e44" => "IEND", "74524e53" => "TRNS", "6348524d" => "CHRM", "67414d41" => "GAMA", "69434350" => "ICCP", "73424954" => "SBIT", "73524742" => "SRGB", "74455874" => "TEXT", "7a545874" => "ZTXT", "69545874" => "ITXT", "624b4744" => "BKGD", "68495354" => "HIST", "70485973" => "PHYS", "73504c54" => "SPLT", "74494d45" => "TIME");

our sub read_image(Str $path) is export {
    my Buf $image_file = slurp $path, :bin;

    if ($image_file[0] == 0x42 && $image_file[1] == 0x4D) {
        return read_bmp($image_file);
    } elsif ($image_file[0..7] == @png_header) {
        read_png($image_file);
    }
}

our sub read_png(Buf $file) {
    my Int $start = 8;
    my Int $end = 11;
    my Int $len;
    my Str $header;
    my $data;
    while $end <= $file.bytes {
        $len = :16(($file[$start..$end]).map({$_ .fmt('%02x')}).join) ;
        $header = ($file[$start+4..$end+4]).map({$_ .fmt('%02x')}).join;
        $data = $file[$start+8 ..$start+8+$len].map({$_ .fmt('%02x')}).list;

        # say "length " ~ $len ~ " header " ~ %Png::png_chunk_headers{$header};
        # say $data;
        $start = $start + $len + 12 ;
        $end = $start + 3;
    }
}

our sub read_bmp(Buf $file) {
    my Int $imgx = 54;

    my Int $height = :16(($file[25].fmt('%02x') ~ $file[24].fmt('%02x') ~ $file[23].fmt('%02x') ~ $file[22].fmt('%02x')));

    my Int $width = :16(($file[21].fmt('%02x') ~ $file[20].fmt('%02x') ~ $file[19].fmt('%02x') ~ $file[18].fmt('%02x')));

    my $mat = matrix::Matrix.new($height,$width);

    my Int $matx = 0;

    while $imgx <= $file.bytes {
        $mat.data[$matx] =  [$file[$imgx+2],$file[$imgx+1],$file[$imgx]];
        $matx += 1;
        $imgx += 3;
    }
    
    return ($mat);
}
