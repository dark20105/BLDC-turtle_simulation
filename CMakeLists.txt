cmake_minimum_required(VERSION 3.12)

project(BLDC_turtle_simulation)

set(MEX_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/scripts)

set(CMAKE_CXX_STANDARD_REQUIRED 17)
set(CMAKE_C_STANDARD_REQUIRED 11)

# Include toolchain file

# add_subdirectory(s-func)
add_subdirectory(mex)
