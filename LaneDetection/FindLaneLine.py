import os
import sys
import cv2
import numpy as np
import enviroment as env
import time
from warper import Warper as warp
from FindLine import FindLine as LineDetector
#warper = warp()
#findLine = LineDetector()
def dir_thresh(sobelx, sobely):
    abs_sobelx = np.abs(sobelx)
    abs_sobely = np.abs(sobely)
    scaled_sobel = np.arctan2(abs_sobely, abs_sobelx)
    sxbinary = np.zeros_like(scaled_sobel)
    sxbinary[(scaled_sobel >= 0.7) & (scaled_sobel <= 1.2)] = 1

    return sxbinary

def mag_thresh(sobelx, sobely):
    gradmag = np.sqrt(sobelx ** 2 + sobely ** 2)
    scale_factor = np.max(gradmag) / 255
    gradmag = (gradmag / scale_factor).astype(np.uint8)
    binary_output = np.zeros_like(gradmag)
    binary_output[(gradmag >= 50) & (gradmag <= 255)] = 1

    return binary_output

#def BindThreadsholdImage(image)
    
def Process_frame(image, warper, findLine):
    blur_ksize = 5  # Gaussian blur kernel size
    image = cv2.GaussianBlur(image, (blur_ksize, blur_ksize), 0, 0)
    sobelx = cv2.Sobel(image[:, :, 2], cv2.CV_64F, 1, 0, ksize=5)
    sobely = cv2.Sobel(image[:, :, 2], cv2.CV_64F, 0, 1, ksize=5)
    mag = mag_thresh(sobelx, sobely)
    #edges = cv2.Canny(image,100,200)
    #cv2.imshow("QQ",edges)
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
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(5, 2))
    res = cv2.erode(res,kernel)
    mag[mag != 0] = 255
    res[mag != 0] = 255
    #res = cv2.bitwise_or(res, mag)
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(2, 2))
    res = cv2.dilate(res,kernel)
    #cv2.imshow('edge image', mag)
    mask_image = warper.roi_mask(res)
    cv2.imshow('Binary image', mask_image)
    pers_img = warper.warp(mask_image)
    cv2.imshow('Bird eye view image', pers_img)
    cv2.imshow('Rorigin image', image)
    line_image = findLine.hough_lines(mask_image)
    cv2.imshow('Line image', line_image)
    
    finally_image = cv2.addWeighted(image, 0.8, line_image, 1, 0)
    cv2.imshow('Finally result', finally_image)

if __name__ == "__main__":
    cap = cv2.VideoCapture(env.video_path_1)
    size = (int(cap.get(cv2.cv.CV_CAP_PROP_FRAME_WIDTH)),   
        int(cap.get(cv2.cv.CV_CAP_PROP_FRAME_HEIGHT)))
    print ('Frame row:{}, col:{}'.format(size[0],size[1]))
    warper = warp(size)
    findLine = LineDetector(size)
    while(cap.isOpened()):
	ret, frame = cap.read()
	try:
	    if ret:
		Process_frame(frame, warper, findLine)
	    else:
		break
	    if cv2.waitKey(1) & 0xFF == ord('q'):
		break
	except:
	    pass
    time.sleep(0.5)
    cap.release()
    cv2.destroyAllWindows()	
