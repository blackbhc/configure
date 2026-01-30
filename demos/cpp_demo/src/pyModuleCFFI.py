from cffi import FFI

# file to the binary dynamic library file: use the cffi API mode
# create an FFI object
ffi = FFI()

ffi.cdef("void foo(void);")  # ";" is mandatory here
ffi.cdef("double avg(const double*, int);")
ffi.cdef("void hello_cpp(void);")
ffi.cdef("double my_sqrt(double);")

ffi.set_source(
    "cffi_module",
    """
    #include <cmath>
    #include <cstdio>

    extern "C" {
        double my_sqrt(double x) {
            return std::sqrt(x);
        }
    }

    extern "C" void hello_cpp(void)
    { std::printf("Hello world from cpp.\\n"); }

    extern "C" void foo(void) { ; }

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

    """,
    source_extension=".cpp",  # mandatory for cpp codes
    libraries=[],  # for Linux, may require ['m']
)

if __name__ == "__main__":
    ffi.compile(verbose=True, tmpdir=".")


""" After run the above script:
import numpy as np
from cffi_module import ffi, lib

# create the numpy array
data = np.array(np.arange(10), dtype=np.float64)

# call the numpy.ndarray data buffer
ptr = ffi.from_buffer("double *", data)

# call the functions
lib.hello_cpp()
print(f"sqrt_cpp(9)={lib.my_sqrt(9)}")
result = lib.avg(ptr, len(data))
print(f"Average: {result}")
"""
