#!/bin/bash

chmod +x trains
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/lib
./trains
