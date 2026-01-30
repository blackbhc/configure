from cffi import FFI
import os

# file to the binary dynamic library file: use the cffi API mode
# create an FFI object
ffi = FFI()

# inform Python the function names
ffi.cdef("void foo(void);")  # ";" is mandatory here
ffi.cdef("double avg(const double*, int);")
ffi.cdef("void hello_cpp(void);")
ffi.cdef("double my_sqrt(double);")

ffi.set_source(
    "cffi_module",
    """
    #include "foo.h"
    extern "C" {
        void foo(void);
        void hello_cpp(void);
        double my_sqrt(double);
        double avg(const double* x, int len);
    }

    """,  # inform cpp compiler the function names
    source_extension=".cpp",  # mandatory for cpp codes
    libraries=["foo"],  # for Linux, may require ['m']
    library_dirs=[os.path.abspath("./build")],  # for Linux, may require ['m']
    include_dirs=[os.path.abspath("./include")],
    extra_link_args=["-Wl,-rpath," + os.path.abspath("./build")],
)

if __name__ == "__main__":
    ffi.compile(verbose=True, tmpdir=os.path.abspath("./build"))
