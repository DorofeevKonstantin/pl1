include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  NCURSES
#################
set(CONAN_NCURSES_ROOT "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953")
set(CONAN_INCLUDE_DIRS_NCURSES "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/include"
			"C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/include/ncursesw")
set(CONAN_LIB_DIRS_NCURSES "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/lib")
set(CONAN_BIN_DIRS_NCURSES "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/bin")
set(CONAN_RES_DIRS_NCURSES "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/res")
set(CONAN_SRC_DIRS_NCURSES )
set(CONAN_BUILD_DIRS_NCURSES "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/"
			"C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_NCURSES )
set(CONAN_LIBS_NCURSES panelw menuw formw ncurses++w ncursesw)
set(CONAN_PKG_LIBS_NCURSES panelw menuw formw ncurses++w ncursesw)
set(CONAN_SYSTEM_LIBS_NCURSES )
set(CONAN_FRAMEWORKS_NCURSES )
set(CONAN_FRAMEWORKS_FOUND_NCURSES "")  # Will be filled later
set(CONAN_DEFINES_NCURSES "-DNCURSES_STATIC")
set(CONAN_BUILD_MODULES_PATHS_NCURSES )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_NCURSES "NCURSES_STATIC")

set(CONAN_C_FLAGS_NCURSES "")
set(CONAN_CXX_FLAGS_NCURSES "")
set(CONAN_SHARED_LINKER_FLAGS_NCURSES "")
set(CONAN_EXE_LINKER_FLAGS_NCURSES "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_NCURSES_LIST "")
set(CONAN_CXX_FLAGS_NCURSES_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_NCURSES_LIST "")
set(CONAN_EXE_LINKER_FLAGS_NCURSES_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_NCURSES "${CONAN_FRAMEWORKS_NCURSES}" "_NCURSES" "")
# Append to aggregated values variable
set(CONAN_LIBS_NCURSES ${CONAN_PKG_LIBS_NCURSES} ${CONAN_SYSTEM_LIBS_NCURSES} ${CONAN_FRAMEWORKS_FOUND_NCURSES})


#################
###  GETOPT-FOR-VISUAL-STUDIO
#################
set(CONAN_GETOPT-FOR-VISUAL-STUDIO_ROOT "C:/Users/kostuan/.conan/data/getopt-for-visual-studio/20200201/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_GETOPT-FOR-VISUAL-STUDIO "C:/Users/kostuan/.conan/data/getopt-for-visual-studio/20200201/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_BIN_DIRS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_RES_DIRS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_SRC_DIRS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_BUILD_DIRS_GETOPT-FOR-VISUAL-STUDIO "C:/Users/kostuan/.conan/data/getopt-for-visual-studio/20200201/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_LIBS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_SYSTEM_LIBS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_FRAMEWORKS_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO "")  # Will be filled later
set(CONAN_DEFINES_GETOPT-FOR-VISUAL-STUDIO )
set(CONAN_BUILD_MODULES_PATHS_GETOPT-FOR-VISUAL-STUDIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GETOPT-FOR-VISUAL-STUDIO )

set(CONAN_C_FLAGS_GETOPT-FOR-VISUAL-STUDIO "")
set(CONAN_CXX_FLAGS_GETOPT-FOR-VISUAL-STUDIO "")
set(CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO "")
set(CONAN_EXE_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST "")
set(CONAN_CXX_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO "${CONAN_FRAMEWORKS_GETOPT-FOR-VISUAL-STUDIO}" "_GETOPT-FOR-VISUAL-STUDIO" "")
# Append to aggregated values variable
set(CONAN_LIBS_GETOPT-FOR-VISUAL-STUDIO ${CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO} ${CONAN_SYSTEM_LIBS_GETOPT-FOR-VISUAL-STUDIO} ${CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO})


#################
###  DIRENT
#################
set(CONAN_DIRENT_ROOT "C:/Users/kostuan/.conan/data/dirent/1.23.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_DIRENT "C:/Users/kostuan/.conan/data/dirent/1.23.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_DIRENT )
set(CONAN_BIN_DIRS_DIRENT )
set(CONAN_RES_DIRS_DIRENT )
set(CONAN_SRC_DIRS_DIRENT )
set(CONAN_BUILD_DIRS_DIRENT "C:/Users/kostuan/.conan/data/dirent/1.23.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_DIRENT )
set(CONAN_LIBS_DIRENT )
set(CONAN_PKG_LIBS_DIRENT )
set(CONAN_SYSTEM_LIBS_DIRENT )
set(CONAN_FRAMEWORKS_DIRENT )
set(CONAN_FRAMEWORKS_FOUND_DIRENT "")  # Will be filled later
set(CONAN_DEFINES_DIRENT )
set(CONAN_BUILD_MODULES_PATHS_DIRENT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_DIRENT )

set(CONAN_C_FLAGS_DIRENT "")
set(CONAN_CXX_FLAGS_DIRENT "")
set(CONAN_SHARED_LINKER_FLAGS_DIRENT "")
set(CONAN_EXE_LINKER_FLAGS_DIRENT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_DIRENT_LIST "")
set(CONAN_CXX_FLAGS_DIRENT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_DIRENT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_DIRENT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_DIRENT "${CONAN_FRAMEWORKS_DIRENT}" "_DIRENT" "")
# Append to aggregated values variable
set(CONAN_LIBS_DIRENT ${CONAN_PKG_LIBS_DIRENT} ${CONAN_SYSTEM_LIBS_DIRENT} ${CONAN_FRAMEWORKS_FOUND_DIRENT})


#################
###  NAIVE-TSEARCH
#################
set(CONAN_NAIVE-TSEARCH_ROOT "C:/Users/kostuan/.conan/data/naive-tsearch/0.1.1/_/_/package/3fb49604f9c2f729b85ba3115852006824e72cab")
set(CONAN_INCLUDE_DIRS_NAIVE-TSEARCH "C:/Users/kostuan/.conan/data/naive-tsearch/0.1.1/_/_/package/3fb49604f9c2f729b85ba3115852006824e72cab/include"
			"C:/Users/kostuan/.conan/data/naive-tsearch/0.1.1/_/_/package/3fb49604f9c2f729b85ba3115852006824e72cab/include/naive-tsearch")
set(CONAN_LIB_DIRS_NAIVE-TSEARCH )
set(CONAN_BIN_DIRS_NAIVE-TSEARCH )
set(CONAN_RES_DIRS_NAIVE-TSEARCH )
set(CONAN_SRC_DIRS_NAIVE-TSEARCH )
set(CONAN_BUILD_DIRS_NAIVE-TSEARCH "C:/Users/kostuan/.conan/data/naive-tsearch/0.1.1/_/_/package/3fb49604f9c2f729b85ba3115852006824e72cab/")
set(CONAN_FRAMEWORK_DIRS_NAIVE-TSEARCH )
set(CONAN_LIBS_NAIVE-TSEARCH )
set(CONAN_PKG_LIBS_NAIVE-TSEARCH )
set(CONAN_SYSTEM_LIBS_NAIVE-TSEARCH )
set(CONAN_FRAMEWORKS_NAIVE-TSEARCH )
set(CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH "")  # Will be filled later
set(CONAN_DEFINES_NAIVE-TSEARCH "-DNAIVE_TSEARCH_HDRONLY")
set(CONAN_BUILD_MODULES_PATHS_NAIVE-TSEARCH )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_NAIVE-TSEARCH "NAIVE_TSEARCH_HDRONLY")

set(CONAN_C_FLAGS_NAIVE-TSEARCH "")
set(CONAN_CXX_FLAGS_NAIVE-TSEARCH "")
set(CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH "")
set(CONAN_EXE_LINKER_FLAGS_NAIVE-TSEARCH "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_NAIVE-TSEARCH_LIST "")
set(CONAN_CXX_FLAGS_NAIVE-TSEARCH_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_LIST "")
set(CONAN_EXE_LINKER_FLAGS_NAIVE-TSEARCH_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH "${CONAN_FRAMEWORKS_NAIVE-TSEARCH}" "_NAIVE-TSEARCH" "")
# Append to aggregated values variable
set(CONAN_LIBS_NAIVE-TSEARCH ${CONAN_PKG_LIBS_NAIVE-TSEARCH} ${CONAN_SYSTEM_LIBS_NAIVE-TSEARCH} ${CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "Visual Studio")
set(CONAN_SETTINGS_COMPILER_RUNTIME "MD")
set(CONAN_SETTINGS_COMPILER_VERSION "16")
set(CONAN_SETTINGS_OS "Windows")
set(CONAN_SETTINGS_OS_BUILD "Windows")

set(CONAN_DEPENDENCIES ncurses getopt-for-visual-studio dirent naive-tsearch)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/include"
			"C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/include/ncursesw"
			"C:/Users/kostuan/.conan/data/getopt-for-visual-studio/20200201/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/Users/kostuan/.conan/data/dirent/1.23.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"C:/Users/kostuan/.conan/data/naive-tsearch/0.1.1/_/_/package/3fb49604f9c2f729b85ba3115852006824e72cab/include"
			"C:/Users/kostuan/.conan/data/naive-tsearch/0.1.1/_/_/package/3fb49604f9c2f729b85ba3115852006824e72cab/include/naive-tsearch" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/res" ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS panelw menuw formw ncurses++w ncursesw ${CONAN_LIBS})
set(CONAN_PKG_LIBS panelw menuw formw ncurses++w ncursesw ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS  ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DNAIVE_TSEARCH_HDRONLY"
			"-DNCURSES_STATIC" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/"
			"C:/Users/kostuan/.conan/data/ncurses/6.3/_/_/package/c27be33092508f127d9ef12a35865c92fb2e9953/lib/cmake"
			"C:/Users/kostuan/.conan/data/getopt-for-visual-studio/20200201/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"C:/Users/kostuan/.conan/data/dirent/1.23.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"C:/Users/kostuan/.conan/data/naive-tsearch/0.1.1/_/_/package/3fb49604f9c2f729b85ba3115852006824e72cab/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES "${CONAN_SYSTEM_LIBS_NCURSES} ${CONAN_FRAMEWORKS_FOUND_NCURSES} CONAN_PKG::getopt-for-visual-studio CONAN_PKG::dirent CONAN_PKG::naive-tsearch")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES}" "${CONAN_LIB_DIRS_NCURSES}"
                                  CONAN_PACKAGE_TARGETS_NCURSES "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES}"
                                  "" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_NCURSES_DEBUG} ${CONAN_FRAMEWORKS_FOUND_NCURSES_DEBUG} CONAN_PKG::getopt-for-visual-studio CONAN_PKG::dirent CONAN_PKG::naive-tsearch")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_DEBUG}" "${CONAN_LIB_DIRS_NCURSES_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_DEBUG "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG}"
                                  "debug" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_NCURSES_RELEASE} ${CONAN_FRAMEWORKS_FOUND_NCURSES_RELEASE} CONAN_PKG::getopt-for-visual-studio CONAN_PKG::dirent CONAN_PKG::naive-tsearch")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_RELEASE}" "${CONAN_LIB_DIRS_NCURSES_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_RELEASE "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE}"
                                  "release" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_NCURSES_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_NCURSES_RELWITHDEBINFO} CONAN_PKG::getopt-for-visual-studio CONAN_PKG::dirent CONAN_PKG::naive-tsearch")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_NCURSES_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_NCURSES_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_NCURSES_MINSIZEREL} CONAN_PKG::getopt-for-visual-studio CONAN_PKG::dirent CONAN_PKG::naive-tsearch")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_MINSIZEREL}" "${CONAN_LIB_DIRS_NCURSES_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_MINSIZEREL "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" ncurses)

    add_library(CONAN_PKG::ncurses INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_NCURSES} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_NCURSES_RELEASE} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_NCURSES_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_NCURSES_MINSIZEREL} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_NCURSES_DEBUG} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_NCURSES}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_NCURSES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_NCURSES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_NCURSES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_NCURSES_DEBUG}>)
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_NCURSES}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_NCURSES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_NCURSES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_NCURSES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_NCURSES_DEBUG}>)
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_NCURSES_LIST} ${CONAN_CXX_FLAGS_NCURSES_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_NCURSES_RELEASE_LIST} ${CONAN_CXX_FLAGS_NCURSES_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_NCURSES_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_NCURSES_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_NCURSES_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_NCURSES_DEBUG_LIST}  ${CONAN_CXX_FLAGS_NCURSES_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GETOPT-FOR-VISUAL-STUDIO} ${CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO}" "${CONAN_LIB_DIRS_GETOPT-FOR-VISUAL-STUDIO}"
                                  CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES}"
                                  "" getopt-for-visual-studio)
    set(_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEBUG}" "${CONAN_LIB_DIRS_GETOPT-FOR-VISUAL-STUDIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_DEBUG "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_DEBUG}"
                                  "debug" getopt-for-visual-studio)
    set(_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GETOPT-FOR-VISUAL-STUDIO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_RELEASE}" "${CONAN_LIB_DIRS_GETOPT-FOR-VISUAL-STUDIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_RELEASE "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELEASE}"
                                  "release" getopt-for-visual-studio)
    set(_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" getopt-for-visual-studio)
    set(_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL}" "${CONAN_LIB_DIRS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL "${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" getopt-for-visual-studio)

    add_library(CONAN_PKG::getopt-for-visual-studio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::getopt-for-visual-studio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO} ${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_RELEASE} ${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL} ${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GETOPT-FOR-VISUAL-STUDIO_DEBUG} ${_CONAN_PKG_LIBS_GETOPT-FOR-VISUAL-STUDIO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GETOPT-FOR-VISUAL-STUDIO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::getopt-for-visual-studio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GETOPT-FOR-VISUAL-STUDIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GETOPT-FOR-VISUAL-STUDIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GETOPT-FOR-VISUAL-STUDIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::getopt-for-visual-studio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GETOPT-FOR-VISUAL-STUDIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GETOPT-FOR-VISUAL-STUDIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GETOPT-FOR-VISUAL-STUDIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::getopt-for-visual-studio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST} ${CONAN_CXX_FLAGS_GETOPT-FOR-VISUAL-STUDIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GETOPT-FOR-VISUAL-STUDIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GETOPT-FOR-VISUAL-STUDIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GETOPT-FOR-VISUAL-STUDIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GETOPT-FOR-VISUAL-STUDIO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_DIRENT} ${CONAN_FRAMEWORKS_FOUND_DIRENT} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DIRENT_DEPENDENCIES "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DIRENT}" "${CONAN_LIB_DIRS_DIRENT}"
                                  CONAN_PACKAGE_TARGETS_DIRENT "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES}"
                                  "" dirent)
    set(_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_DIRENT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_DIRENT_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DIRENT_DEBUG}" "${CONAN_LIB_DIRS_DIRENT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_DIRENT_DEBUG "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_DEBUG}"
                                  "debug" dirent)
    set(_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_DIRENT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_DIRENT_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DIRENT_RELEASE}" "${CONAN_LIB_DIRS_DIRENT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_DIRENT_RELEASE "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELEASE}"
                                  "release" dirent)
    set(_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_DIRENT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_DIRENT_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DIRENT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_DIRENT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_DIRENT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" dirent)
    set(_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_DIRENT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_DIRENT_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DIRENT_MINSIZEREL}" "${CONAN_LIB_DIRS_DIRENT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_DIRENT_MINSIZEREL "${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" dirent)

    add_library(CONAN_PKG::dirent INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::dirent PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_DIRENT} ${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DIRENT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_DIRENT_RELEASE} ${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DIRENT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_DIRENT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DIRENT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_DIRENT_MINSIZEREL} ${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DIRENT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_DIRENT_DEBUG} ${_CONAN_PKG_LIBS_DIRENT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DIRENT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DIRENT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::dirent PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_DIRENT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_DIRENT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_DIRENT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_DIRENT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DIRENT_DEBUG}>)
    set_property(TARGET CONAN_PKG::dirent PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_DIRENT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_DIRENT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_DIRENT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_DIRENT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_DIRENT_DEBUG}>)
    set_property(TARGET CONAN_PKG::dirent PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_DIRENT_LIST} ${CONAN_CXX_FLAGS_DIRENT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_DIRENT_RELEASE_LIST} ${CONAN_CXX_FLAGS_DIRENT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_DIRENT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_DIRENT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_DIRENT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_DIRENT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_DIRENT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_DIRENT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES "${CONAN_SYSTEM_LIBS_NAIVE-TSEARCH} ${CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NAIVE-TSEARCH}" "${CONAN_LIB_DIRS_NAIVE-TSEARCH}"
                                  CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES}"
                                  "" naive-tsearch)
    set(_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_NAIVE-TSEARCH_DEBUG} ${CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NAIVE-TSEARCH_DEBUG}" "${CONAN_LIB_DIRS_NAIVE-TSEARCH_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_DEBUG "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_DEBUG}"
                                  "debug" naive-tsearch)
    set(_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_NAIVE-TSEARCH_RELEASE} ${CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NAIVE-TSEARCH_RELEASE}" "${CONAN_LIB_DIRS_NAIVE-TSEARCH_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_RELEASE "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELEASE}"
                                  "release" naive-tsearch)
    set(_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_NAIVE-TSEARCH_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NAIVE-TSEARCH_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_NAIVE-TSEARCH_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" naive-tsearch)
    set(_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_NAIVE-TSEARCH_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_NAIVE-TSEARCH_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NAIVE-TSEARCH_MINSIZEREL}" "${CONAN_LIB_DIRS_NAIVE-TSEARCH_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_MINSIZEREL "${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" naive-tsearch)

    add_library(CONAN_PKG::naive-tsearch INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::naive-tsearch PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH} ${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NAIVE-TSEARCH_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_RELEASE} ${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NAIVE-TSEARCH_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NAIVE-TSEARCH_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_MINSIZEREL} ${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NAIVE-TSEARCH_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_NAIVE-TSEARCH_DEBUG} ${_CONAN_PKG_LIBS_NAIVE-TSEARCH_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NAIVE-TSEARCH_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NAIVE-TSEARCH_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::naive-tsearch PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_NAIVE-TSEARCH}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_NAIVE-TSEARCH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_NAIVE-TSEARCH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_NAIVE-TSEARCH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_NAIVE-TSEARCH_DEBUG}>)
    set_property(TARGET CONAN_PKG::naive-tsearch PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_NAIVE-TSEARCH}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_NAIVE-TSEARCH_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_NAIVE-TSEARCH_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_NAIVE-TSEARCH_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_NAIVE-TSEARCH_DEBUG}>)
    set_property(TARGET CONAN_PKG::naive-tsearch PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_NAIVE-TSEARCH_LIST} ${CONAN_CXX_FLAGS_NAIVE-TSEARCH_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_NAIVE-TSEARCH_RELEASE_LIST} ${CONAN_CXX_FLAGS_NAIVE-TSEARCH_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_NAIVE-TSEARCH_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_NAIVE-TSEARCH_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_NAIVE-TSEARCH_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_NAIVE-TSEARCH_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_NAIVE-TSEARCH_DEBUG_LIST}  ${CONAN_CXX_FLAGS_NAIVE-TSEARCH_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::ncurses CONAN_PKG::getopt-for-visual-studio CONAN_PKG::dirent CONAN_PKG::naive-tsearch)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1930 = VS 17.0 (v143 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "17" AND NOT((MSVC_VERSION EQUAL 1930) OR (MSVC_VERSION GREATER 1930))) OR
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

set(CONAN_USER_NCURSES_lib_suffix "w")