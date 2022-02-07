cmake_minimum_required(VERSION 3.16.2)
project(CmakeExamples)

add_subdirectory(library)

add_executable(cmake3 main.c library/library.h)
target_link_libraries(cmake3 library)