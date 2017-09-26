#include "IOfile.h"

IO_object::IO_object(const string filename,const string mode):is_create_table(false){
    if(mode == "Read"){
	//InMatrix = Mat::zeros(3, 3, CV_32FC1);
	InMatrix = Mat(3,3,CV_64FC1, Scalar::all(0));
	distCoeffs = Mat::zeros(1, 5, CV_64FC1);
	f_stream.open(filename.c_str(), ios::in);
    }else{
	f_stream.open(filename.c_str(), ios::out);
    }
    if(!f_stream){
	cout<<"Fail to open file: " << endl;
    }
}

IO_object::~IO_object(){
   f_stream.close();
}

void IO_object::writeLine(string str){
    if(f_stream){
	cout << "str: "<<str << endl;
	f_stream.write(str.c_str(), str.size());
    }else{
	cout<<"Fail to open file: " << endl;
    }
}

void IO_object::readParameters(){
    string buf = "";
    char v1[15]={'\0'},v2[15]={'\0'},v3[15]={'\0'},v4[15]={'\0'},v5[15]={'\0'};
    do{
	getline(f_stream, buf);
	if(buf == "Camera intrinsic:"){
	    for(int i = 0; i < InMatrix.rows; i++){
		buf.clear();
		memset(v1, '\0', sizeof(v1));
		memset(v2, '\0', sizeof(v2));
		memset(v3, '\0', sizeof(v3));
		getline(f_stream, buf);
		sscanf(buf.c_str(), "%s\t%s\t%s\n", v1, v2, v3);
		//cout << atof(v1)<<" " << atof(v2) <<" " <<atof(v3)<<endl;
		InMatrix.at<double>(i, 0) = atof(v1);
		InMatrix.at<double>(i, 1) = atof(v2);
		InMatrix.at<double>(i, 2) = atof(v3);
	    }
	}else if(buf == "Camera DistCoeffs:"){
	    for(int i = 0; i < distCoeffs.rows; i++){
		buf.clear();
                memset(v1, '\0', sizeof(v1));
                memset(v2, '\0', sizeof(v2));
                memset(v3, '\0', sizeof(v3));
		memset(v4, '\0', sizeof(v4));
                memset(v5, '\0', sizeof(v5));
		getline(f_stream, buf);
		sscanf(buf.c_str(), "%s\t%s\t%s\t%s\t%s\n", v1, v2, v3, v4, v5);
		//cout << v1<<" " << v2 <<" " <<v3 << " " << v4 << " "<< v5<<endl;
		distCoeffs.at<double>(i, 0) = atof(v1);
		distCoeffs.at<double>(i, 1) = atof(v2);
		distCoeffs.at<double>(i, 2) = atof(v3);
		distCoeffs.at<double>(i, 3) = atof(v4);
		distCoeffs.at<double>(i, 4) = atof(v5);
	    }
	}
    }while(!f_stream.eof());
}

void IO_object::InitMapTable(/*IO_object &img, */Size imageSize) {
    Mat InP = this->getInMatrix();
    Mat dis = this->getdistCoeffs();
    initUndistortRectifyMap(InP, dis, Mat(), Mat(), imageSize, CV_32FC1, map1, map2);
}


/*
void IO_object::readParameters(Mat &cameraMatrix, Mat &distCoeffs, int cameracol, int distcol){
    char buf[80]={'\0'};
    char v1[15]={'\0'},v2[15]={'\0'},v3[15]={'\0'},v4[15]={'\0'},v5[15]={'\0'};
    do{
	f_stream.getline(buf, sizeof(buf));
	if(strcmp(buf, "Camera intrinsic:") == 0){
	    for(int i = 0; i < cameracol; i++){
		memset(buf, '\0', sizeof(buf));
		memset(v1, '\0', sizeof(v1));
		memset(v2, '\0', sizeof(v2));
		memset(v3, '\0', sizeof(v3));
		f_stream.getline(buf, sizeof(buf));
		sscanf(buf, "%s\t%s\t%s\n", v1, v2, v3);
		cout << v1<<" " << v2 <<" " <<v3<<endl;
	    }
	}
	if(strcmp(buf, "Camera DistCoeffs:") == 0){
	    for(int i = 0; i < distcol; i++){
		memset(buf, '\0', sizeof(buf));
                memset(v1, '\0', sizeof(v1));
                memset(v2, '\0', sizeof(v2));
                memset(v3, '\0', sizeof(v3));
		memset(v4, '\0', sizeof(v4));
                memset(v5, '\0', sizeof(v5));
		f_stream.getline(buf, sizeof(buf));
		sscanf(buf, "%s\t%s\t%s\t%s\t%s\n", v1, v2, v3, v4, v5);
		cout << v1<<" " << v2 <<" " <<v3 << " " << v4 << " "<< v5<<endl;
	    }
	}
    }while(!f_stream.eof());
}*/
