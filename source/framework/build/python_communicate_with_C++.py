import sys
import numpy as np
import cv2
import os
import np_opencv_module as npcv
import time
current_folder = os.path.dirname(os.path.realpath(__file__))
image_path = os.path.abspath(os.path.join(current_folder, 'lena.jpg'))
video_path = os.path.abspath(os.path.join(current_folder, 'test.avi'))
if __name__ == "__main__":
    print image_path
    cap = cv2.VideoCapture(video_path)
    start = time.time()
    while(cap.isOpened()):
	ret, frame = cap.read()
	if ret:
	    #gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
	    gray = npcv.QciToGray_GPU(frame)
	    cv2.imshow('frame',gray)
	    if cv2.waitKey(1) & 0xFF == ord('q'):
		break
	else:
	    break
    end = time.time()
    cap.release()
    cv2.destroyAllWindows()
    print("Total spend : {}sec".format(end-start))
    '''img = cv2.imread(image_path, cv2.IMREAD_COLOR)
    npcv.edison_test(img, 2)'''
'''    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    cv2.imshow('Display Image', gray)
    cv2.waitKey(0)'''

