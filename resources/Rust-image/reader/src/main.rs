extern crate bmp;
fn main() {

    let img = bmp::open("/home/ahmed/Documents/Perl6-ImageReader/lena.bmp").unwrap_or_else(|e| {
        panic!("Failed to open: {}", e);
    });

    let pixel = img.get_pixel(511, 511);

    println!("{:?}",pixel);
}

//Pixel { r: 193, g: 111, b: 74 }
//         C1       6F      4A -> 4A  6F C1
