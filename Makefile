# GNU Make file script for easier compilation from
# command line

all: help 

help:
	@echo "Build options "
	@echo " $ make debug                 => Debug build at _debug directory "
	@echo " $ make release               => Release build at _release directory "	
	@echo " $ make install prefix=<PATH> => Build in release mode and install app. at prefix path. "		

debug:
	@echo " =>> DEBUG build "
	# Only configs if '_debug' directory does not exist yet.
	[ ! -f _debug ] && cmake --config Debug -B_debug -H.    
	cmake --build _debug --target

release:
	@echo " =>> RELEASE build " && sleep 1 
	[ ! -f _release ] && cmake --config Release -B_release -H. 
	cmake --build _release --target

install:
	@echo " =>> INSTALL release" && sleep 1 
	cmake --config Release -B_install -H. -DCMAKE_INSTALL_PREFIX=${prefix}
	cmake --build _install --target install

run-app1:
	@echo " =>> Run app1 " && sleep 1
	[ ! -f _debug ] && cmake --config Debug -B_debug -H.    
	cmake --build _debug --target run-app1 

clean:
	rm -rfv ./_debug ./_release ./_install  

clean-debug:
	rm -rf -v ./_debug 

clean-release:
	rm -rf -v ./_release 

