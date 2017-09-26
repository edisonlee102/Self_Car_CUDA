import os
import sys
current_folder = os.path.dirname(os.path.realpath(__file__))
test_path = os.path.abspath(os.path.join(current_folder, "test_images"))                                                 
video_path_1 = os.path.abspath(os.path.join(test_path, "project_video.mp4"))
video_path_2 = os.path.abspath(os.path.join(test_path, "test_challenge_video.mp4"))
output_path = os.path.abspath(os.path.join(test_path, "Edison_lane_detect.mp4"))
lib_path = os.path.abspath(os.path.join(current_folder, "lib"))
sys.path.append(lib_path)

