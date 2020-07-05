cmake_minimum_required(VERSION 3.9)
project(CMake_With_Makefile)

#========== Global Configurations =============#
#----------------------------------------------#

set(CMAKE_CXX_STANDARD 17)     
set(CMAKE_VERBOSE_MAKEFILE ON)

# Export ALL DLLs symbols on Windows without __declspec(xxxx) annotations.
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS true)

#========== Targets Configurations ============#

               add_library ( util SHARED util.cpp util.hpp)
target_include_directories ( util PUBLIC . )
               add_library ( lib::util ALIAS util )
