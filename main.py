from utils.allocateGPU import *

#allocate_gpu()

import arguments
import _main

if __name__ == "__main__":
    args = arguments.parse_args()
    _main.main(args)
