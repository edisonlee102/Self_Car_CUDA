# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/build

# Include any dependencies generated for this target.
include CMakeFiles/np_opencv_converter.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/np_opencv_converter.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/np_opencv_converter.dir/flags.make

CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o: CMakeFiles/np_opencv_converter.dir/flags.make
CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o: ../np_opencv_converter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o -c /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/np_opencv_converter.cpp

CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/np_opencv_converter.cpp > CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.i

CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/np_opencv_converter.cpp -o CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.s

CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.requires:
.PHONY : CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.requires

CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.provides: CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.requires
	$(MAKE) -f CMakeFiles/np_opencv_converter.dir/build.make CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.provides.build
.PHONY : CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.provides

CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.provides.build: CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o

CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o: CMakeFiles/np_opencv_converter.dir/flags.make
CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o: ../utils/conversion.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o -c /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/utils/conversion.cpp

CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/utils/conversion.cpp > CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.i

CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/utils/conversion.cpp -o CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.s

CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.requires:
.PHONY : CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.requires

CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.provides: CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.requires
	$(MAKE) -f CMakeFiles/np_opencv_converter.dir/build.make CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.provides.build
.PHONY : CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.provides

CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.provides.build: CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o

# Object files for target np_opencv_converter
np_opencv_converter_OBJECTS = \
"CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o" \
"CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o"

# External object files for target np_opencv_converter
np_opencv_converter_EXTERNAL_OBJECTS =

np_opencv_converter.so: CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o
np_opencv_converter.so: CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o
np_opencv_converter.so: CMakeFiles/np_opencv_converter.dir/build.make
np_opencv_converter.so: /usr/lib/arm-linux-gnueabihf/libboost_python.so
np_opencv_converter.so: /usr/lib/python2.7/config-arm-linux-gnueabihf/libpython2.7.so
np_opencv_converter.so: CMakeFiles/np_opencv_converter.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library np_opencv_converter.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/np_opencv_converter.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/np_opencv_converter.dir/build: np_opencv_converter.so
.PHONY : CMakeFiles/np_opencv_converter.dir/build

CMakeFiles/np_opencv_converter.dir/requires: CMakeFiles/np_opencv_converter.dir/np_opencv_converter.cpp.o.requires
CMakeFiles/np_opencv_converter.dir/requires: CMakeFiles/np_opencv_converter.dir/utils/conversion.cpp.o.requires
.PHONY : CMakeFiles/np_opencv_converter.dir/requires

CMakeFiles/np_opencv_converter.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/np_opencv_converter.dir/cmake_clean.cmake
.PHONY : CMakeFiles/np_opencv_converter.dir/clean

CMakeFiles/np_opencv_converter.dir/depend:
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/build /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/build /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/build/CMakeFiles/np_opencv_converter.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/np_opencv_converter.dir/depend

