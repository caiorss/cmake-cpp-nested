#include "util.hpp"

#include <iostream> 

namespace util {
    void util_function(int n)
    {
        std::cout << " [TRACE] util_function() called with n = " << n << '\n';
    }
}