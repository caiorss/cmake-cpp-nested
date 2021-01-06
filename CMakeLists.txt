cmake_minimum_required(VERSION 3.9)
project(CMake_With_Makefile)

#========== Global Configurations =============#
#----------------------------------------------#

set(CMAKE_CXX_STANDARD 17)     
set(CMAKE_VERBOSE_MAKEFILE ON)

# Export ALL DLLs symbols on Windows without __declspec(xxxx) annotations.
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS true)

function(ADD_RUN_TARGET tname target)
    add_custom_target( ${tname}
        COMMAND ${target}
        DEPENDS ${target}
        WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
    )
endfunction()

# Fix DLL not found problem on Windows 
# Note: Windows shared libraries do not have RPATH or RUNPATH
# DLLs are searched first at current directories and then in directories 
# listed in $PATH variable.
if(WIN32)
    set(LIBRARY_OUTPUT_PATH    "${CMAKE_BINARY_DIR}")
    set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}")
endif()


    #=============================================#
    #  T A R G E T S  C O N F I G U R A T I O N   #  
    #=============================================#


add_subdirectory(lib_util)
add_subdirectory(lib_tool)

       add_executable( app1 app1.cpp )
target_link_libraries( app1 lib::util lib::tool )


if(_WIN32)
    set_target_properties( lib::util PROPERTIES 
                                     OUTPUT_NAME Util 
                                     CLEAN_DIRECTORY_OUTPUT 1 )  
endif()

# Set RPATH in the executable for making it relocatable on Unix.
# It allows installing the application on any directory or 
# running the application from any directory without 
# 'symbol not found or library not found' errros. 
#
# Note: The variable $ORIGIN is the executable absolute directory
if(UNIX AND NOT APPLE)
    set_target_properties( app1 PROPERTIES INSTALL_RPATH "$ORIGIN:$ORIGIN/../lib")                       
elseif(APPLE)
    # For MacOSX (MacO - Binary Files)
    set_target_properties( app1 PROPERTIES INSTALL_RPATH "@executable_path/../lib")                       
endif()

       add_executable( app2 app2.cpp )
target_link_libraries( app2 lib::util lib::tool)
# set_target_properties( app2 PROPERTIES INSTALL_RPATH "$ORIGIN/../lib")                       


ADD_RUN_TARGET(run-app1 app1)
ADD_RUN_TARGET(run-app2 app2)

    #===========================================#
    #  I N S T A L  L    T A R G E T            #
    #===========================================#


install( TARGETS  app1 app2 util tool 
         # Executables and DLLs (Windows Only)
         RUNTIME  DESTINATION ${CMAKE_INSTALL_BINDIR}            
         # Shared libraries: *.so or *.dylib 
         LIBRARY  DESTINATION ${CMAKE_INSTALL_LIBDIR}          
         # Static libraries: *.a 
         ARCHIVE  DESTINATION ${CMAKE_INSTALL_LIBDIR}

)

install(FILES LICENSE.txt DESTINATION data)
