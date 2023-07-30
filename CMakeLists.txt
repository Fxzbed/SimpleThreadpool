#CMakeLists for SimpleThreadPool

cmake_minimum_required(VERSION 3.15)
project(SimpleThreadPool)

#stand by c++17
set(CMAKE_CXX_STANDARD 17)

#set path to src include main
set(PathToSrc src/threadPool.cpp)
set(PathToinc include/threadPool.hpp)
set(PathTomain main_Test.cpp)

#complie 
add_executable(SimpleThreadPool ${PathToinc} ${PathToSrc} ${PathTomain})


