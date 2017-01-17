# use lib ".";
use image;
# my $file = slurp("yao.png", :bin);
read_image("yao.png");
# say $file[8..40];
# say "bytes " ~ $file.bytes;
# my @a = @file;
# say @file[8..@file.elems].eager;
# my $string = (@file[0][8..$end]).map({$_.fmt('%02x')}).list.join;
# say (%Png::png_chunk_headers.invert.pairup[0]);
# say "file " ~ $string;
# say Png::chunks.subparse($string);
#
#`(
IHDR -> 8 - 32
SBIT -> 33 - 48
TEXT -> 49 - 85)

# my $mat;
# my $start = 8;
# my $end = 11;
# # say $file[$start..$end].map({$_.Int.fmt('%02x')}).join;
# my $len = 0;
# my $header = "";
#
#
# # say $header.WHAT;
# my $data = "";
# while $end <= $file.bytes {
#
#     $len = :16(($file[$start..$end]).map({$_ .fmt('%02x')}).join) ;
#     $header = ($file[$start+4..$end+4]).map({$_ .fmt('%02x')}).join;
#     $data = $file[$start+8 ..$start+8+$len].map({$_ .fmt('%02x')}).list;
#
#     # say "length " ~ $len ~ " header " ~ %Png::png_chunk_headers{$header};
#     # say $data;
#     $start = $start + $len + 12 ;
#     $end = $start + 3;
# }
#



# while $end <= $file.bytes {
#     # say "currently at " ~$end;
#
#     $mat = Png::chunks.subparse($file[$start..$end].hyper.map({$_.Int.fmt('%02x')}).join);
#     if ($mat) {
#         # say $mat;
#         my $length = :16($mat<Length>.Str).Int;
#         # say "start " ~ $start ~ " end " ~ $end;
#
#         # say $length;
#         if ($end - $length - 12 == $start) {
#             say $mat<Data><Header>;
#             say "start " ~ $start ~ " end " ~ $end;
#             $start = $start + $length + 12 ;
#             $end = $start + 3;
#             say "new start " ~ $start ~ " new end " ~ $end ~ " length " ~ $length;
#             say "";
#             say "=====================";
#             say "";
#         } else {
#             $end = $start + 12 + $length;
#         }
#
#     } else {
#         $end +=1;
#     }
# }
#


say now - INIT now;

#
# say $file[8..140].map({$_.fmt('%02x')});
# say ($file[8..$end]).map({$_.fmt('%02x')}).list;
# say $file[8..140];
