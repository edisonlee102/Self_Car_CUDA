project (numpy-opencv-converter)
cmake_minimum_required (VERSION 2.6.0)

# Include package config, boost-python
find_package(PkgConfig REQUIRED)
include(cmake/boost-python.cmake)

# configure opencv
pkg_check_modules(OpenCV opencv)
include_directories(${OpenCV_INCLUDE_DIRS})

# Include python (use -D flags instead)
SET(PYTHON_INCLUDE_DIRS "/usr/include/python2.7")
SET(PYTHON_LIBRARY "/usr/lib/python2.7/config-arm-linux-gnueabihf/libpython2.7.so")

# Build np<=>opencv converter library
boost_python_module(np_opencv_converter np_opencv_converter.cpp utils/conversion.cpp)
target_link_libraries(np_opencv_converter boost_system boost_python ${OpenCV_LDFLAGS})

# Build Qci_ConvertLib library
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
boost_python_module(np_opencv_module Qci_ConvertLib/np_opencv_module.cpp)
target_link_libraries(np_opencv_module boost_system boost_python np_opencv_converter ${OpenCV_LDFLAGS})
