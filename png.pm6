module Png {
    grammar chunks {
        regex TOP {<Format> }
        # regex TOP {<Type>}
        regex Format {[<Length><Data><CRC>]}

        regex Length {\w**8}

        proto regex Data {*}
        regex Data:sym<IHDR> {<IHDR><IHDR_Chunk>}
        regex Data:sym<PLTE> {<PLTE><PLTE_Chunk>}
        regex Data:sym<IDAT> {<IDAT><IDAT_Chunk>}
        regex Data:sym<IEND> {<IEND>}
        regex Data:sym<TRNS> {<TRNS><TRNS_Format>}
        regex Data:sym<CHRM> {<CHRM><CHRM_Chunk>}
        regex Data:sym<GAMA> {<GAMA><GAMA_Chunk>}
        regex Data:sym<ICCP> {<ICCP><ICCP_Chunk>}
        regex Data:sym<SBIT> {<SBIT><SBIT_Format>}
        regex Data:sym<SRGB> {<SRGB><SRGB_Chunk>}
        regex Data:sym<TEXT> {<TEXT><TEXT_Chunk>}
        regex Data:sym<ZTXT> {<ZTXT><ZTXT_Chunk>}
        regex Data:sym<ITXT> {<ITXT><ITXT_Chunk>}
        regex Data:sym<BKGD> {<BKGD><BKGD_Index>}
        regex Data:sym<HIST> {<HIST><HIST_Chunk>}
        regex Data:sym<PHYS> {<PHYS><PHYS_Chunk>}
        regex Data:sym<SPLT> {<SPLT><SPLT_Chunk>}
        regex Data:sym<TIME> {<TIME><TIME_Chunk>}

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

        regex PLTE_Chunk {<RedBits><GreenBits><BlueBits>}

        regex IDAT_Chunk {[\w**2]+}

        proto regex TRNS_Format {*}
        regex TRNS_Format:sym<Format1> {<TRNS_Transparency>}
        regex TRNS_Format:sym<Format2> {<TRNS_Red><TRNS_Green><TRNS_Blue>}
        regex TRNS_Format:sym<Format2> {<TRNS_Transparency_array>}

        regex  TRNS_Transparency {\w**4}
        regex  TRNS_Red {\w**4}
        regex  TRNS_Green {\w**4}
        regex  TRNS_Blue {\w**4}
        regex  TRNS_Transparency_array {[\w**2]+}

        regex CHRM_Chunk {<CHRM_WhitePointX><CHRM_WhitePointY><CHRM_RedX><CHRM_RedY><CHRM_GreenX><CHRM_GreenY><CHRM_BlueX><CHRM_BlueY>}
        regex CHRM_WhitePointX {\w**8}
        regex CHRM_WhitePointY {\w**8}
        regex CHRM_RedX {\w**8}
        regex CHRM_RedY {\w**8}
        regex CHRM_GreenX {\w**8}
        regex CHRM_GreenY {\w**8}
        regex CHRM_BlueX {\w**8}
        regex CHRM_BlueY {\w**8}

        regex GAMA_Chunk {\w**4}

        regex ICCP_Chunk {<ICCP_Profile_name><ICCP_Null><ICCP_Compression_method><ICCP_Compression_profile>}
        regex ICCP_Profile_name {[\w**2]**1..79}
        regex ICCP_Null {\w**2}
        regex ICCP_Compression_method {\w**2}
        regex ICCP_Compression_profile {[\w**2]+}

        proto regex SBIT_Format {*}
        regex SBIT_Format:sym<Format1> {<GrayBits>}
        regex SBIT_Format:sym<Format2> {<RedBits><GreenBits><BlueBits>}
        regex SBIT_Format:sym<Format3> {<GrayBits><AlphaBits>}
        regex SBIT_Format:sym<Format4> {<RedBits><GreenBits><BlueBits><AlphaBits>}

        regex GrayBits {\w**2}
        regex RedBits {\w**2}
        regex GreenBits {\w**2}
        regex BlueBits {\w**2}
        regex AlphaBits {\w**2}

        regex SRGB_Chunk {\w**2}

        regex TEXT_Chunk {<TEXT_Keyword><TEXT_Null><TEXT_Text>}
        regex TEXT_Keyword {[\w**2]**1..79}
        regex TEXT_Null {\w**2}
        regex TEXT_Text {[\w**2]*}

        regex ZTXT_Chunk {<ZTXT_Keyword><ZTXT_Null><ZTXT_Compression_method><ZTXT_Compressed_text>}
        regex ZTXT_Keyword {[\w**2]**1..79}
        regex ZTXT_Null {\w**2}
        regex ZTXT_Compression_method {\w**2}
        regex ZTXT_Compressed_text {[\w**2]+}

        regex ITXT_Chunk {<ITXT_Keyword><ITXT_Null><ITXT_Compression_flag><ITXT_Compression_method><ITXT_Language><ITXT_Null><ITXT_Translated><ITXT_Null><ITXT_Text>}
        regex ITXT_Keyword {[\w**2]**1..79}
        regex ITXT_Null {\w**2}
        regex ITXT_Compression_flag {\w**2}
        regex ITXT_Compression_method {\w**2}
        regex ITXT_Language {[\w**2]*}
        regex ITXT_Translated {[\w**2]*}
        regex ITXT_Text {[\w**2]*}

        proto regex BKGD_Format {*}
        regex BKGD_Format:sym<Format1> {<BKGD_Palette_index>}
        regex BKGD_Format:sym<Format2> {<BKGD_GrayBits>}
        regex BKGD_Format:sym<Format3> {<BKGD_RedBits><BKGD_GreenBits><BKGD_BlueBits>}
        regex BKGD_Palette_index {\w**2}
        regex BKGD_GrayBits {\w**4}
        regex BKGD_RedBits {\w**4}
        regex BKGD_GreenBits {\w**4}
        regex BKGD_BlueBits {\w**4}

        regex HIST_Chunk {[\w**4]+}

        regex PHYS_Chunk {<PHYS_PPX><PHYS_PPY><PHYS_UnitSpecifier>}
        regex PHYS_PPX {\w**8}
        regex PHYS_PPY {\w**8}
        regex PHYS_UnitSpecifier {\w**2}

#TODO CHECK WHAT COULD BE MISSING IN SPLT
        regex SPLT_Chunk {<SPLT_Palette><SPLT_Null><SPLT_Depth><SPLT_Red><SPLT_Green><SPLT_Blue><SPLT_Alpha><SPLT_Frequency>}
        regex SPLT_Palette {[\w**2]**1..79}
        regex SPLT_Null {\w**2}
        regex SPLT_Depth {\w**2}
        regex SPLT_Red {[\w**2] | [\w**4]}
        regex SPLT_Green {[\w**2] | [\w**4]}
        regex SPLT_Blue {[\w**2] | [\w**4]}
        regex SPLT_Alpha {[\w**2] | [\w**4]}
        regex SPLT_Frequency {\w**2}
        # regex SPLT_ {\w**2}

        regex TIME_Chunk {<TIME_Year><TIME_Month><TIME_Day><TIME_Hour><TIME_Minute><TIME_Second>}
        regex TIME_Year {\w**4}
        regex TIME_Month {\w**2}
        regex TIME_Day {\w**2}
        regex TIME_Hour {\w**2}
        regex TIME_Minute {\w**2}
        regex TIME_Second {\w**2}

    }
}
