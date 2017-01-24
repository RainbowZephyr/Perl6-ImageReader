use image;
use matrix;

use bmp;
# use experimental :pack;
# use experimental :cached;

my $img = image::read_image("Umarbles.bmp");
# image::dump("lenapl",img.data);
my $d = open "lenapl", :w;
for (0..511) -> $x {
    for (0..511) -> $y {
        $d.say($img.get_pixel($x, $y).reverse);
    }
}
$d.close;
# my $f = slurp "Umarbles.bmp", :bin;
# say BMP::header.subparse($f[0..54].map({$_.fmt("%02x")}).join);
# my $seek =
# say $f[1403402..1403402+2];

#
# for (0..20) -> $i {
#     for (0..20) -> $j {
#         say "Loc $i  $j: " ~ $img.get_pixel($i,$j);
#     }
# }
# say $img.width;
# say $img.height;
# $img.set_pixel(0,0,[1,1,1]);
# say $img.get_pixel(246,298);
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

# image::write_bmp("hamada.bmp", $m , 0);
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
