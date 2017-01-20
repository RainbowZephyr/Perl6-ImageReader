module matrix {
    class Matrix {
        has Int $.width;
        has Int $.height;
        has  @.data is rw;

        method new ($width, $height) {
            self.bless(:$width,:$height);
        }

        method get_pixel(Int $x, Int $y) {
            return self.data[(self.height - $y - 1) * self.width + $x];
        }

        method set_pixel(Int $x, Int $y, $val) {
            self.data[(self.height - $y - 1) * self.width + $x] = $val;
        }

        method copy_from_array(@array) {
            for 0..^self.width -> $x {
                for 0..^self.height -> $y {
                    self.data[(self.height - $y -1 ) * self.width + $x] = @array[$x;$y];
                }
            }
        }

    }
}
