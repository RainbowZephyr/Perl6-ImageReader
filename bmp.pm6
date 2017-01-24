module BMP {
    #NOTE that all bytes are reversed
    grammar header {
        regex TOP {<Format>}
        regex Format {<FileType> <FileSize> <Reserved1> <Reserved2> <BitmapOffset> <Header_Size> <Width> <Height> <Planes> <Bits> <Compression> <Image_Size> <XRes> <YRes> <Ncolours> <ImportantColours>}
        regex FileType  {\w**4}
        regex FileSize  {\w**8}
        regex Reserved1 {\w**4}
        regex Reserved2 {\w**4}
        regex BitmapOffset {\w**8}
        regex Header_Size {\w**8}
        regex Width {\w**8}
        regex Height {\w**8}
        regex Planes {\w**4}
        regex Bits {\w**4}
        regex Compression {\w**8}
        regex Image_Size {\w**8}
        regex XRes {\w**8}
        regex YRes {\w**8}
        regex Ncolours {\w**8}
        regex ImportantColours{\w**8}


    }





    }
