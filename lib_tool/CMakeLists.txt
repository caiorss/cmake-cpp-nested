cmake_minimum_required(VERSION 3.9)
project(CMake_With_Makefile)

#========== Global Configurations =============#
#----------------------------------------------#
set(CMAKE_CXX_STANDARD 17)     
set(CMAKE_VERBOSE_MAKEFILE ON)
# Export ALL DLLs symbols on Windows without __declspec(xxxx) annotations.
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS true)

#========== Targets Configurations ============#

               add_library( tool STATIC tool.cpp tool.hpp )
target_include_directories( tool PUBLIC . )

add_library( lib::tool ALIAS tool )