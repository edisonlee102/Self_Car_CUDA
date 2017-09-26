#!/usr/bin/python
import sys
import cv2
import os
import numpy as np
current_folder = os.path.dirname(os.path.realpath(__file__))
record_folder = os.path.abspath(os.path.join(current_folder, 'CalibrationImage'))
if __name__ == "__main__":
    Count = 1;
    if os.path.exists(record_folder):
        print('Delete all image')
        os.system('rm -rf {}/*'.format(record_folder))
    else:
        print('Create folder {}'.format(record_folder))
        os.system('mkdir {}'.format(record_folder))
    # Open and Setting parameters
    cap = cv2.VideoCapture(0)
    if (cap.isOpened()):
        print('Open')
    else:
        print('Error. Can not open camera...')
        sys.exit(-1)
    
    while (True):
        ret, frame = cap.read()
        key = cv2.waitKey(5) & 0xFF
        if  key == ord('r'):
            print('Save Calibration Image {}'.format(Count))
            cv2.imwrite('{}/chessboard{}.jpg'.format(record_folder, Count),frame , [int(cv2.IMWRITE_JPEG_QUALITY), 100])
            Count+=1
        elif key == ord('q'):
            print('Leave Images Record...')
            break
        cv2.imshow("Image", frame) 
    cap.release()
    cv2.destroyAllWindows()
