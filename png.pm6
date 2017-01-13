module Png {
    grammar chunks {
        regex TOP { <Format>+ }
        # regex TOP {<Type>}
        regex Format {[<Length><Data><CRC>]}
        # regex Type { <IHDR> | <PLTE> | <IDAT> | <IEND> | <TRNS> | <CHRM> | <GAMA> | <ICCP> | <SBIT> | <SRGB> | <TEXT> | <ZTXT> | <ITXT> | <BKGD> | <HIST> | <PHYS> | <SPLT> | <TIME> }
        regex Length {\w**8}

        proto regex Data {*}
        regex Data:sym<IHDR> {<IHDR><IHDR_Chunk>}
        regex Data:sym<SBIT> {<SBIT><SBIT_Format>}

        regex IHDR {49484452}
        regex PLTE {504c5445}
        regex IDAT {49444154}
        regex IEND {49454e44}
        regex TRNS {74524e53}
        regex CHRM {6348524d}
        regex GAMA {67414d41}
        regex ICCP {69434350}
        regex SBIT {73424954}
        regex SRGB {73524742}
        regex TEXT {74455874}
        regex ZTXT {7a545874}
        regex ITXT {69545874}
        regex BKGD {624b4744}
        regex HIST {68495354}
        regex PHYS {70485973}
        regex SPLT {73504c54}
        regex TIME {74494d45}
        regex CRC {\w**8}

        regex IHDR_Chunk { <IHDR_Width> <IHDR_Height> <IHDR_BitDepth> <IHDR_ColorType> <IHDR_Compression> <IHDR_Filter> <IHDR_Interlace>}
        regex IHDR_Width {\w**8}
        regex IHDR_Height {\w**8}
        regex IHDR_BitDepth {\w**2}
        regex IHDR_ColorType {\w**2}
        regex IHDR_Compression {\w**2}
        regex IHDR_Filter {\w**2}
        regex IHDR_Interlace {\w**2}

        proto regex SBIT_Format {*}
        regex SBIT_Format:sym<Format1> {<SBIT_GrayBits>}
        regex SBIT_Format:sym<Format2> {<SBIT_GrayBits><SBIT_AlphaBits>}
        regex SBIT_Format:sym<Format3> {<SBIT_RedBits><SBIT_GreenBits><SBIT_BlueBits>}
        regex SBIT_Format:sym<Format4> {<SBIT_RedBits><SBIT_GreenBits><SBIT_BlueBits><SBIT_AlphaBits>}

        regex SBIT_GrayBits {\w**2}
        regex SBIT_RedBits {\w**2}
        regex SBIT_GreenBits {\w**2}
        regex SBIT_BlueBits {\w**2}
        regex SBIT_AlphaBits {\w**2}


    }

}
