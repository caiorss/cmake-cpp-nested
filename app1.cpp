#include <iostream>

#include <util.hpp>
#include <tool.hpp>

int main(int argc, char** argv)
{
	std::cout << " [INFO] Application 2 Called Ok." << std::endl;

	util::util_function(100);
	tool::too_lib_function();

#ifdef _WIN32
	std::cout << " Type RETURN to exit " << "\n";
	std::cin.get();
#endif	

	return 0;
}
