import cv2
import numpy as np

img = cv2.imread("/home/ahmed/Documents/Perl6-ImageReader/resources/Umarbles.bmp",1)
print(img.shape[1])
file = open('lenapy', 'w')
# for x in range(0,img.shape[1]):
#     for y in range(0,img.shape[0]):
#         file.write("["+str(img[y][x][0])+" "+str(img[y][x][1])+" "+str(img[y][x][2])+"]\n")

for x in range(0,20):
    for y in range(0,20):
        file.write("["+str(img[y][x][0])+" "+str(img[y][x][1])+" "+str(img[y][x][2])+"]\n")



file.close()
# print(img[0][11])
# print(img[11][0])
