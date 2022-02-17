cmake_minimum_required(VERSION 3.20)
project(glfwExample)

include(conanbuildinfo.cmake)
conan_basic_setup()

add_executable(helloWorld main.c)
target_link_libraries(helloWorld ${CONAN_LIBS})