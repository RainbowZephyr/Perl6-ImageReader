use image;
use matrix;

use bmp;
# use experimental :pack;
# use experimental :cached;

my $img = image::read_image("resources/Umarbles.bmp");
# # image::dump("lenapl", $img.data);
#
my $d = open "lenapl", :w;
for (0..^20) -> $y {
    for (0..^20) -> $x {
        $d.say("Location: $x $y: ");
        $d.say($img.get_pixel($x, $y).reverse);
    }
}
$d.close;
# my $pl = open "lenapl", :r;
# my $py = open "resources/lenapy", :r;

# say $pl.^methods;
# say $pl.lines[0].WHAT
;

# for 0..^262144 -> $i {
#     say $i;
#     if ($pl.lines[$i]).Str !== ($py.lines[$i]).Str {
#         say "error in line $i";
#     }
# }


# my $f = slurp "resources/Umarbles.bmp", :bin;
# say $f[54..54+4256].grep(/<-[0]>/);

#
# for 0..1418 -> $x {
#     for 0..1000 -> $y {
#         if height - $y - 1 * self.width + $x
#     }
# }
# say BMP::header.subparse($f[0..54].map({$_.fmt("%02x")}).join);
# my $seek =
# say $img.data[0];
# say $img.get_pixel(0,0);
# for (0..^512) -> $i {
#     for (0..^512) -> $j {
#         say "Loc $i  $j: " ~ $img.get_pixel($i,$j);
#     }
# }
# for (0..1000) -> $i {
#     say "Loc 0 $i : " ~ $img.get_pixel(0,$i);
# }
#
# for (0..1000) -> $i {
#     say "Loc $i 0 : " ~ $img.get_pixel($i,0);
# }

# say $f[((1001 - 11 - 1)*1419*3)+54..((1001 - 11 - 1)*1419*3)+54+1418];
# my $d = open "rowdumpl", :w;
# my $seek = 54+1419*3+3;
# say $f[$seek..^$seek+1419].elems;
# say $f[$seek..^$seek+1419*3].elems;
# say $f[$seek..^$seek+1419*3+1][*-1];

# for $f[$seek..^$seek+1419] -> $x {say('"'~$x.fmt("%02x") ~'"');}
# $d.close;
# say $img.get_pixel(0,16);
# say $img.data[(1001 - 1000 - 1) * 1419];
# say 1419*3 % 4;
# say $img.width;
# say $img.height;
# say $img.data.elems;
# say $f.bytes;




# say $img.width;
# say $img.height;
# $img.set_pixel(0,0,[1,1,1]);
# say $img.get_pixel(0,1000);
# say $img.get_pixel(1,1000);
# say $img.get_pixel(2,1000);
# say $f[54..(54+2)];

#
# my @a[5;4];
# #
# for 0..^5 -> $x {
#     for 0..^4 -> $y {
#         @a[$x;$y] = 255;
#     }
# }
#
# say @a;
#
# my $m = matrix::Matrix.new(5,4);
# $m.copy_from_array(@a);
# say $m.data;
# say "total bytes " ~ $f.bytes;
# say "image bytes " ~ $img.data.elems;
# say "size " ~ $mat.data.elems;

# image::dump("dump", $img.data);

# image::write_bmp("hamada.bmp", $img , 0);
# for huffman 'this is an example for huffman encoding'.comb.Bag {
#     say "'{.key}' : {.value}";
# }
# say 'this is an example for huffman encoding'.comb.Bag;
say now - INIT now;

# sub huffman (%frequencies) {
#     my @queue = %frequencies.map({ [.value, .key] }).sort;
#     while @queue > 1 {
#         given @queue.splice(0, 2) -> ([$freq1, $node1], [$freq2, $node2]) {
#             @queue = (|@queue, [$freq1 + $freq2, [$node1, $node2]]).sort;
#         }
#     }
#     hash gather walk @queue[0][1], '';
# }
#
# multi walk ($node,            $prefix) { take $node => $prefix; }
# multi walk ([$node1, $node2], $prefix) {
#     walk $node1, $prefix ~ '0';
#     walk $node2, $prefix ~ '1';
# }
#
# sub huffman (%frequencies) {
#     my @queue = %frequencies.map: { .value => (hash .key => '') };
#     while @queue > 1 {
#         @queue.=sort;
#         my $x = @queue.shift;
#         my $y = @queue.shift;
#         @queue.push: ($x.key + $y.key) => hash $x.value.deepmap('0' ~ *),
#         $y.value.deepmap('1' ~ *);
#     }
#     @queue[0].value;
# }
