cmake_minimum_required (VERSION 3.16.2)
project (LibsdlExamples)

set(SDL2_INCLUDE_DIR C:/_main/_univer/Documents/Chelgu/PP/Prog/C/rep/02-Libraries-Examples/2.libsdl/SDL2-devel-2.0.20-VC/SDL2-2.0.20/include)
set(SDL2_LIBRARIES SDL2.lib SDL2main.lib)

add_executable(Tank main.c)
target_link_directories(Tank PUBLIC C:/_main/_univer/Documents/Chelgu/PP/Prog/C/rep/02-Libraries-Examples/2.libsdl/SDL2-devel-2.0.20-VC/SDL2-2.0.20/lib/x64)
target_include_directories(Tank PUBLIC ${SDL2_INCLUDE_DIR})
target_link_libraries(Tank ${SDL2_LIBRARIES})