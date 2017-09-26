Hareware platform : TK1 (Tegra series A15 + GPU)
Step 1.
    To calibrate camera, we need to 14 (If you want to more picture please add path into lib/calibration.h) photos to calculate cameraMatrix & distCoeffs.
    
    to excute below command: (It will capture chessboard picture when you type 'r' and 'q' is close the program.)
    - python RecordImage.py
    Picture will be record into CalibrationImage folder.

Step 2.
    Cmake "CalibrationTool.cpp" & "ApplyCalibrationMatrix.cpp" that create two tools, one is using chessboard photo to get cameraMatrix & distCoeffs into Parameter.txt. The other is testing "Parameter.txt" to get Undistorted Image.

    to excute below command:
    - rm -rf build && mkdir build && cd build && cmake .. && cp ApplyCalibrationOnWecam ../CalibrationImage && cp Calibration ../CalibrationImage
    - ./Calibration (Produce Parameter.txt)
    - ./ApplyCalibrationOnWecam (I will using GPU lib, please build opencv 2.14.13)

