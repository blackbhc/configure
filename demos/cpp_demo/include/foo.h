extern "C" {

void foo(void);
void hello_cpp(void);
using Point = struct Point
{
    double x, y;
};

double hypot(double x, double y);

double avg(const double* x, int len);

auto distance_to_origin(Point* p) -> double;

double my_sqrt(double x);
}
