               add_library( tool STATIC tool.cpp tool.hpp )
target_include_directories( tool PUBLIC . )

add_library( lib::tool ALIAS tool )
