require "imageruby"
include ImageRuby
 i = Image.from_file("/home/ahmed/Documents/Perl6-ImageReader/lena.bmp")
 puts i[0,0]
