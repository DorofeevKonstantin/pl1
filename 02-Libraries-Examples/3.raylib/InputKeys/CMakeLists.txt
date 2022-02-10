cmake_minimum_required(VERSION 3.20)
project(RaylibExamples)

set(raylib_DIR C:/_main/_univer/Documents/Chelgu/PP/Prog/C/rep/02-Libraries-Examples/3.raylib/raylib-4.0.0/lib/cmake/raylib)
set(raylib_LIBRARY C:/_main/_univer/Documents/Chelgu/PP/Prog/C/rep/02-Libraries-Examples/3.raylib/raylib-4.0.0/lib/raylib.lib)
set(raylib_INCLUDE_DIR C:/_main/_univer/Documents/Chelgu/PP/Prog/C/rep/02-Libraries-Examples/3.raylib/raylib-4.0.0/include)

add_executable(InputKeys main.c)

target_include_directories(InputKeys PUBLIC ${raylib_INCLUDE_DIR})
target_link_directories(InputKeys PUBLIC C:/_main/_univer/Documents/Chelgu/PP/Prog/C/rep/02-Libraries-Examples/3.raylib/raylib-4.0.0/lib)
target_link_libraries(InputKeys raylib winmm.lib)