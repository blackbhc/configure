// #include "foo.h"
#include <cmath>
#include <fmt/base.h>
extern "C" using Point = struct Point
{
    double x, y;
};

extern "C" void hello_cpp(void) { fmt::println("Hello world from cpp."); }

extern "C" void foo(void) { ; }

extern "C" double hypot(double x, double y) { return std::sqrt(x * x + y * y); }

extern "C" double avg(const double* x, int len)
{
    double sum{0.0};
    // NOLINTBEGIN
    for (int i = 0; i < len; ++i)
    {
        sum += x[i];
    }
    // NOLINTEND
    return sum / len;
}

extern "C" auto distance_to_origin(Point* p) -> double
{
    return hypot(p->x, p->y);
};
