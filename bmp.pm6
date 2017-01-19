module BMP {
    #NOTE that all bytes are reversed
    grammar header_fields {
	regex FileType  {\w**4}
	regex FileSize  {\w**8}
	regex Reserved1 {\w**4}
	regex Reserved2 {\w**4}
	regex BitmapOffset {\w**8}
    }

    grammar bmp_header {

    }

}
