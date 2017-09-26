#include <fstream>
#include <iostream>
#include <iomanip>
#include <sstream>
#include <opencv2/opencv.hpp>
#include <stdio.h>
using namespace std;
using namespace cv;
class IO_object{
private:
       fstream f_stream;
       Mat InMatrix;
       Mat distCoeffs;
       Mat map1;
       Mat map2;
       bool is_create_table;
public:
       IO_object(const string filename, const string mode);
       ~IO_object();
       void writeLine(string str);
       void readParameters();
       void InitMapTable(Size imageSize);
       // Setters
       void setMapTableFalg(bool flag) {
	   is_create_table = flag;
       }
       // Getters
       bool getMapTableFalg(){
	   return is_create_table;
       }
       Mat getInMatrix()
       {
           return InMatrix;
       }
       Mat getdistCoeffs()
       {
           return distCoeffs;
       }
       Mat getMap1Table()
       {
           return map1;
       }
       Mat getMap2Table()
       {
           return map2;
       }
};
