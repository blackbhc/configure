#include "foo.h"
#include <cmath>
#include <fmt/base.h>

extern "C" {

void hello_cpp(void) { fmt::println("Hello world from cpp."); }

void foo(void) { ; }

double hypot(double x, double y) { return std::sqrt(x * x + y * y); }

double avg(const double* x, int len)
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

auto distance_to_origin(Point* p) -> double { return hypot(p->x, p->y); };

double my_sqrt(double x) { return std::sqrt(x); }
}
