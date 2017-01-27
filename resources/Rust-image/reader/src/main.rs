use std::io;
use std::io::prelude::*;
use std::fs::File;
use std::io::SeekFrom;

extern crate bmp;
fn main() {


    let mut f = File::open("/home/ahmed/Documents/Perl6-ImageReader/resources/Umarbles.bmp").unwrap();
    let mut buffer = [0; 1419];
    let mut hello_world = String::new();



    f.seek(SeekFrom::Start(((1001 - 11 - 1)*1419*3)+54));
    f.read_exact(&mut buffer);

    for i in 0..1419 {
        // hello_world = hello_world+ &format!("{:x}", buffer[i] ) + " ";
        println!("{:?}",format!("{:x}", buffer[i] ));

    }
    // println!("{:?}",hello_world);

    // let mut buff = File::create("foo.txt");
    // buff.write(b"some bytes");
    //
    // let a = [1, 2, 3];
    //
    // let doubled = a.iter()        print!("{:?}", format!("{:x}", buffer[i] ));

    //                .map(|&x| x * 2)
    //                .collect::<Vec<i32>>();
    //
    // assert_eq!(vec![2, 4, 6], doubled);

    // let mut file=File::open("/home/ahmed/Documents/Perl6-ImageReader/resources/Umarbles.bmp").unwrap();
    // let mut buf=[0u8;12];
    // file.read(&mut buf).unwrap();

    // let img = bmp::open("/home/ahmed/Documents/Perl6-ImageReader/resources/Umarbles.bmp").unwrap_or_else(|e| {
    //     panic!("Failed to open: {}", e);
    // });

    // for x in 0..20 {
        // for y in 0..20 {
            // println!("x: {} y: {} {:?}",x,y,img.get_pixel(x, y));
        // }
    // }
    // println!("{:?}", img.get_pixel(0,11));
    // println!("{:?}", img.get_pixel(1,1000));
    // println!("{:?}", img.get_pixel(2,1000));

    // println!("{:?}", (1001 - 11 - 1) * 1419);
}

//Pixel { r: 193, g: 111, b: 74 }
//         C1       6F      4A -> 4A  6F C1
