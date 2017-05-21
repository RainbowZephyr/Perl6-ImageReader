unit module image;
# use png;
use matrix;
use experimental :cached;
use experimental :pack;

my int @png_header = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
my Buf[uint8] $bmp_header = Buf[uint8].new(0x42, 0x4D);
our %png_chunk_headers = ("49484452" => "IHDR", "504c5445" => "PLTE", "49444154" => "IDAT", "49454e44" => "IEND", "74524e53" => "TRNS", "6348524d" => "CHRM", "67414d41" => "GAMA", "69434350" => "ICCP", "73424954" => "SBIT", "73524742" => "SRGB", "74455874" => "TEXT", "7a545874" => "ZTXT", "69545874" => "ITXT", "624b4744" => "BKGD", "68495354" => "HIST", "70485973" => "PHYS", "73504c54" => "SPLT", "74494d45" => "TIME");


my uint32 $width;
my uint32 $height;

our sub read_image(Str $path) is export {
    my $image_file = open $path, :bin;


    if ($image_file.read(2) == $bmp_header) {

        say "BMP $path";
        check_bmp($image_file);
        return read_bmp24($image_file, $width, $height);

    } elsif ($image_file.read(8).Array eqv @png_header) {
        say "PNG $path";
        # read_png($image_file);
    }

    $image_file.close();
}

# our sub read_image2(Str $path) is export {
#     my $image_file = slurp $path, :bin;
#
#     if ($image_file[0] == 0x42 && $image_file[1] == 0x4D) {
#         return check_bmp2($image_file);
#     } elsif ($image_file[0..7] == @png_header) {
#         read_png($image_file);
#     }
# }

