cmake_minimum_required(VERSION 3.16.2)
project(CmakeExamples)

set(LIB_HEADERS utils.h)
set(LIB_SOURCE utils.c)
add_library(utils STATIC ${LIB_SOURCE} ${LIB_HEADERS})

set(MAIN_SOURCE main.c)
add_executable(cmake2 ${MAIN_SOURCE} ${LIB_HEADERS})
target_link_libraries(cmake2 utils)