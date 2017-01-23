unit module image;
# use png;
use matrix;
use experimental :cached;

our @png_header = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
our @bmp_header = [0x42, 0x4D] ;
our %png_chunk_headers = ("49484452" => "IHDR", "504c5445" => "PLTE", "49444154" => "IDAT", "49454e44" => "IEND", "74524e53" => "TRNS", "6348524d" => "CHRM", "67414d41" => "GAMA", "69434350" => "ICCP", "73424954" => "SBIT", "73524742" => "SRGB", "74455874" => "TEXT", "7a545874" => "ZTXT", "69545874" => "ITXT", "624b4744" => "BKGD", "68495354" => "HIST", "70485973" => "PHYS", "73504c54" => "SPLT", "74494d45" => "TIME");

our sub read_image(Str $path) is export {
    my $image_file = slurp $path, :bin;

    if ($image_file[0] == 0x42 && $image_file[1] == 0x4D) {
        return check_bmp($image_file);
    } elsif ($image_file[0..7] == @png_header) {
        read_png($image_file);
    }
}

our sub read_png(Buf $file) {
    my $start = 8;
    my $end = 11;
    my $len;
    my $header;
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

our sub check_bmp(Buf $file) {
    my $height = :16(($file[25].fmt('%02x') ~ $file[24].fmt('%02x') ~ $file[23].fmt('%02x') ~ $file[22].fmt('%02x')));

    my $width = :16(($file[21].fmt('%02x') ~ $file[20].fmt('%02x') ~ $file[19].fmt('%02x') ~ $file[18].fmt('%02x')));

    my $compression = :16(($file[33].fmt('%02x') ~ $file[32].fmt('%02x') ~ $file[31].fmt('%02x') ~ $file[30].fmt('%02x')));

    my $n_colours = :16(($file[49].fmt('%02x') ~ $file[48].fmt('%02x') ~ $file[47].fmt('%02x') ~ $file[46].fmt('%02x')));

    my $bpp = :16($file[29].fmt('%02x') ~ $file[28].fmt('%02x'));

    if ($n_colours == 0 && $compression == 0 && $bpp == 24) {
        return read_bmp24($file, $width, $height);
    } else {
        return Any;
    }

}

our sub read_bmp24(Buf $file, Int $width, Int $height) {
    my Int $imgx = 54;

    my $mat = matrix::Matrix.new($height,$width);

    my Int $matx = 0;

    while ($imgx + 2) <= $file.bytes {
        $mat.data[$matx] =  [$file[$imgx],$file[$imgx+1],$file[$imgx+2]];
        $matx += 1;
        $imgx += 3;
    }

    return ($mat);
}

our sub write_bmp(Str $filename, matrix::Matrix $mat, Int $compression) {
    my $file = open $filename, :w, :bin;

    #HEADER
    my $size = change_to_4bytes(54 + $mat.data.elems * 3);

    my Buf @header = [Buf.new(0x42), Buf.new(0x4D), Buf.new(:16($size.substr(6,2))), Buf.new(:16($size.substr(4,2))), Buf.new(:16($size.substr(2,2))), Buf.new(:16($size.substr(0,2))),  Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(54), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00)];

    #DIB
    $size = change_to_4bytes($mat.data.elems * 3);
    my $width = change_to_4bytes($mat.width);
    my $height = change_to_4bytes($mat.height);

    my Buf @DIB = [Buf.new(40), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(:16($width.substr(6,2))), Buf.new(:16($width.substr(4,2))), Buf.new(:16($width.substr(2,2))), Buf.new(:16($width.substr(0,2))), Buf.new(:16($height.substr(6,2))), Buf.new(:16($height.substr(4,2))), Buf.new(:16($height.substr(2,2))), Buf.new(:16($height.substr(0,2))), Buf.new(0x01),Buf.new(0x00), Buf.new(0x18), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(:16($size.substr(6,2))), Buf.new(:16($size.substr(4,2))), Buf.new(:16($size.substr(2,2))), Buf.new(:16($size.substr(0,2))), Buf.new(0x60), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x60), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00) ];

    for @header {$file.write($_);}
    for @DIB {$file.write($_)};

    for $mat.data -> $c {
        for $c -> $v {
            $file.write(Buf.new($v));
        }
    }

    $file.close;
}

our sub dump($filename, @data ){
    my $file = open $filename, :w;
    for @data -> $c {
        for $c -> $v {
            $file.say($v);
        }
    }
    $file.close;
}

my sub change_to_2bytes($input) returns Str {
    return $input.fmt('%04x');
}

my sub change_to_4bytes($input) returns Str {
    return $input.fmt('%08x');
}
