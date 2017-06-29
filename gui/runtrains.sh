#!/bin/bash

chmod +x trains
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/lib
./trains $'load -h 10.15.167.5 \"ARM/laburke/kernel.elf\"\ngo\n' \
         'Taggart Transcontinental Control Terminal' \
         /dev/pts/4
