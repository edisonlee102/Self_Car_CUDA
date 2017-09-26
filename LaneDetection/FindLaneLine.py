import os
import sys
import cv2
import numpy as np
import enviroment as env
from warper import Warper as warp
from FindLine import FindLine as LineDetector
warper = warp()
findLine = LineDetector()
def Process_frame(image):
    image_hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    yellow_min = np.array([11, 100, 120])
    yellow_max = np.array([25, 255, 255])
    yellow_mask = cv2.inRange(image_hsv, yellow_min, yellow_max)
    
    white_min = np.array([0, 0, 200])
    white_max = np.array([180, 30, 255])
    white_mask = cv2.inRange(image_hsv, white_min, white_max)
    
    red_min = np.array([0, 43, 46])
    red_max = np.array([10, 255, 255])
    red_mask = cv2.inRange(image_hsv, red_min, red_max)

    mask = yellow_mask + white_mask + red_mask
    res = cv2.bitwise_and(image, image, mask=mask)
    res[res != 0] = 255
    mask_image = warper.roi_mask(res)
    cv2.imshow('Binary image', mask_image)
    pers_img = warper.warp(mask_image)
    cv2.imshow('Bird eye view image', pers_img)
    cv2.imshow('Rorigin image', image)
    binary = cv2.threshold(pers_img, 50, 255, cv2.THRESH_BINARY)
    line_image = findLine.hough_lines(mask_image)
    cv2.imshow('Line image', line_image)
    
    finally_image = cv2.addWeighted(image, 0.8, line_image, 1, 0)
    cv2.imshow('Finally result', finally_image)

if __name__ == "__main__":
    cap = cv2.VideoCapture(env.video_path_2)
    while(cap.isOpened()):
	ret, frame = cap.read()
	try:
	    if ret:
		Process_frame(frame)
	    if cv2.waitKey(1) & 0xFF == ord('q'):
		break
	except:
	    pass
    cap.release()
    cv2.destroyAllWindows()	
