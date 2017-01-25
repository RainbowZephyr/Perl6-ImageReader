import cv2
import numpy as np

img = cv2.imread("Umarbles.bmp",1)
file = open('lenapy', 'w')
for x in xrange(0,512):
    for y in xrange(0,512):
        file.write("["+str(img[y][x][0])+" "+str(img[y][x][1])+" "+str(img[y][x][2])+"]\n")

file.close()
