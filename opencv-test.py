import cv2
import numpy as np

img = cv2.imread("lena.bmp",1)

print(img[511][0])
