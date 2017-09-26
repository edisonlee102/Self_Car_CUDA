#include "lib/calibration.h"
#include "lib/IOfile.h"
#include <string>
template <class T> 
string ConvertToString(T value) {
    stringstream ss;
    ss << value;
    return ss.str();
}
const string RecordFileName = "Parameter.txt";
int main(){ 
    Mat dst, src;
    CameraCalibrator myCameraCalibrator;
    IO_object Record(RecordFileName, "Write");
    myCameraCalibrator.setFilename(); 
    myCameraCalibrator.setBorderSize(Size(8,6)); 
    myCameraCalibrator.addChessboardPoints();
    src = imread(myCameraCalibrator.GetFilename(0),0);
    myCameraCalibrator.calibrate(src.size());
   
    for(int i = 0; i < 14; i++){
	src = imread(myCameraCalibrator.GetFilename(i),0);
	imshow("Original Image", src);
	dst = myCameraCalibrator.QciRemap(src);
	imshow("Undistorted Image", dst);
	waitKey();
    }
    // Show intrinsic parameter
    Mat cameraMatrix = myCameraCalibrator.getCameraMatrix();
    cout << "Camera intrinsic: " << cameraMatrix.rows << "x" << cameraMatrix.cols << endl;
    string s = "Camera intrinsic:\n";
    for(int i = 0; i < (int)cameraMatrix.rows ;i++){
	for(int j = 0; j < (int)cameraMatrix.cols; j++){
	    s += ConvertToString(cameraMatrix.at<double>(i, j)) + "\t";
	}
	s += "\n";
    }
    Record.writeLine(s);
    cout << cameraMatrix.at<double>(0, 0) << "\t" << cameraMatrix.at<double>(0, 1) << "\t" << cameraMatrix.at<double>(0, 2) << endl;
    cout << cameraMatrix.at<double>(1, 0) << "\t" << cameraMatrix.at<double>(1, 1) << "\t" << cameraMatrix.at<double>(1, 2) << endl;
    cout << cameraMatrix.at<double>(2, 0) << "\t" << cameraMatrix.at<double>(2, 1) << "\t" << cameraMatrix.at<double>(2, 2) << endl;
    Mat camerDistCoeffs = myCameraCalibrator.getDistCoeffs();
    cout << "Camera DistCoeffs: " << camerDistCoeffs.rows << "x" << camerDistCoeffs.cols << endl;
    s = "Camera DistCoeffs:\n";
    for(int i = 0; i < (int)camerDistCoeffs.rows ;i++){
        for(int j = 0; j < (int)camerDistCoeffs.cols; j++){
            s += ConvertToString(camerDistCoeffs.at<double>(i, j)) + "\t";
        }
        s += "\n";
    }
    Record.writeLine(s);
    cout << camerDistCoeffs.at<double>(0, 0) <<  " " << camerDistCoeffs.at<double>(0, 1) << " "  \
    << camerDistCoeffs.at<double>(0,2) << " " << camerDistCoeffs.at<double>(0, 3) <<  " " \
    << camerDistCoeffs.at<double>(0, 4)<< endl;
    return 0;
}
