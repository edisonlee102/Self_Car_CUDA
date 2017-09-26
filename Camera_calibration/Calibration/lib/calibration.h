#include <cstdio>
#include <opencv2/opencv.hpp>
#include <vector>
#include <string>

using namespace cv;
using namespace std;

class CameraCalibrator{
private:
    vector<string> m_filenames;
    Size m_borderSize;
    vector<vector<Point2f> > m_srcPoints; // Corner have two, one is imageCorner(Mapping picture)
    vector<vector<Point3f> > m_dstPoints; // Another is objectCorner(Mapping world), we put all picture corner into two vector.
    // To distort parameters
    Mat cameraMatrix;
    Mat distCoeffs;
    Mat map1, map2;
public:
    void setFilename();
    void setBorderSize(const Size &borderSize);
    void addChessboardPoints();
    void addPoints(const vector<Point2f> &imageCorners, const vector<Point3f> &objectCorners);
    void calibrate(Size imageSize);
    Mat QciRemap(const Mat &image);
    string GetFilename(int index){
	return m_filenames[index];
    }
    // Getters
    Mat getCameraMatrix()
    {
        return cameraMatrix;
    }
    Mat getDistCoeffs()
    {
        return distCoeffs;
    }
};
