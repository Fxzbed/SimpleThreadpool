# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/CodeWSL/threadPool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/CodeWSL/threadPool/build

# Include any dependencies generated for this target.
include CMakeFiles/SimpleThreadPool.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/SimpleThreadPool.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/SimpleThreadPool.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SimpleThreadPool.dir/flags.make

CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o: CMakeFiles/SimpleThreadPool.dir/flags.make
CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o: ../src/threadPool.cpp
CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o: CMakeFiles/SimpleThreadPool.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CodeWSL/threadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o -MF CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o.d -o CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o -c /root/CodeWSL/threadPool/src/threadPool.cpp

CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/CodeWSL/threadPool/src/threadPool.cpp > CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.i

CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/CodeWSL/threadPool/src/threadPool.cpp -o CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.s

CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o: CMakeFiles/SimpleThreadPool.dir/flags.make
CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o: ../main_Test.cpp
CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o: CMakeFiles/SimpleThreadPool.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CodeWSL/threadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o -MF CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o.d -o CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o -c /root/CodeWSL/threadPool/main_Test.cpp

CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/CodeWSL/threadPool/main_Test.cpp > CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.i

CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/CodeWSL/threadPool/main_Test.cpp -o CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.s

# Object files for target SimpleThreadPool
SimpleThreadPool_OBJECTS = \
"CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o" \
"CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o"

# External object files for target SimpleThreadPool
SimpleThreadPool_EXTERNAL_OBJECTS =

SimpleThreadPool: CMakeFiles/SimpleThreadPool.dir/src/threadPool.cpp.o
SimpleThreadPool: CMakeFiles/SimpleThreadPool.dir/main_Test.cpp.o
SimpleThreadPool: CMakeFiles/SimpleThreadPool.dir/build.make
SimpleThreadPool: CMakeFiles/SimpleThreadPool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/CodeWSL/threadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable SimpleThreadPool"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SimpleThreadPool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SimpleThreadPool.dir/build: SimpleThreadPool
.PHONY : CMakeFiles/SimpleThreadPool.dir/build

CMakeFiles/SimpleThreadPool.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SimpleThreadPool.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SimpleThreadPool.dir/clean

CMakeFiles/SimpleThreadPool.dir/depend:
	cd /root/CodeWSL/threadPool/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/CodeWSL/threadPool /root/CodeWSL/threadPool /root/CodeWSL/threadPool/build /root/CodeWSL/threadPool/build /root/CodeWSL/threadPool/build/CMakeFiles/SimpleThreadPool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SimpleThreadPool.dir/depend
