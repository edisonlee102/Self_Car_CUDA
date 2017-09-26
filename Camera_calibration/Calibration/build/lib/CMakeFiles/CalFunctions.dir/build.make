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
CMAKE_SOURCE_DIR = /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/CalFunctions.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/CalFunctions.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/CalFunctions.dir/flags.make

lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o: lib/CMakeFiles/CalFunctions.dir/flags.make
lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o: ../lib/IOfile.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o"
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/CalFunctions.dir/IOfile.cpp.o -c /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/lib/IOfile.cpp

lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CalFunctions.dir/IOfile.cpp.i"
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/lib/IOfile.cpp > CMakeFiles/CalFunctions.dir/IOfile.cpp.i

lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CalFunctions.dir/IOfile.cpp.s"
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/lib/IOfile.cpp -o CMakeFiles/CalFunctions.dir/IOfile.cpp.s

lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.requires:
.PHONY : lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.requires

lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.provides: lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.requires
	$(MAKE) -f lib/CMakeFiles/CalFunctions.dir/build.make lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.provides.build
.PHONY : lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.provides

lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.provides.build: lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o

lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o: lib/CMakeFiles/CalFunctions.dir/flags.make
lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o: ../lib/calibration.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o"
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/CalFunctions.dir/calibration.cpp.o -c /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/lib/calibration.cpp

lib/CMakeFiles/CalFunctions.dir/calibration.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CalFunctions.dir/calibration.cpp.i"
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/lib/calibration.cpp > CMakeFiles/CalFunctions.dir/calibration.cpp.i

lib/CMakeFiles/CalFunctions.dir/calibration.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CalFunctions.dir/calibration.cpp.s"
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/lib/calibration.cpp -o CMakeFiles/CalFunctions.dir/calibration.cpp.s

lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.requires:
.PHONY : lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.requires

lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.provides: lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.requires
	$(MAKE) -f lib/CMakeFiles/CalFunctions.dir/build.make lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.provides.build
.PHONY : lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.provides

lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.provides.build: lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o

# Object files for target CalFunctions
CalFunctions_OBJECTS = \
"CMakeFiles/CalFunctions.dir/IOfile.cpp.o" \
"CMakeFiles/CalFunctions.dir/calibration.cpp.o"

# External object files for target CalFunctions
CalFunctions_EXTERNAL_OBJECTS =

lib/libCalFunctions.a: lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o
lib/libCalFunctions.a: lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o
lib/libCalFunctions.a: lib/CMakeFiles/CalFunctions.dir/build.make
lib/libCalFunctions.a: lib/CMakeFiles/CalFunctions.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libCalFunctions.a"
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/CalFunctions.dir/cmake_clean_target.cmake
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CalFunctions.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/CalFunctions.dir/build: lib/libCalFunctions.a
.PHONY : lib/CMakeFiles/CalFunctions.dir/build

lib/CMakeFiles/CalFunctions.dir/requires: lib/CMakeFiles/CalFunctions.dir/IOfile.cpp.o.requires
lib/CMakeFiles/CalFunctions.dir/requires: lib/CMakeFiles/CalFunctions.dir/calibration.cpp.o.requires
.PHONY : lib/CMakeFiles/CalFunctions.dir/requires

lib/CMakeFiles/CalFunctions.dir/clean:
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/CalFunctions.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/CalFunctions.dir/clean

lib/CMakeFiles/CalFunctions.dir/depend:
	cd /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/lib /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib /home/ubuntu/Self_Car_with_CUDA/opencv_cvmat_convert/numpy-opencv-converter/Calibration/build/lib/CMakeFiles/CalFunctions.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/CalFunctions.dir/depend

