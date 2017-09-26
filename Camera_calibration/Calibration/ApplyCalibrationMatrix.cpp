#include "lib/calibration.h"                                                              
#include "lib/IOfile.h"
#include <opencv2/gpu/gpu.hpp>
#include <string>
const string ReadFileName = "Parameter.txt";

/*void InitMapTable(IO_object &img, Size imageSize) {
    Mat InP = img.getInMatrix();
    Mat dis = img.getdistCoeffs();
    initUndistortRectifyMap(InP, dis, Mat(), Mat(), imageSize, CV_32FC1, map1, map2);
}*/

Mat UndistortedImage_CPU(const cv::Mat &image, IO_object &img, Size imageSize){
    Mat undistorted;
    Mat MapTable1 = img.getMap1Table();
    Mat MapTable2 = img.getMap2Table();
    /*Mat InP = img.getInMatrix();
    Mat dis = img.getdistCoeffs();
    initUndistortRectifyMap(InP, dis, Mat(), Mat(), imageSize, CV_32FC1, map1, map2);*/
    remap(image, undistorted, MapTable1, MapTable2, INTER_LINEAR);
    return undistorted;
}

Mat UndistortedImage_GPU(const cv::Mat &image, IO_object &img, Size imageSize){
    Mat undistorted;
    cv::gpu::GpuMat src, dts;
    src.upload(image);
    cv::gpu::GpuMat MapTable1(img.getMap1Table());
    cv::gpu::GpuMat MapTable2(img.getMap2Table());
    cv::gpu::remap(src, dts, MapTable1, MapTable2, INTER_LINEAR);
    dts.download(undistorted);
    return undistorted;
}

int main(){
    // Get camera parameters
    int FrameRate = 0;
    IO_object Get_Matrix(ReadFileName, "Read");
    Get_Matrix.readParameters();
    Mat InP = Get_Matrix.getInMatrix();
    cout << InP.at<double>(0, 0) << "\t" << InP.at<double>(0, 1) << "\t" << InP.at<double>(0, 2) << endl;
    cout << InP.at<double>(1, 0) << "\t" << InP.at<double>(1, 1) << "\t" << InP.at<double>(1, 2) << endl;
    cout << InP.at<double>(2, 0) << "\t" << InP.at<double>(2, 1) << "\t" << InP.at<double>(2, 2) << endl;
    Mat dis = Get_Matrix.getdistCoeffs();
    cout << dis.at<double>(0, 0) <<  " " << dis.at<double>(0, 1) << " "  \
    << dis.at<double>(0, 2) << " " << dis.at<double>(0, 3) <<  " " \
    << dis.at<double>(0, 4)<< endl;
    // Apply into camera
    VideoCapture cap(0);
    if (!cap.isOpened()){
        return -1;
    }
    Size videoSize = Size((int)cap.get(CV_CAP_PROP_FRAME_WIDTH),(int)cap.get(CV_CAP_PROP_FRAME_HEIGHT));
    if(!Get_Matrix.getMapTableFalg())
	Get_Matrix.InitMapTable(videoSize);
    namedWindow("Original Image", CV_WINDOW_AUTOSIZE);
    namedWindow("Undistorted Image", CV_WINDOW_AUTOSIZE);
    Mat OriCameraFrame, UndistCameraFrame;
    while(true){
	double t = (double)getTickCount();
	// do something ...
	cap >> OriCameraFrame;
	if(OriCameraFrame.empty()){
            break;
        }
	UndistCameraFrame = UndistortedImage_GPU(OriCameraFrame, Get_Matrix, videoSize);
	t = ((double)getTickCount() - t)/getTickFrequency();
	FrameRate += 1/t;
	FrameRate /= 2;
	cout << "\e[A";
	cout << "Frame rate: " << FrameRate << endl;
	imshow("Original Image", OriCameraFrame);
	imshow("Undistorted Image", UndistCameraFrame);
	char key  = waitKey(1);
        if(key == 27 || key == 'q')
            break;
    }
    return 0;
}
