#!/bin/bash -ex
hipcc -std=c++11 --amdgpu-target=gfx906 forEach.cu -o forEach
