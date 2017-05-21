module matrix {
    class Matrix {
        has int $.width;
        has int $.height;
        has Array[Int] @.data is rw;
        has $.xdpi is rw;
        has $.ydpi is rw;

        method new ($width, $height) {
            self.bless(:$width,:$height);
        }

        method get_pixel(int $x, int $y) {
            return self.data[(self.height - $y - 1) * self.width + $x].reverse;
        }

        method set_pixel(int $x, int $y, $val) {
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
