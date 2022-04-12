cmake_minimum_required(VERSION 3.20)
project(mazeGenerator)

include(conanbuildinfo.cmake)
conan_basic_setup()

file(GLOB HEADERS src/*.h)
AUX_SOURCE_DIRECTORY(src SOURCES)

add_executable(mazeGenerator ${SOURCES} ${HEADERS})
target_link_libraries(mazeGenerator ${CONAN_LIBS})