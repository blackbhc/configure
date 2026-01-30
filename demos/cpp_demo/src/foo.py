from cffi import FFI
import numpy as np

# file to the binary dynamic library file: use the cffi ABI mode
libfile = "./build/libfoo.so"
# create an FFI object
ffi = FFI()

# -------------------- basic usage
foolib = ffi.dlopen(libfile)  # open the lib
# define the C API
ffi.cdef("void foo(void);")  # ";" is mandatory here
ffi.cdef("void hello_cpp(void);")
# extern "C" void hello_cpp(void) { fmt::println("Hello world from cpp."); }

# call the function
result = foolib.foo()
result = foolib.hello_cpp()

# -------------------- call a function with a struct
# define the struct in ffi
ffi.cdef("""
struct Point {
    double x, y;
};
""")
# create an instance
point = ffi.new("struct Point*", {"x": 6.0, "y": 8.0})
"""
# OR:
point = ffi.new("struct Point*")
point.x = 6.0
point.y = 8.0
"""
# define the function with a struct parameter (as a pointer)
ffi.cdef("double distance_to_origin(struct Point*);")
# call the function
d = foolib.distance_to_origin(point)
print(f"The distance of point(x={point.x}, y={point.y}) to origin={d}")

# -------------------- call a function with double parameters
# a basic double calculator
ffi.cdef("double hypot(double x, double y);")
point = ffi.new("struct Point*", {"x": 3.0, "y": 4.0})
res = foolib.hypot(point.x, point.y)
print(f"Update point: x={point.x}, y={point.y}")
print(f"sqrt(point.x^2 + point.y^2)={res}")

# -------------------- call a function with arrays
# a average calculator
ffi.cdef("double avg(const double* arrPtr, int arrLen);")
array = np.arange(10, dtype=np.double)
print(
    f"The average of {array}={foolib.avg(ffi.from_buffer("double[]", array), len(array))}"
)
