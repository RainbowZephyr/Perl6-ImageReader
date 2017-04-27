puts IO.read("Umarbles.bmp").unpack("C")
puts IO.read("Umarbles.bmp",1,1).unpack("C")

open("rowdumprb", "w") { |file|
    for i in (((1001 - 11 - 1)*1419*3)+54..((1001 - 11 - 1)*1419*3)+54+1418)
    puts(IO.read("Umarbles.bmp",1,i).unpack("C"))
end
}
