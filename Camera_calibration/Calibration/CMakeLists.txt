# Author: Sudeep Pillai (Sep 14, 2014)
project (CalibrationCamera)
cmake_minimum_required (VERSION 2.6.0)
find_package(PkgConfig REQUIRED)
find_package( OpenCV REQUIRED )
find_package(Qt5Core)
find_package(Qt5Widgets)
find_package(Qt5Test)
find_package(Qt5OpenGL)
find_package(Qt5Concurrent)
# configure opencv
pkg_check_modules(OpenCV opencv)
include_directories(${OpenCV_INCLUDE_DIRS})

# Build np<=>opencv converter library
aux_source_directory(. DIR_SRCS)
add_subdirectory(lib)
add_executable(Calibration CalibrationTool.cpp)
add_executable(ApplyCalibrationOnWecam ApplyCalibrationMatrix.cpp)
target_link_libraries(Calibration CalFunctions ${OpenCV_LDFLAGS})
target_link_libraries(ApplyCalibrationOnWecam ${OpenCV_LDFLAGS} CalFunctions)

