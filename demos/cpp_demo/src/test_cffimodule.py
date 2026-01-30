import numpy as np
import os
import sys

sys.path.append(os.path.abspath("./build"))
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
