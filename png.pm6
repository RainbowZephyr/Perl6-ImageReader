module Png {
    grammar chunks {
        regex TOP {<Length> <Type> <Data> <CRC> }
        # regex TOP {<Type>}
        regex Type { <IHDR> | <PLTE> | <IDAT> | <IEND> | <TRNS> | <CHRM> | <GAMA> | <ICCP> | <SBIT> | <SRGB> | <TEXT> | <ZTXT> | <ITXT> | <BKGD> | <HIST> | <PHYS> | <SPLT> | <TIME> }
        token Length {\w**8}
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
        regex Data {[\d**2]*}
        regex CRC {\w**8}
    }

}
