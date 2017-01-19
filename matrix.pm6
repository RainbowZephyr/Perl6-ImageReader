module matrix {
class Matrix {
    has Int $.width;
    has Int $.height;
    has Array @.data is rw;
    method new ($width, $height) {
      self.bless(:$width,:$height);
    }

    method get_pixel(Int $x, Int $y) {
        return self.data[(self.height - $y - 1) * self.width + $x];
    }
  }
}
# my $mat = matrix::Matrix.new(512, 512);
# say $mat.data.elems;
