               add_library ( util SHARED util.cpp util.hpp)
target_include_directories ( util PUBLIC . )
               add_library ( lib::util ALIAS util )