our sub read_png(IO::Handle $file) {
    my int $start = 8;
    my int $end = 11;
    my int $len;
    my int $header;
    my int $data;
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

our sub check_bmp(IO::Handle $file) {
    $file.seek(8,SeekFromCurrent);


    my uint32 $offset = $file.read(4).unpack("L");

    my uint32 $bmp_header_size = $file.read(4).unpack("L");
    $width = $file.read(4).unpack("L");
    $height = $file.read(4).unpack("L");
    my uint16 $planes = $file.read(2).unpack("S");
    my uint16 $bits_per_pixel = $file.read(2).unpack("S");
    my uint32 $compression = $file.read(4).unpack("L");
    my uint32 $size_of_bitmap = $file.read(4).unpack("L");
    my uint32 $horizontal_resolution = $file.read(4).unpack("L");
    my uint32 $vertical_resolution = $file.read(4).unpack("L");
    my uint32 $colours_used = $file.read(4).unpack("L");
    my uint32 $important_colours = $file.read(4).unpack("L");

    if ($colours_used == 0 && $compression == 0 && $bits_per_pixel == 24) {
        return True;
        # return read_bmp24($file, $width, $height);
    } else {
        die("Not implemented yet");
    }

}
# our sub check_bmp2(Buf $file) {
#     my int $height = :16(($file[25].fmt('%02x') ~ $file[24].fmt('%02x') ~ $file[23].fmt('%02x') ~ $file[22].fmt('%02x')));
#
#     my int $width = :16(($file[21].fmt('%02x') ~ $file[20].fmt('%02x') ~ $file[19].fmt('%02x') ~ $file[18].fmt('%02x')));
#
#     my int $compression = :16(($file[33].fmt('%02x') ~ $file[32].fmt('%02x') ~ $file[31].fmt('%02x') ~ $file[30].fmt('%02x')));
#
#     my int $n_colours = :16(($file[49].fmt('%02x') ~ $file[48].fmt('%02x') ~ $file[47].fmt('%02x') ~ $file[46].fmt('%02x')));
#
#     my int $bpp = :16($file[29].fmt('%02x') ~ $file[28].fmt('%02x'));
#
#     if ($n_colours == 0 && $compression == 0 && $bpp == 24) {
#         return read_bmp24_2($file, $width, $height);
#     } else {
#         return Any;
#     }
#
# }

#TODO: ADD PADDING CHECKS

our sub read_bmp24(IO::Handle $file, uint32 $width, uint32 $height) {

    my Array[Int] @data[$width*$height];
    # @data.push((Array[Int].new(1,2,3)));
    # @data[0] := Array[Int].new(1,2,3);
    my uint32 $counter = 0;
    my uint32 $padding = $width % 4;

    for 0 ..^ $height {
       for 0 ..^ $width {
           @data[$counter] := $file.read(3).Array;
           $counter++;
       }
    #    say $counter;
       # seek padding
       $file.seek($padding, SeekFromCurrent);
   }
}

# our sub read_bmp24_2(Buf $file, int $width, int $height) {
#     my int $imgx = 54;
#
#     my $mat = matrix::Matrix.new($width, $height);
#
#     my int $matx = 0;
#     my int $row_bytes = $width * 3 + 54;
#     my int $padding  = $width % 4;
#     my int $padding_counter;
#
#
#
#     loop (;$imgx + 2 <= $file.bytes; $imgx += 3) {
#         $mat.data[$matx] :=  Array[Int].new($file[$imgx],$file[$imgx+1],$file[$imgx+2]);
#
#         $matx += 1;
#         # $imgx += 3;
#         # say $imgx;
#         if ($imgx > 0 && $imgx % $row_bytes == 0) {
#             # say "Padded";
#              $imgx += $padding;
#         }
#
#     }
#
#     # say $row;
#     return ($mat);
# }
#
# our sub write_bmp(Str $filename, matrix::Matrix $mat, int $compression) {
#     my $file = open $filename, :w, :bin;
#
#     #HEADER
#     my $size = change_to_4bytes(54 + $mat.data.elems * 3);
#
#     my Buf @header = [Buf.new(0x42), Buf.new(0x4D), Buf.new(:16($size.substr(6,2))), Buf.new(:16($size.substr(4,2))), Buf.new(:16($size.substr(2,2))), Buf.new(:16($size.substr(0,2))),  Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(54), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00)];
#
#     #DIB
#     $size = change_to_4bytes($mat.data.elems * 3);
#     my $width = change_to_4bytes($mat.width);
#     my $height = change_to_4bytes($mat.height);
#     my $comp = change_to_4bytes(0);
#
#     my Buf @DIB = [Buf.new(40), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(:16($width.substr(6,2))), Buf.new(:16($width.substr(4,2))), Buf.new(:16($width.substr(2,2))), Buf.new(:16($width.substr(0,2))), Buf.new(:16($height.substr(6,2))), Buf.new(:16($height.substr(4,2))), Buf.new(:16($height.substr(2,2))), Buf.new(:16($height.substr(0,2))), Buf.new(0x01),Buf.new(0x00), Buf.new(0x18), Buf.new(0x00), Buf.new(:16($comp.substr(6,2))), Buf.new(:16($comp.substr(4,2))), Buf.new(:16($comp.substr(2,2))), Buf.new(:16($comp.substr(0,2))), Buf.new(:16($size.substr(6,2))), Buf.new(:16($size.substr(4,2))), Buf.new(:16($size.substr(2,2))), Buf.new(:16($size.substr(0,2))), Buf.new(0x60), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x60), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00), Buf.new(0x00) ];
#
#     for @header {$file.write($_);}
#     for @DIB {$file.write($_)};
#
#     for $mat.data -> $c {
#         for $c -> $v {
#             $file.write(Buf.new($v));
#         }
#     }
#
#     $file.close;
# }
#
# our sub dump($filename, @data ){
#     my $file = open $filename, :w;
#     for @data -> $c {
#         for $c -> $v {
#             $file.say($v);
#         }
#     }
#     $file.close;
# }
#
# my sub change_to_2bytes($input) returns Str {
#     return $input.fmt('%04x');
# }
#
# my sub change_to_4bytes($input) returns Str {
#     return $input.fmt('%08x');
# }
#
#
# our sub run_length_encode($str) {
#     return $str.subst(/(.) $0*/, { $/.chars ~ $0 }, :g);
# }
# our sub run_length_decode($str) {
#     return $str.subst(/(\d+) (.)/, { $1 x $0 }, :g);
#  }
